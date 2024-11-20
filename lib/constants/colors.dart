import 'package:flutter/material.dart';

class TColors{
  TColors._();

  static const Color primary = Color(0xFF4868ff);
  static const Color secondary = Color(0xFFffe24b);
  static const Color accent = Color(0xFFb0c7ff);

  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors:[
        Color(0xFFff9a9e),
        Color(0xFFfad0c4),
        Color(0xFFfad0c4)
      ] ,
  );

  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6c7570);
  static const Color textWhite = Colors.white;

  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFf3f5ff);

  static const Color lightContainer = Color(0xFFf6f6f6);
  static Color darkContainer = TColors.light.withOpacity(0.1);

  static const Color buttonPrimary = Color(0xFF4868ff);
  static const Color buttonSecondary = Color(0xFFffe24b);
  static const Color buttonDisabled = Color(0xFFb0c7ff);

  static const Color borderPrimary = Color(0xFF333333);
  static const Color borderSecondary = Color(0xFF6c7570);

  static const Color error = Color(0xFFD32f2f);
  static const Color success = Color(0xFF388E3c);
  static const Color warning = Color(0xFFf57c00);
  static const Color info = Color(0xFF1976d2);

  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4f4f4f);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFe0e0e0);
  static const Color softGrey = Color(0xFFf4f4f4);
  static const Color lightGrey = Color(0xFFf9f9f9);
  static const Color white = Color(0xFFffffff);

}