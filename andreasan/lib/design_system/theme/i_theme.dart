import 'i_colors.dart';
import 'i_text_theme.dart';

abstract class ITheme {
  ITextTheme get mainTextTheme;
  ITextTheme get secondTextTheme;
  IColors get colors;
}
