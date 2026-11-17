import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/screen_size.dart';
import '../providers/progress_provider.dart';
import '../services/pronunciation_text.dart';

// ── Umbrales de puntaje ──────────────────────────────────────────────────────
// ≥ 90 perfecta (calculateScore solo pasa de 89 si coinciden TODAS las
// palabras) · 60-89 pasa y da XP · < 60 cuenta como fallo (onFallo).
const kScorePerfecto = 90.0;
const kScorePasa = 60.0;

// ── Colores exactos (CAMBIO 6) ───────────────────────────────────────────────
const _kGreen = Color(0xFF00E676);
const _kGreenGlow = Color(0x1F00E676); // rgba(0,230,118,0.12)
const _kYellow = Color(0xFFFFD600);
const _kRed = Color(0xFFFF5252);

// ─────────────────────────────────────────────────────────────────────────────
class PronunciacionWidget extends ConsumerStatefulWidget {
  final Map<String, dynamic> ejercicio;
  final VoidCallback onResuelto;
  final VoidCallback onContinuar;
  final VoidCallback? onPerfecto; // called when pronunciation is perfect (≥ 90)
  final VoidCallback? onFallo; // called when a result comes back under 60
  // Diferencias del último intento puntuado (null si no hay), justo antes de
  // onFallo/onResuelto: la pantalla las muestra bajo la respuesta revelada.
  final ValueChanged<PronunciationFeedback?>? onCorreccion;

  /// Cada intento con puntaje (0-100), acierte o no. Los intentos sin audio
  /// útil (< 1 s o Whisper vacío) no cuentan.
  final ValueChanged<double>? onIntento;

  /// Con [header] (la escena de ExerciseScreen) el widget ocupa todo el alto
  /// disponible: escena, frase y "Escucha de nuevo" hacen scroll arriba, y el
  /// micrófono / resultado / Continuar quedan fijos abajo, siempre visibles.
  final Widget? header;

  const PronunciacionWidget({
    super.key,
    required this.ejercicio,
    required this.onResuelto,
    required this.onContinuar,
    this.onPerfecto,
    this.onFallo,
    this.onCorreccion,
    this.onIntento,
    this.header,
  });

  @override
  ConsumerState<PronunciacionWidget> createState() =>
      _PronunciacionWidgetState();
}

class _PronunciacionWidgetState extends ConsumerState<PronunciacionWidget>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  bool _isListening = false;
  bool _micUnavailable = false;
  bool _noSpeech = false; // último intento sin audio útil: sin puntaje
  double? _score;
  String _spokenText = '';
  // Corrección palabra por palabra del último intento puntuado.
  PronunciationFeedback? _feedback;
  // Lista vertical: diferencias de cada unidad (null = aún sin resultado).
  List<List<WordDiff>>? _unitDiffs;
  bool _resolved = false;
  StreamSubscription<void>? _completeSub;
  Timer? _audioTimeoutTimer;
  late AnimationController _micPulseCtrl;

  String get _target =>
      widget.ejercicio['respuesta_correcta'].toString();
  String get _phonetica =>
      widget.ejercicio['fonetica']?.toString() ?? '';

  // Fonética de la frase: solo puede partir línea tras el separador '·'.
  // Dentro de cada parte, espacios no separables y el guion unido con
  // "word joiner" (U+2060), así nunca queda "a-POINT-" / "ment".
  String get _phoneticaSinCortes => _phonetica
      .split('·')
      .map((u) => _sinCorteEnGuion(u.trim()).replaceAll(' ', '\u00A0'))
      .join('\u00A0· ');

  // Lista de palabras/expresiones cortas (VOCAB, Barber Zone): respuesta
  // "want, time, bad" o "Hello, Welcome, Come in" (o con ·) + fonética
  // "[ UONT · TAIM · BAD ]" con el mismo número de partes. Cada parte: máx.
  // 6 palabras ("I do not have an appointment") y sin ? . ! — así las frases normales devuelven null
  // (p. ej. "Do you like food? Yes, I do." / "[ DU iu laik FUUD · IES ai DU ]").
  List<(String, String)>? get _wordList {
    final words = _target
        .split(RegExp(r'[,·]'))
        .map((w) => w.trim())
        .where((w) => w.isNotEmpty)
        .toList();
    final fon = _phonetica
        .replaceAll(RegExp(r'[\[\]]'), '')
        .split('·')
        .map((f) => f.trim())
        .where((f) => f.isNotEmpty)
        .toList();
    if (words.length < 2 ||
        words.length != fon.length ||
        words.any((w) =>
            w.contains(RegExp(r'[?.!]')) || w.split(' ').length > 6)) {
      return null;
    }
    return [for (var i = 0; i < words.length; i++) (words[i], fon[i])];
  }

  @override
  void initState() {
    super.initState();
    _micPulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    // La frase NO suena sola al abrir el ejercicio (hacía la lección más
    // lenta): solo con "Escucha de nuevo". El micrófono está listo desde ya.
  }

  @override
  void dispose() {
    _completeSub?.cancel();
    _audioTimeoutTimer?.cancel();
    _micPulseCtrl.dispose();
    super.dispose();
  }

  // ── Reproducir voz modelo ──────────────────────────────────────────────────
  void _speakModel() {
    if (_isPlaying) return;
    final speech = ref.read(speechServiceProvider);

    _completeSub?.cancel();
    _audioTimeoutTimer?.cancel();
    setState(() => _isPlaying = true);

    _completeSub = speech.onPlayComplete.listen((_) {
      if (!mounted) return;
      _audioTimeoutTimer?.cancel();
      _completeSub?.cancel();
      _completeSub = null;
      setState(() => _isPlaying = false);
    });

    // Fallback: si el audio falla silenciosamente (ej. Google TTS bloqueado),
    // desbloquear el micrófono y el botón igualmente tras 6 segundos.
    _audioTimeoutTimer = Timer(const Duration(seconds: 6), () {
      if (!mounted) return;
      _completeSub?.cancel();
      _completeSub = null;
      setState(() => _isPlaying = false);
    });

    speech.speak(_target);
  }

  // ── Grabar pronunciación ───────────────────────────────────────────────────
  Future<void> _startListening() async {
    if (_isListening) return;
    final speech = ref.read(speechServiceProvider);

    setState(() {
      _isListening = true;
      _noSpeech = false;
      _score = null;
      _spokenText = '';
      _feedback = null;
      _unitDiffs = null;
    });
    _micPulseCtrl.repeat();

    final started = await speech.startListening(
      onResult: (words) {
        // Audio < 1 s o Whisper sin texto: intento fallido, sin puntaje ni
        // penalización; el alumno vuelve a tener el micrófono.
        if (words.trim().isEmpty) {
          if (!mounted) return;
          _micPulseCtrl.stop();
          _micPulseCtrl.reset();
          setState(() {
            _isListening = false;
            _noSpeech = true;
          });
          return;
        }
        final score = speech.calculateScore(words, _target);
        widget.onIntento?.call(score);
        final diffs = speech.wordDiffs(words, _target);
        final feedback = PronunciationFeedback.from(score, diffs,
            perfecto: kScorePerfecto, pasa: kScorePasa);
        final units = _wordList;
        debugPrint('Diffs: $diffs');
        debugPrint('STT words: $words');
        debugPrint('Target: $_target');
        debugPrint('Score: $score');
        if (!mounted) return;
        _micPulseCtrl.stop();
        _micPulseCtrl.reset();
        setState(() {
          _spokenText = words;
          _score = score;
          _feedback = feedback;
          _unitDiffs = units == null
              ? null
              : diffsByUnit(
                  diffs, unitWordCounts([for (final (w, _) in units) w]));
          _isListening = false;
          widget.onCorreccion?.call(feedback);
          if (score >= kScorePasa && !_resolved) {
            _resolved = true;
            widget.onResuelto();
            if (score >= kScorePerfecto) widget.onPerfecto?.call();
          }
        });
        if (score < kScorePasa && !_resolved) widget.onFallo?.call();
      },
      onDone: () {
        if (mounted) {
          _micPulseCtrl.stop();
          _micPulseCtrl.reset();
          setState(() => _isListening = false);
        }
      },
      target: _target,
    );

    if (!started && mounted) {
      _micPulseCtrl.stop();
      _micPulseCtrl.reset();
      setState(() {
        _isListening = false;
        _micUnavailable = true;
      });
    }
  }

  void _retry() => setState(() {
        _score = null;
        _spokenText = '';
        _feedback = null;
        _unitDiffs = null;
      });

  void _retryMic() {
    setState(() => _micUnavailable = false);
    _startListening();
  }

  // Saltar sin llegar al 60 % no cuenta como resuelto: no da XP.
  void _continuar() => widget.onContinuar();

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final wordList = _wordList;
    final short = isShortScreen(context);
    final arriba = <Widget>[
        // Lista vertical palabra + fonética (VOCAB)
        if (wordList != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _kGreenGlow,
              borderRadius: BorderRadius.circular(14),
              border:
                  Border.all(color: _kGreen.withValues(alpha: 0.30)),
            ),
            child: Column(
              children: [
                for (final (i, (word, fon)) in wordList.indexed)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                word,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Tras puntuar: ✓ / ✗ de esta unidad. Las
                            // diferencias se leen solo en el panel de resultado.
                            SizedBox(
                              width: 28,
                              child: _score != null &&
                                      _unitDiffs != null &&
                                      i < _unitDiffs!.length
                                  ? Icon(
                                      _unitDiffs![i].isEmpty
                                          ? Icons.check_rounded
                                          : Icons.close_rounded,
                                      size: 16,
                                      color: _unitDiffs![i].isEmpty
                                          ? _kGreen
                                          : _kYellow,
                                    )
                                  : null,
                            ),
                            Expanded(
                              child: Text(
                                '[\u00A0${_sinCorteEnGuion(fon)}\u00A0]',
                                style: GoogleFonts.outfit(
                                  color: _kGreen,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        if (wordList == null && _target.isNotEmpty)
          Text(
            _target,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        // CAMBIO 3-2: Fonética siempre visible
        if (wordList == null && _phonetica.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: _kGreenGlow,
              borderRadius: BorderRadius.circular(14),
              border:
                  Border.all(color: _kGreen.withValues(alpha: 0.30)),
            ),
            child: Text(
              _phoneticaSinCortes,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: _kGreen,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),

        const SizedBox(height: 12),

        // CAMBIO 3-3: Botón "Escucha de nuevo"
        SizedBox(
          width: double.infinity,
          height: 44,
          child: OutlinedButton.icon(
            onPressed: _isPlaying ? null : _speakModel,
            icon: Icon(
              Icons.volume_up_rounded,
              color: _isPlaying ? _kGreen.withValues(alpha: 0.4) : _kGreen,
              size: 20,
            ),
            label: Text(
              _isPlaying ? 'Reproduciendo...' : 'Escucha de nuevo',
              style: GoogleFonts.outfit(
                color: _isPlaying ? _kGreen.withValues(alpha: 0.4) : _kGreen,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: _isPlaying
                    ? _kGreen.withValues(alpha: 0.25)
                    : _kGreen.withValues(alpha: 0.55),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              padding: EdgeInsets.zero,
            ),
          ),
        ),

    ];

    // Zona fija: el IndexedStack reserva desde el inicio el espacio máximo
    // de ambos hijos, evitando que la pantalla se alargue al aparecer el feedback.
    final abajo = IndexedStack(
          index: _score != null ? 1 : 0,
          alignment: Alignment.topCenter,
          children: [
            // ── 0: Zona micrófono ───────────────────────────────────────────
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MicButton(
                  size: short ? 100 : 132,
                  isListening: _isListening,
                  // Desactivado solo mientras suena la frase modelo.
                  isEnabled: !_isPlaying,
                  pulseCtrl: _micPulseCtrl,
                  onTap: (!_isListening && !_isPlaying)
                      ? _startListening
                      : null,
                ),
                SizedBox(height: short ? 2 : 10),
                Text(
                  _isListening
                      ? '🔴  Escuchando...'
                      : (_isPlaying
                          ? 'Espera el modelo de pronunciación...'
                          : '🎙️  Ahora pronuncia tú'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: _isListening
                        ? _kGreen
                        : (_isPlaying ? Colors.white30 : Colors.white70),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_noSpeech && !_micUnavailable) ...[
                  const SizedBox(height: 8),
                  Text(
                    'No te escuché. Toca el micrófono e inténtalo de nuevo.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      color: _kYellow,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                if (_micUnavailable) ...[
                  const SizedBox(height: 8),
                  Text(
                    'No se pudo activar el micrófono. Intenta de nuevo.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      color: _kRed,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _retryMic,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.10),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                      ),
                      child: Text(
                        'Reintentar',
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: short ? 0 : 4),
                TextButton(
                  onPressed: _continuar,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(64, 36),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Saltar →',
                    style: GoogleFonts.outfit(
                      color: Colors.white38,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            // ── 1: Panel de feedback ────────────────────────────────────────
            // score ?? 0 solo afecta al layout cuando aún no hay resultado;
            // el panel nunca es visible (index 0 activo) hasta que _score != null.
            PronunciationResultPanel(
              score: _score ?? 0,
              spokenText: _spokenText,
              feedback: _feedback,
              onRetry: _retry,
              onContinuar: _continuar,
            ),
          ],
        );

    final header = widget.header;
    if (header == null) {
      return Column(
        children: [...arriba, const SizedBox(height: 12), abajo],
      );
    }
    return Column(
      children: [
        // Escena arriba; frase, fonética y "Escucha de nuevo" centradas en el
        // espacio libre hasta la zona fija. Si no cabe, todo hace scroll.
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: header),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: isCompactScreen(context) ? 4 : 8),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: arriba,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: isCompactScreen(context) ? 4 : 8),
        abajo,
      ],
    );
  }
}

/// Une el guion con sus letras para que la línea no se parta en él.
String _sinCorteEnGuion(String s) => s.replaceAll('-', '\u2060-\u2060');

// ─────────────────────────────────────────────────────────────────────────────
// Botón micrófono con animación de círculos pulsantes en verde (CAMBIO 3-5)
// ─────────────────────────────────────────────────────────────────────────────
class _MicButton extends StatelessWidget {
  final double size;
  final bool isListening;
  final bool isEnabled;
  final AnimationController pulseCtrl;
  final VoidCallback? onTap;

  const _MicButton({
    this.size = 132,
    required this.isListening,
    required this.isEnabled,
    required this.pulseCtrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculos pulsantes (solo mientras graba)
          if (isListening)
            AnimatedBuilder(
              animation: pulseCtrl,
              builder: (_, _) {
                final v = pulseCtrl.value;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    _ring(v % 1.0),
                    _ring((v + 0.33) % 1.0),
                    _ring((v + 0.66) % 1.0),
                  ],
                );
              },
            ),
          // Botón central
          GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _button,
              height: _button,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isListening
                    ? _kGreen.withValues(alpha: 0.18)
                    : (isEnabled
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.white.withValues(alpha: 0.03)),
                border: Border.all(
                  color: isListening
                      ? _kGreen
                      : (isEnabled ? Colors.white38 : Colors.white12),
                  width: isListening ? 2.5 : 2,
                ),
              ),
              child: Icon(
                isListening ? Icons.mic : Icons.mic_none_rounded,
                color: isListening
                    ? _kGreen
                    : (isEnabled ? Colors.white70 : Colors.white24),
                size: _button * 0.42,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Botón central: 80 px en la zona normal (132), 64 px en pantallas bajas.
  double get _button => size >= 132 ? 80 : 64;

  Widget _ring(double t) => Container(
        width: _button + t * (size - _button),
        height: _button + t * (size - _button),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _kGreen.withValues(alpha: (1.0 - t) * 0.32),
        ),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Panel de feedback tras pronunciar (CAMBIOS 4 y 5)
// ─────────────────────────────────────────────────────────────────────────────
/// Resultado de un intento: puntaje, mensaje, correcciones y botones.
/// En pantallas bajas ocupa menos de 120 px de alto.
class PronunciationResultPanel extends StatelessWidget {
  final double score;
  final String spokenText;
  final PronunciationFeedback? feedback;
  final VoidCallback onRetry;
  final VoidCallback onContinuar;

  const PronunciationResultPanel({
    super.key,
    required this.score,
    required this.spokenText,
    this.feedback,
    required this.onRetry,
    required this.onContinuar,
  });

  // ── Datos según rango de score ─────────────────────────────────────────────
  bool get _isSuccess => score >= kScorePasa;

  Color get _bgColor => _isSuccess
      ? _kGreen.withValues(alpha: 0.12)
      : _kRed.withValues(alpha: 0.10);

  Color get _borderColor => _isSuccess
      ? _kGreen.withValues(alpha: 0.50)
      : _kRed.withValues(alpha: 0.45);

  Color get _textColor => _isSuccess ? _kGreen : _kRed;

  String get _emoji {
    if (score >= kScorePerfecto) return '🏆';
    if (score >= kScorePasa) return '👍';
    return '🎯';
  }

  String get _message {
    if (score >= kScorePerfecto) return '¡Pronunciación perfecta!';
    if (score >= kScorePasa) return '¡Muy bien, se entiende!';
    return 'Inténtalo de nuevo';
  }

  @override
  Widget build(BuildContext context) {
    final short = isShortScreen(context);
    final titulo = Text(
      feedback != null && !_isSuccess
          ? '$_emoji  ${feedback!.prefix.trim()}'
          : '$_emoji  $_message',
      style: GoogleFonts.outfit(
        color: _textColor,
        fontSize: 14,
        fontWeight: FontWeight.w800,
        height: 1.25,
      ),
    );
    final detalle = feedback != null || spokenText.isNotEmpty;
    final btnStyleText =
        GoogleFonts.outfit(fontWeight: FontWeight.w800, fontSize: 14);
    const btnAlto = 40.0; // Intentar de nuevo / Saltar
    const btnAltoContinuar = 44.0;
    final btnShape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _borderColor, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Puntaje al lado del mensaje; debajo del mensaje, las
              // correcciones y lo que se escuchó (bajo 60 con diferencias, el
              // propio "Inténtalo de nuevo:" de la corrección hace de título).
              Row(
                children: [
                  ScoreCircle(score: score, size: 44),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titulo,
                        // Corrección palabra por palabra ("escuché", no
                        // "dijiste": Whisper también se equivoca). Altura
                        // limitada con scroll propio: nunca empuja Continuar
                        // fuera de la pantalla.
                        if (detalle)
                          _ScrollConBarra(
                            maxHeight: short ? 80 : 96,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (feedback != null)
                                    // Sin "Casi:" (el título ya lo dice) ni
                                    // "repite más despacio" (ya está el
                                    // botón "Escucha de nuevo" arriba).
                                    CorreccionLista(
                                      feedback: feedback!,
                                      conPrefijo: false,
                                      conDespacio: false,
                                      alinear: TextAlign.left,
                                    ),
                                  // Lo que dijo el usuario
                                  if (spokenText.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        '"$spokenText"',
                                        style: GoogleFonts.outfit(
                                            color: Colors.white38,
                                            fontSize: 12),
                                      ),
                                    ),
                                ],
                              ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // CAMBIO 5: Botones según score
              if (_isSuccess)
                // Score >= 60% → solo "Continuar ✅"
                SizedBox(
                  height: btnAltoContinuar,
                  child: ElevatedButton(
                    onPressed: onContinuar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _kGreen,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      shape: btnShape,
                      elevation: 4,
                      shadowColor: _kGreen.withValues(alpha: 0.35),
                    ),
                    child: Text('Continuar ✅',
                        style: btnStyleText.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w900)),
                  ),
                )
              else
                // Score < 60% → "Intentar de nuevo" + "Saltar" en una fila
                SizedBox(
                  height: btnAlto,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onRetry,
                          icon: const Text('🔄',
                              style: TextStyle(fontSize: 14)),
                          label: Text('Intentar de nuevo',
                              maxLines: 1, style: btnStyleText),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.10),
                            foregroundColor: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            shape: btnShape,
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: onContinuar,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: btnShape,
                          side: const BorderSide(color: Colors.white24),
                        ),
                        child: Text(
                          'Saltar →',
                          style: btnStyleText.copyWith(
                              color: Colors.white60,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Confetti animado para pronunciación perfecta (CAMBIO 4)
        if (score >= kScorePerfecto)
          Positioned.fill(
            child: IgnorePointer(child: _ConfettiOverlay()),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Zona de altura limitada con scroll y barra siempre visible, para que se note
// que hay más correcciones debajo.
// ─────────────────────────────────────────────────────────────────────────────
class _ScrollConBarra extends StatefulWidget {
  final double maxHeight;
  final Widget child;

  const _ScrollConBarra({required this.maxHeight, required this.child});

  @override
  State<_ScrollConBarra> createState() => _ScrollConBarraState();
}

class _ScrollConBarraState extends State<_ScrollConBarra> {
  final _ctrl = ScrollController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      child: Scrollbar(
        controller: _ctrl,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _ctrl,
          padding: const EdgeInsets.only(right: 8),
          child: widget.child,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Corrección palabra por palabra (panel de feedback y respuesta revelada)
// ─────────────────────────────────────────────────────────────────────────────
class CorreccionLista extends StatelessWidget {
  final PronunciationFeedback feedback;

  /// Muestra "Casi:" / "Inténtalo de nuevo:" como primera línea.
  final bool conPrefijo;

  /// Centrado en la respuesta revelada; a la izquierda en el panel.
  final TextAlign alinear;

  /// Muestra "Escucha de nuevo y repite más despacio" si hay > 3 diferencias.
  final bool conDespacio;

  const CorreccionLista({
    super.key,
    required this.feedback,
    this.conPrefijo = true,
    this.alinear = TextAlign.center,
    this.conDespacio = true,
  });

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.outfit(
      color: _kYellow,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );
    return Column(
      crossAxisAlignment: alinear == TextAlign.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        if (conPrefijo)
          Text(feedback.prefix.trim(),
              textAlign: alinear,
              style: style.copyWith(fontWeight: FontWeight.w800)),
        for (final item in feedback.items)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('• $item', textAlign: alinear, style: style),
          ),
        if (conDespacio && feedback.slowDown)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              '🔊 $kMensajeMasDespacio',
              textAlign: alinear,
              style: GoogleFonts.outfit(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Círculo de score
// ─────────────────────────────────────────────────────────────────────────────
// El anillo ocupa todo el cuadro (antes el Stack le daba restricciones sueltas
// y se quedaba en 36 px, más estrecho que "100%"). El texto vive en el cuadrado
// inscrito del hueco interior y FittedBox lo encoge si no cabe, así que nunca
// se sale del anillo, tenga uno, dos o tres dígitos.
const double kScoreCircleSize = 84;
const double _kScoreStroke = 6;
// Lado del cuadrado inscrito en el círculo interior: (84 - 2·6) / √2 ≈ 50.9
const double kScoreTextBox = 50;

class ScoreCircle extends StatelessWidget {
  final double score;
  final double size;
  const ScoreCircle(
      {super.key, required this.score, this.size = kScoreCircleSize});

  Color get _color => score >= kScorePasa ? _kGreen : _kRed;

  @override
  Widget build(BuildContext context) {
    final stroke = size < 60 ? 4.0 : _kScoreStroke;
    final textBox =
        size >= kScoreCircleSize ? kScoreTextBox : size - 2 * stroke - 8;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: CircularProgressIndicator(
              value: score / 100,
              strokeWidth: stroke,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(_color),
            ),
          ),
          SizedBox(
            width: textBox,
            height: textBox,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${score.round()}%',
                maxLines: 1,
                softWrap: false,
                style: GoogleFonts.outfit(
                  color: _color,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Confetti animado (CAMBIO 4 — solo score 100%)
// ─────────────────────────────────────────────────────────────────────────────
class _ConfettiOverlay extends StatefulWidget {
  @override
  State<_ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<_ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late List<_Particle> _particles;

  static const _colors = [
    _kGreen,
    _kYellow,
    _kRed,
    Colors.white,
    Color(0xFF40C4FF),
    Color(0xFFFF80AB),
  ];

  @override
  void initState() {
    super.initState();
    final rnd = Random();
    _particles = List.generate(55, (_) {
      return _Particle(
        x: rnd.nextDouble(),
        speed: 0.35 + rnd.nextDouble() * 0.65,
        sway: (rnd.nextDouble() - 0.5) * 2,
        freq: 1.0 + rnd.nextDouble() * 3.0,
        color: _colors[rnd.nextInt(_colors.length)],
        w: 5.0 + rnd.nextDouble() * 7,
        h: 4.0 + rnd.nextDouble() * 5,
        angle: rnd.nextDouble() * 2 * pi,
        spin: (rnd.nextDouble() - 0.5) * 8,
      );
    });
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, _) => CustomPaint(
        painter: _ConfettiPainter(_ctrl.value, _particles),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _Particle {
  final double x, speed, sway, freq, w, h, angle, spin;
  final Color color;
  const _Particle({
    required this.x,
    required this.speed,
    required this.sway,
    required this.freq,
    required this.color,
    required this.w,
    required this.h,
    required this.angle,
    required this.spin,
  });
}

class _ConfettiPainter extends CustomPainter {
  final double progress;
  final List<_Particle> particles;
  _ConfettiPainter(this.progress, this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final t = (progress * p.speed).clamp(0.0, 1.0);
      final opacity = (1.0 - t * 1.4).clamp(0.0, 1.0);
      if (opacity <= 0) continue;
      final x = p.x * size.width + p.sway * sin(progress * p.freq * pi) * 28;
      final y = -12.0 + (size.height + 30) * t;
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(p.angle + progress * p.spin);
      canvas.drawRect(
        Rect.fromCenter(center: Offset.zero, width: p.w, height: p.h),
        Paint()..color = p.color.withValues(alpha: opacity * 0.35),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => true;
}
