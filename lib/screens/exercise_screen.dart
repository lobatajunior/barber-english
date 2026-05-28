import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'dart:js' as js;

class ExerciseScreen extends StatefulWidget {
  final int leccionId;
  final String titulo;
  final VoidCallback? onCompletada;

  const ExerciseScreen({
    super.key,
    required this.leccionId,
    required this.titulo,
    this.onCompletada,
  });

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final Color colorFondo1 = const Color(0xFF0A1628);
  final Color colorFondo2 = const Color(0xFF1A53A1);
  final Color colorCian = const Color(0xFF00E5FF);
  final Color colorVerde = const Color(0xFF00C853);
  final Color colorRojo = const Color(0xFFFF5252);

  int currentIndex = 0;
  String? selectedOption;
  String? selectedIngles;
  String? selectedEspanol;
  List<String> matchedWords = [];
  bool ejercicioResuelto = false;
  List<String> shuffledOptions = [];
  List<String> shuffledEspanol = [];
  bool isListening = false;
  String micFeedback = '';
  bool micCorrecto = false;

  late List<Map<String, dynamic>> ejercicios;

  @override
  void initState() {
    super.initState();
    ejercicios = _getEjercicios(widget.leccionId);
    _prepararEjercicio();
  }

  void _hablar(String texto) {
    try {
      js.context.callMethod('eval', [
        """
        window.speechSynthesis.cancel();
        var msg = new SpeechSynthesisUtterance('${texto.replaceAll("'", "")}');
        msg.lang = 'en-US';
        msg.rate = 0.78;
        msg.pitch = 1.0;
        var voices = window.speechSynthesis.getVoices();
        var preferidas = ['Google US English','Microsoft Aria','Samantha','Karen','Daniel'];
        for (var i = 0; i < preferidas.length; i++) {
          var voz = voices.find(v => v.name.includes(preferidas[i]));
          if (voz) { msg.voice = voz; break; }
        }
        window.speechSynthesis.speak(msg);
        """,
      ]);
    } catch (e) {
      print('Error voz: \$e');
    }
  }

  void _escucharMicrofono(String respuestaCorrecta) {
    if (isListening) {
      _detenerMicrofono();
      return;
    }

    setState(() {
      isListening = true;
      micFeedback = 'Escuchando...';
      micCorrecto = false;
    });

    try {
      final respuestaLimpia = respuestaCorrecta
          .toLowerCase()
          .replaceAll(RegExp(r'[^\w\s]'), '')
          .trim();

      js.context.callMethod('eval', [
        """
        var recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
        recognition.lang = 'en-US';
        recognition.interimResults = false;
        recognition.maxAlternatives = 3;
        
        recognition.onresult = function(event) {
          var transcripts = [];
          for (var i = 0; i < event.results[0].length; i++) {
            transcripts.push(event.results[0][i].transcript.toLowerCase().replace(/[^\\w\\s]/g, '').trim());
          }
          window._micResult = transcripts.join('|');
          window._micDone = true;
        };
        
        recognition.onerror = function(event) {
          window._micResult = 'error';
          window._micDone = true;
        };
        
        recognition.onend = function() {
          if (!window._micDone) {
            window._micResult = 'timeout';
            window._micDone = true;
          }
        };
        
        window._micDone = false;
        window._micResult = '';
        recognition.start();
        """,
      ]);

      Future.delayed(const Duration(milliseconds: 500), () {
        _verificarResultadoMic(respuestaLimpia);
      });
    } catch (e) {
      setState(() {
        isListening = false;
        micFeedback = 'Error con el micrófono';
      });
    }
  }

  void _verificarResultadoMic(String respuestaLimpia) {
    Future.delayed(const Duration(milliseconds: 300), () {
      try {
        final done = js.context['_micDone'];
        if (done == true) {
          final result = js.context['_micResult'].toString();

          if (result == 'error' || result == 'timeout' || result.isEmpty) {
            setState(() {
              isListening = false;
              micFeedback = 'No se escuchó nada, intenta de nuevo';
              micCorrecto = false;
            });
            return;
          }

          final transcripts = result.split('|');
          bool correcto = false;

          for (final transcript in transcripts) {
            final palabrasCorrectas = respuestaLimpia.split(' ');
            final palabrasTranscritas = transcript.split(' ');
            int coincidencias = 0;

            for (final palabra in palabrasCorrectas) {
              if (palabrasTranscritas.any(
                (p) => p.contains(palabra) || palabra.contains(p),
              )) {
                coincidencias++;
              }
            }

            final porcentaje = coincidencias / palabrasCorrectas.length;
            if (porcentaje >= 0.6) {
              correcto = true;
              break;
            }
          }

          setState(() {
            isListening = false;
            micCorrecto = correcto;
            micFeedback = correcto
                ? '¡Perfecto! Muy buena pronunciación 🎉'
                : 'Casi, intenta de nuevo 💪';
            if (correcto) ejercicioResuelto = true;
          });
        } else {
          _verificarResultadoMic(respuestaLimpia);
        }
      } catch (e) {
        setState(() {
          isListening = false;
          micFeedback = 'Intenta de nuevo';
        });
      }
    });
  }

  void _detenerMicrofono() {
    setState(() => isListening = false);
    try {
      js.context.callMethod('eval', ['window._micDone = true;']);
    } catch (e) {}
  }

  String _cleanText(String text) {
    return text.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '').trim();
  }

  void _prepararEjercicio() {
    if (currentIndex >= ejercicios.length) return;
    final ej = ejercicios[currentIndex];
    selectedOption = null;
    selectedIngles = null;
    selectedEspanol = null;
    ejercicioResuelto = false;
    matchedWords.clear();
    isListening = false;
    micFeedback = '';
    micCorrecto = false;

    if (ej['tipo'] == 'opciones') {
      shuffledOptions = List<String>.from(ej['opciones'])..shuffle();
    }
    if (ej['tipo'] == 'parejas') {
      shuffledEspanol = List<String>.from(ej['parejas_espanol'])..shuffle();
    }
  }

  void _avanzar() {
    if (currentIndex < ejercicios.length - 1) {
      setState(() {
        currentIndex++;
        _prepararEjercicio();
      });
    } else {
      _mostrarFinal();
    }
  }

  void _mostrarFinal() {
    final mensajes = [
      "¡Excelente trabajo!",
      "¡Increíble, lo lograste!",
      "¡Eres un crack en inglés!",
      "¡Genial, dominas esta lección!",
    ];
    final mensaje = mensajes[Random().nextInt(mensajes.length)];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF0D3B6E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: colorCian, width: 2),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.emoji_events_rounded, color: colorCian, size: 80),
            const SizedBox(height: 20),
            Text(
              "¡LECCIÓN LISTA!",
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  widget.onCompletada?.call();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorVerde,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  '¡A POR OTRA!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (ejercicios.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorFondo1, colorFondo2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              'Lección en construcción',
              style: GoogleFonts.outfit(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      );
    }

    final ej = ejercicios[currentIndex];
    double progreso = (currentIndex + 1) / ejercicios.length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorFondo1, colorFondo2, const Color(0xFF0D3B6E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progreso,
                          backgroundColor: Colors.white12,
                          color: colorCian,
                          minHeight: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white54,
                        size: 22,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.titulo,
                    style: GoogleFonts.outfit(
                      color: colorCian,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        ej['instruccion'] ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          color: Colors.white60,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (ej['tipo'] == 'opciones') _buildOpciones(ej),
                      if (ej['tipo'] == 'pronunciacion')
                        _buildPronunciacion(ej),
                      if (ej['tipo'] == 'parejas') _buildParejas(ej),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: ejercicioResuelto ? _avanzar : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ejercicioResuelto
                              ? colorVerde
                              : Colors.white12,
                          elevation: ejercicioResuelto ? 8 : 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Text(
                          currentIndex == ejercicios.length - 1
                              ? 'FINALIZAR'
                              : 'CONTINUAR',
                          style: TextStyle(
                            color: ejercicioResuelto
                                ? Colors.white
                                : Colors.white24,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _avanzar,
                      child: Text(
                        'SALTAR',
                        style: GoogleFonts.outfit(
                          color: Colors.white30,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpciones(Map<String, dynamic> ej) {
    return Column(
      children: [
        Text(
          ej['pregunta'] ?? '',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (ejercicioResuelto)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: colorVerde.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorVerde.withOpacity(0.3)),
              ),
              child: Text(
                ej['traduccion_pregunta'] ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: colorVerde,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: shuffledOptions.map((opt) {
            bool isCorrect =
                opt.toLowerCase() ==
                ej['respuesta_correcta'].toString().toLowerCase();
            bool isSelected = selectedOption == opt;
            Color borderColor = isSelected
                ? (ejercicioResuelto ? colorVerde : colorCian)
                : Colors.white24;
            return GestureDetector(
              onTap: ejercicioResuelto
                  ? null
                  : () {
                      _hablar(opt);
                      setState(() {
                        selectedOption = opt;
                        if (isCorrect) {
                          ejercicioResuelto = true;
                          Future.delayed(const Duration(milliseconds: 600), () {
                            _hablar(ej['respuesta_correcta'].toString());
                          });
                        }
                      });
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? borderColor.withOpacity(0.1)
                      : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Text(
                  opt,
                  style: GoogleFonts.outfit(
                    color: isSelected ? borderColor : Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPronunciacion(Map<String, dynamic> ej) {
    return Column(
      children: [
        // BOTÓN ESCUCHAR
        GestureDetector(
          onTap: () => _hablar(ej['respuesta_correcta'].toString()),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorCian.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: colorCian.withOpacity(0.3)),
            ),
            child: Icon(Icons.volume_up_rounded, color: colorCian, size: 36),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Toca para escuchar',
          style: GoogleFonts.outfit(
            color: colorCian.withOpacity(0.6),
            fontSize: 11,
          ),
        ),

        const SizedBox(height: 20),

        // FRASE PRINCIPAL
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            children: [
              Text(
                ej['respuesta_correcta'] ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorCian.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '[ ${ej['fonetica'] ?? ''} ]',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    color: colorCian,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // BOTÓN MICRÓFONO
        GestureDetector(
          onTap: () => _escucharMicrofono(ej['respuesta_correcta'].toString()),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isListening ? 90 : 80,
            height: isListening ? 90 : 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isListening
                  ? colorRojo.withOpacity(0.2)
                  : ejercicioResuelto
                  ? colorVerde.withOpacity(0.2)
                  : Colors.white.withOpacity(0.1),
              border: Border.all(
                color: isListening
                    ? colorRojo
                    : ejercicioResuelto
                    ? colorVerde
                    : Colors.white38,
                width: isListening ? 3 : 2,
              ),
              boxShadow: isListening
                  ? [
                      BoxShadow(
                        color: colorRojo.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              isListening
                  ? Icons.mic
                  : ejercicioResuelto
                  ? Icons.check_rounded
                  : Icons.mic_none_rounded,
              color: isListening
                  ? colorRojo
                  : ejercicioResuelto
                  ? colorVerde
                  : Colors.white70,
              size: 36,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          isListening
              ? '🔴 Escuchando... toca para parar'
              : ejercicioResuelto
              ? '✅ ¡Correcto!'
              : '🎤 Toca para pronunciar',
          style: GoogleFonts.outfit(
            color: isListening
                ? colorRojo
                : ejercicioResuelto
                ? colorVerde
                : Colors.white54,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        // FEEDBACK DEL MICRÓFONO
        if (micFeedback.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: micCorrecto
                    ? colorVerde.withOpacity(0.1)
                    : colorRojo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: micCorrecto
                      ? colorVerde.withOpacity(0.3)
                      : colorRojo.withOpacity(0.3),
                ),
              ),
              child: Text(
                micFeedback,
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: micCorrecto ? colorVerde : colorRojo,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildParejas(Map<String, dynamic> ej) {
    List<String> ingles = List<String>.from(ej['parejas_ingles']);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(children: ingles.map((w) => _wordButton(w, true, ej)).toList()),
        Column(
          children: shuffledEspanol
              .map((w) => _wordButton(w, false, ej))
              .toList(),
        ),
      ],
    );
  }

  Widget _wordButton(String word, bool isIngles, Map<String, dynamic> ej) {
    bool isSelected = (isIngles ? selectedIngles : selectedEspanol) == word;
    bool isMatched = matchedWords.contains(word);
    Color stateColor = isMatched
        ? colorVerde
        : (isSelected ? colorCian : Colors.white24);

    return GestureDetector(
      onTap: isMatched
          ? null
          : () {
              setState(() {
                if (isIngles) {
                  selectedIngles = word;
                  _hablar(word);
                } else {
                  selectedEspanol = word;
                }
                _validarPareja(ej);
              });
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 140,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isMatched || isSelected
              ? stateColor.withOpacity(0.1)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: stateColor, width: 2),
        ),
        child: Text(
          word,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: isMatched || isSelected ? stateColor : Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _validarPareja(Map<String, dynamic> ej) {
    if (selectedIngles != null && selectedEspanol != null) {
      int idxI = (ej['parejas_ingles'] as List).indexOf(selectedIngles);
      int idxE = (ej['parejas_espanol'] as List).indexOf(selectedEspanol);
      if (idxI == idxE) {
        matchedWords.addAll([selectedIngles!, selectedEspanol!]);
        selectedIngles = null;
        selectedEspanol = null;
        if (matchedWords.length == (ej['parejas_ingles'] as List).length * 2) {
          setState(() => ejercicioResuelto = true);
        }
      } else {
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            selectedIngles = null;
            selectedEspanol = null;
          });
        });
      }
    }
  }

  List<Map<String, dynamic>> _getEjercicios(int id) {
    final data = [
      {
        "leccion_id": 1,
        "titulo": "First Contact & Appointment",
        "ejercicios": [
          {
            "tipo": "opciones",
            "instruccion": "Pregunta si tiene cita",
            "pregunta": "Hello! Do you have an _______?",
            "traduccion_pregunta": "¡Hola! ¿Tienes una cita?",
            "respuesta_correcta": "appointment",
            "opciones": ["appointment", "ticket", "space", "hour"],
          },
          {
            "tipo": "pronunciacion",
            "instruccion": "Respuesta del cliente sin cita",
            "respuesta_correcta": "I don't have one, can you see me now?",
            "fonetica": "ai dont jav uan, can iú si mi nau",
            "traduccion_pregunta": "No tengo, ¿me puedes atender ahora?",
          },
          {
            "tipo": "opciones",
            "instruccion": "Acción de revisar la agenda",
            "pregunta": "I will check the _______.",
            "traduccion_pregunta": "Voy a mirar la agenda.",
            "respuesta_correcta": "schedule",
            "opciones": ["book", "schedule", "phone", "paper"],
          },
          {
            "tipo": "pronunciacion",
            "instruccion": "Confirmar disponibilidad",
            "respuesta_correcta": "Yes, I have a space for you.",
            "fonetica": "ies, ai jav a spéis for iú",
            "traduccion_pregunta": "Sí, tengo un espacio para ti.",
          },
          {
            "tipo": "parejas",
            "instruccion": "Vocabulario de tiempo",
            "parejas_ingles": ["Now", "Later", "Appointment"],
            "parejas_espanol": ["Ahora", "Después", "Cita"],
          },
          {
            "tipo": "opciones",
            "instruccion": "Pregunta el nombre",
            "pregunta": "What is your _______?",
            "traduccion_pregunta": "¿Cómo te llamas?",
            "respuesta_correcta": "name",
            "opciones": ["name", "last name", "nick", "user"],
          },
          {
            "tipo": "pronunciacion",
            "instruccion": "Presentación personal",
            "respuesta_correcta": "Nice to meet you, my name is Junior.",
            "fonetica": "nais tu mít iú, mai neim is Junior",
            "traduccion_pregunta": "Encantado, mi nombre es Junior.",
          },
          {
            "tipo": "opciones",
            "instruccion": "Pregunta por el estilo",
            "pregunta": "How would you like your _______?",
            "traduccion_pregunta": "¿Cómo te gustaría tu corte?",
            "respuesta_correcta": "cut",
            "opciones": ["cut", "style", "color", "wash"],
          },
          {
            "tipo": "parejas",
            "instruccion": "Partes del estilo",
            "parejas_ingles": ["Top", "Sides", "Beard"],
            "parejas_espanol": ["Arriba", "Lados", "Barba"],
          },
          {
            "tipo": "opciones",
            "instruccion": "Solicitud de barba",
            "pregunta": "I need a beard _______.",
            "traduccion_pregunta": "Necesito un arreglo de barba.",
            "respuesta_correcta": "trim",
            "opciones": ["trim", "cut", "wash", "color"],
          },
        ],
      },
      {
        "leccion_id": 2,
        "titulo": "Connection & Origin",
        "ejercicios": [
          {
            "tipo": "parejas",
            "instruccion": "Une las palabras con su significado",
            "parejas_ingles": [
              "Vacation",
              "Months",
              "Studying",
              "From",
              "Lived",
            ],
            "parejas_espanol": [
              "Vacaciones",
              "Meses",
              "Estudiando",
              "De",
              "Vivido",
            ],
          },
          {
            "tipo": "opciones",
            "pregunta": "Where are you _______ my friend?",
            "respuesta_correcta": "from",
            "opciones": ["from", "to", "at", "on"],
            "traduccion_pregunta": "¿De dónde eres mi amigo?",
            "instruccion": "Completa la pregunta",
          },
          {
            "tipo": "pronunciacion",
            "respuesta_correcta": "Are you on vacation or do you live here?",
            "fonetica": "Ar yu on ve-kei-shon or du yu liv hir",
            "instruccion": "Pronuncia la frase completa",
          },
          {
            "tipo": "opciones",
            "pregunta": "Nice to _______ you, I'm Junior.",
            "respuesta_correcta": "meet",
            "opciones": ["see", "meet", "hear", "call"],
            "traduccion_pregunta": "Encantado de conocerte, soy Junior.",
            "instruccion": "Completa el saludo",
          },
          {
            "tipo": "parejas",
            "instruccion": "Vocabulario de tiempo y lugar",
            "parejas_ingles": ["Now", "Here", "City", "Well", "Nice"],
            "parejas_espanol": ["Ahora", "Aquí", "Ciudad", "Bien", "Lindo"],
          },
          {
            "tipo": "pronunciacion",
            "respuesta_correcta": "I am from Venezuela.",
            "fonetica": "Ai am fram Ve-ne-swe-la",
            "instruccion": "Di tu origen con orgullo",
          },
          {
            "tipo": "opciones",
            "pregunta": "I've been living here for ten _______.",
            "respuesta_correcta": "months",
            "opciones": ["days", "years", "months", "weeks"],
            "traduccion_pregunta": "He estado viviendo aquí por diez meses.",
            "instruccion": "Completa la frase",
          },
        ],
      },
      {
        "leccion_id": 3,
        "titulo": "Weather & Seasons",
        "ejercicios": [
          {
            "tipo": "parejas",
            "instruccion": "Vocabulario del clima",
            "parejas_ingles": ["Summer", "Winter", "Weather", "Hot", "Cold"],
            "parejas_espanol": ["Verano", "Invierno", "Clima", "Calor", "Frío"],
          },
          {
            "tipo": "opciones",
            "pregunta": "In my country, it is always _______.",
            "respuesta_correcta": "summer",
            "opciones": ["winter", "summer", "cold", "rainy"],
            "traduccion_pregunta": "En mi país siempre es verano.",
            "instruccion": "Completa la frase",
          },
          {
            "tipo": "pronunciacion",
            "respuesta_correcta": "The weather is very nice today.",
            "fonetica": "De ue-der is ve-ri nais tu-dei",
            "instruccion": "Habla sobre el clima de hoy",
          },
          {
            "tipo": "opciones",
            "pregunta": "We have very marked _______.",
            "respuesta_correcta": "seasons",
            "opciones": ["days", "seasons", "months", "years"],
            "traduccion_pregunta": "Tenemos estaciones muy marcadas.",
            "instruccion": "Completa la frase",
          },
          {
            "tipo": "parejas",
            "instruccion": "Estaciones y sensaciones",
            "parejas_ingles": ["Spring", "Autumn", "Sun", "Rain", "Snow"],
            "parejas_espanol": ["Primavera", "Otoño", "Sol", "Lluvia", "Nieve"],
          },
          {
            "tipo": "pronunciacion",
            "respuesta_correcta": "It is very cold in winter.",
            "fonetica": "It is ve-ri kold in uin-ter",
            "instruccion": "Describe el invierno",
          },
        ],
      },
    ];

    final leccion = data.firstWhere(
      (l) => l['leccion_id'] == id,
      orElse: () => {'ejercicios': []},
    );
    return List<Map<String, dynamic>>.from(leccion['ejercicios'] as List);
  }
}
