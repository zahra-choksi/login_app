import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static final backgroundTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background
      ),
      chipTheme: ChipThemeData(
        color: MaterialStatePropertyAll(
            AppColors.background),
        side: BorderSide.none,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(27),
      )
  );


}