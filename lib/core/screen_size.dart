import 'package:flutter/widgets.dart';

/// Pantalla baja: menos de 600 px de alto visible (p. ej. 360x560 dentro del
/// navegador de Instagram). Los ejercicios usan espacios, fuentes grandes y
/// círculos más pequeños para que todo quepa sin bajar.
bool isShortScreen(BuildContext context) =>
    MediaQuery.sizeOf(context).height < 600;

/// Pantalla mediana-baja (menos de 720 px): mascota de la escena reducida y
/// círculo de puntuación al lado del mensaje.
bool isCompactScreen(BuildContext context) =>
    MediaQuery.sizeOf(context).height < 720;
