import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryLight = Color(0xFFC9896A);
  static const Color primary = Color(0xFFA0674D);
  static const Color primaryDark = Color(0xFF8B4513);

  static const Color secondary = Color(0xFF3498DB);
  static const Color secondaryDark = Color(0xFF2980B9);
  static const Color secondaryLight = Color(0xFF5DADE2);

  static const Color textPrimary = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF34495E);
  static const Color textTertiary = Color(0xFF7F8C8D);
  static const Color borderGray = Color(0xFFBDC3C7);
  static const Color backgroundGray = Color(0xFFECF0F1);
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundVeryLight = Color(0xFFFAFBFC);

  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  static const Color secessionGold = Color(0xFFD4AF37);
  static const Color industrialSteel = Color(0xFF7F8C8D);
  static const Color natureGreen = Color(0xFF27AE60);
  static const Color culturePurple = Color(0xFF9B59B6);
  static const Color gastronomyOrange = Color(0xFFE67E22);

  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryLight, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color curiosityBackground = Color(0xFFFFF9E6);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
