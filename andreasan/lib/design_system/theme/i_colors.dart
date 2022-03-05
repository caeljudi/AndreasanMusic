import 'package:flutter/material.dart';

class ColorGroup {
  ColorGroup({
    this.darker,
    required this.dark,
    required this.medium,
    required this.light,
    this.lighter,
  });

  Color? darker;
  Color dark;
  Color medium;
  Color light;
  Color? lighter;
}

abstract class IColors {
  late ColorGroup primary;
  late ColorGroup secondary;
  late ColorGroup accent;
  late ColorGroup semanticInformative;
  late ColorGroup semanticSuccess;
  late ColorGroup semanticWarning;
  late ColorGroup semanticError;
  late Color neutralBlack;
  late ColorGroup neutral;
  late Color neutralWhite;
  late Brightness? brightness;
  late ColorScheme colorScheme;
}
