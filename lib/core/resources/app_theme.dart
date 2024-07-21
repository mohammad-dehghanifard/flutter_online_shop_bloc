import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light = ThemeData(
    fontFamily: FontFamily.dana,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light(

    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12,color: AppColors.greyColor),
      bodyMedium: TextStyle(fontSize: 14,color: AppColors.title)
    )
  );
}