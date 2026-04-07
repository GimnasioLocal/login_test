import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFC39B);
  static const Color secondary = Color(0xFFD86111);
  static const Color accent = Color(0xFF1CDFCE);

  //Backgrounds
  static const Color background = Color.fromARGB(255, 107, 44, 1);
  static const Color backgroundComponent = Color(0xFF8A644A);
  static const Color backgroundComponentSelected = Color(0xFFDFA27A);

  //Fonts
  static const brand = TextStyle(
    color: Color(0xFFD15F02),
    fontSize: 40,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: Offset(0.6, 1), // Desplazamiento de la sombra
        color: Colors.white, // Color de la sombra
        blurRadius: 3, // Difuminado de la sombra
      ),
    ],
  );
  static const h1 = TextStyle(
    color: Color(0xFFD15F02),
    fontSize: 18,
    shadows: [
      Shadow(offset: Offset(0.3, 0.5), color: Colors.white, blurRadius: 2),
    ],
  );
  static const link = TextStyle(color: AppColors.secondary);
}
