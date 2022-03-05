import 'package:andreasan/design_system/theme/app_theme.dart';
import 'package:andreasan/design_system/theme/i_theme.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        fontFamily: theme.secondTextTheme.fontFamily,
        scaffoldBackgroundColor: theme.colors.primary.darker,
        colorScheme: theme.colors.colorScheme,
      );
}

extension ThemeDataX on ThemeData {
  // Unfortunatly, we cannot use the [Itheme] property of [createTheme] method here.
  // If we want to switch between themes, make a ternary.
  AppTheme get appTheme => AppTheme();
}
