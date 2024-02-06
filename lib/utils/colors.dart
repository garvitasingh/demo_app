import 'package:flutter/material.dart';

class AppColors {
  static const Color gradient1 = Color(0xFF73CE62);
  static const Color gradient2 = Color(0xFF1A6FC3);
  static const Color gradient3 = Color(0xFF33CB1B);
  static const Color gradient4 = Color(0xFF2BBB0F);
  static const Color gradient5 = Color(0xFF339DE3);

  static const Color lightBlue = Color(0xFF03A4F9);
  static const Color textShadow = Color(0xFFC3C3C4);
  static const Color boxShadow = Color(0xFFD8D8D9);

  static const Gradient circleGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
    AppColors.gradient1,
    AppColors.gradient2,
  ]);

  static const Gradient linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
    AppColors.lightBlue,
    AppColors.gradient3,
  ]);

  static const Gradient buttonGradient = LinearGradient(
      colors: [
        AppColors.gradient5,
        AppColors.gradient4,
      ]);
}
