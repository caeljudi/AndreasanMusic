import 'package:flutter/material.dart';

import 'i_colors.dart';
import 'i_text_theme.dart';

class AppTextTheme implements ITextTheme {
  AppTextTheme(String fontFamily, IColors colors) {
    headline1 = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    headline2 = TextStyle(
      fontSize: 39,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    headline3 = TextStyle(
      fontSize: 31,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    headline4 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    headline5 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    headline6 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    subHeading1 = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    subHeading2 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: colors.neutral.darker,
    );
    bodyText1 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      color: colors.neutral.medium,
    );
    bodyText2 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      color: colors.neutral.medium,
    );
    bodyText3 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: fontFamily,
      color: colors.neutral.medium,
    );
    small1 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: colors.neutral.dark,
    );
    small2 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: colors.neutral.dark,
    );
    small3 = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: colors.neutral.dark,
    );
    buttonText1 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutralBlack,
    );
    buttonText2 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
      color: colors.neutralBlack,
    );
    label = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
      color: colors.neutral.medium,
    );

    fontFamily = fontFamily;
  }

  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  TextStyle? bodyText3;

  @override
  TextStyle? buttonText1;

  @override
  TextStyle? buttonText2;

  @override
  String? fontFamily;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline2;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? label;

  @override
  TextStyle? small1;

  @override
  TextStyle? small2;

  @override
  TextStyle? small3;

  @override
  TextStyle? subHeading1;

  @override
  TextStyle? subHeading2;
}
