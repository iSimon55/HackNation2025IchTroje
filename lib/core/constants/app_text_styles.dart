import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: bold,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 20,
    fontWeight: semiBold,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: semiBold,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: regular,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    fontWeight: regular,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: regular,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 13,
    fontWeight: regular,
    height: 1.4,
    color: AppColors.textTertiary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: medium,
    height: 1.3,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: bold,
    letterSpacing: 0.5,
    color: AppColors.white,
  );

  static const TextStyle tag = TextStyle(
    fontSize: 13,
    fontWeight: medium,
    color: AppColors.textSecondary,
  );
}
