import 'package:andreasan/design_system/theme/app_colors.dart';

import 'app_text_theme.dart';
import 'i_colors.dart';
import 'i_text_theme.dart';
import 'i_theme.dart';

class AppTheme implements ITheme {
  @override
  late final ITextTheme mainTextTheme;
  @override
  late final ITextTheme secondTextTheme;

  AppTheme() {
    mainTextTheme = AppTextTheme("Roboto", colors);
    secondTextTheme = AppTextTheme("WorkSans", colors);
  }

  @override
  IColors get colors => AppColors();
}
