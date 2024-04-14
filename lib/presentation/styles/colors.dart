import 'package:flutter/material.dart';

class AppColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
  static const Color primary = Color(0xFF005DA3);
  static const Color error = Color(0xFFFF0000);

  static const Color purple = Color(0xFFEA94D7);
  static const Color flatGray = Color(0xFFDDCDFF);
  static const Color flatOrange = Color(0xFFFFDADA);
  static const Color textBlack = Color(0xFF4A4A4A);
  static const Color buttonColor = Color(0xFF7BB3FF);
  static const Color black = Color(0xFF000000);

  static const MaterialColor defaultColor = MaterialColor(
    0xFF005DA3,
    <int, Color>{
      50: Color(0xFFA1C6EA),
      100: Color(0xFFA1C6EA),
      200: Color(0xFFA1C6EA),
      300: Color(0xFFA1C6EA),
      400: Color(0xFF00467A),
      500: Color(0xFF00467A),
      600: Color(0xFF00467A),
      700: Color(0xFF00467A),
      800: Color(0xFF00467A),
      900: Color(0xFF00467A),
    },
  );
}
