import 'package:flutter/material.dart';

import 'i_colors.dart';

class AppColors implements IColors {
  AppColors() {
    primary = ColorGroup(
      darker: const Color(0xff454B66),
      dark: const Color(0xff5B6183),
      medium: const Color(0xff7177A1),
      light: const Color(0xff868DBE),
      lighter: const Color(0xff9CA3DB),
    );
    secondary = ColorGroup(
      darker: const Color(0xff6A4700),
      dark: const Color(0xffD48D00),
      medium: const Color(0xffFFBF3F),
      light: const Color(0xffFFD47F), 
      lighter: const Color(0xffFFEABF),
    );
    accent = ColorGroup(
      darker: const Color(0xff2A2A2A),
      dark: const Color(0xff4C4C4C),
      medium: const Color(0xff7F7F7F),
      light: const Color(0xffD8D8D8),
      lighter: const Color(0xffF8F8F8),
    );
    semanticInformative = ColorGroup(
      dark: const Color(0xff01465E),
      medium: const Color(0xff0B88B2),
      light: const Color(0xffE8F7FC),
    );
    semanticSuccess = ColorGroup(
      dark: const Color(0xff0B4113),
      medium: const Color(0xff239033),
      light: const Color(0xffECF9ED),
    );
    semanticWarning = ColorGroup(
      dark: const Color(0xff7C3C01),
      medium: const Color(0xffCC8110),
      light: const Color(0xffFBF6E9),
    );
    semanticError = ColorGroup(
      dark: const Color(0xff620525),
      medium: const Color(0xffC22A29),
      light: const Color(0xffFBEEE9),
    );
    neutralBlack = Colors.black;
    neutral = ColorGroup(
      darker: const Color(0xff292724),
      dark: const Color(0xff43433D),
      medium: const Color(0xff666666),
      light: const Color(0xffEBEBEB),
      lighter: const Color(0xffFAFAFA),
    );
    neutralWhite = Colors.white;
    colorScheme = const ColorScheme.light().copyWith(
      primary: primary.medium,
      onPrimary: neutral.darker,
      secondary: secondary.medium,
      onSecondary: neutral.darker,
    );
  }

  @override
  late ColorGroup accent;

  @override
  Brightness? brightness;

  @override
  late ColorScheme colorScheme;

  @override
  late ColorGroup neutral;

  @override
  late Color neutralBlack;

  @override
  late Color neutralWhite;

  @override
  late ColorGroup primary;

  @override
  late ColorGroup secondary;

  @override
  late ColorGroup semanticError;

  @override
  late ColorGroup semanticInformative;

  @override
  late ColorGroup semanticSuccess;

  @override
  late ColorGroup semanticWarning;
}
