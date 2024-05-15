import 'package:flutter/material.dart';
import 'package:predict_dashboard/utils/app_colors.dart';

class AppTextStyle {
  static TextStyle title({
    double? fontSize,
    Color? color,
   FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 22,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? AppColors.appWhite, 
    );
  }
  static TextStyle subTitle({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w400,
      color: color ?? AppColors.appWhite,
    );
  }
  static TextStyle medium({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.appWhite, 
    );
  }

  static TextStyle caption({
    double? fontSize,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 11,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.appWhite, 
    );
  }
}