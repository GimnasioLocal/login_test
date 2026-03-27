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
    color: Colors.black,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const h1 = TextStyle(color: Color.fromARGB(255, 182, 11, 11));
  static const link = TextStyle(color: AppColors.secondary);
}
