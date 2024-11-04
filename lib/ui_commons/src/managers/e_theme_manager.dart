import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';

import '../equal_ui_theme.dart';
import '../tokens/e_colors.dart';
import '../tokens/e_textstyle.dart';

/*
ThemeData ColorSchema
surface         -------> BackgroundColor
primary         -------> PrimaryTextColor
secondary       -------> SecondaryTextColor (Subtexts, labels, etc)
tertiary        -------> TextFieldInputColor
SeedColor       -------> EqualIcon color (Currently we are not supporting custom color for the Icons)
error           -------> ErrorText Color
outline         -------> BorderColor for TextFields, Tables, EDivider etc (Widgets border)
outlineVariant  -------> logoOutLine


ButtonThemeData ColorsSchema
primary         -------> Enabled Button Color
Secondary       -------> Disabled Button Color
onPrimary       -------> Enabled Button Text color

Card Theme  (Still not getting used. Under Development)

TextTheme   (Still not getting used. Under Development)

*/
class EThemeManger with ChangeNotifier {
  static EThemeManger? _singleton;

  EThemeManger._internal();

  static EThemeManger getInstance() {
    _singleton ??= EThemeManger._internal();
    return _singleton!;
  }

  String? _appFont;
  ThemeData? _currentThemeData;

  setFontFamily(String? fontFamily) {
    _appFont = fontFamily;
  }

  setCurrentThemeData({required ThemeData themeData}) {
    _currentThemeData = themeData;
  }

  get getFontFamily => _appFont;

  static ThemeData getThemeData() {
    return _singleton?._currentThemeData ?? _getLightTheme();
  }

  static ThemeData _getLightTheme() {
    return ThemeData(
      fontFamily: _singleton?.getFontFamily,
      colorScheme: ColorScheme.fromSeed(
        surface: EqualUITheme.surfaceColor ?? Colors.white,
        primary: EqualUITheme.primaryTextColor ?? Colors.black,
        secondary: EqualUITheme.secondaryTextColor ?? EColors.GREY_STRONG,
        tertiary: EqualUITheme.tertiaryTextColor ?? EColors.GREY_STRONG,
        seedColor: Colors.green,
        error: EqualUITheme.errorTextColor ?? EColors.ERROR_RED,
        outline: EqualUITheme.componentBorderColor ?? EColors.GREY_MEDIUM,
        outlineVariant: EqualUITheme.logoBorderColor ?? EColors.GREY_MEDIUM,
      ),
      cardTheme: CardTheme(color: EqualUITheme.surfaceColor ?? Colors.white),
      buttonTheme: _getDefaultButtonThemeData(),
      textTheme: _getDefaultTextTheme(),
      useMaterial3: true,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      fontFamily: _singleton?.getFontFamily,
      colorScheme: ColorScheme.fromSeed(
        surface: EqualUITheme.surfaceColor ?? EColors.DARK_BACKGROUND,
        primary: EqualUITheme.primaryTextColor ?? Colors.white,
        secondary: EqualUITheme.secondaryTextColor ?? Colors.white,
        tertiary: EqualUITheme.tertiaryTextColor ?? EColors.GREY_STRONG,
        seedColor: Colors.green,
        error: EqualUITheme.errorTextColor ?? EColors.ERROR_RED,
        outline: EqualUITheme.componentBorderColor ?? Colors.white,
        outlineVariant: EqualUITheme.logoBorderColor ?? EColors.DARK_BACKGROUND,
      ),
      cardTheme: CardTheme(
          color: EqualUITheme.surfaceColor ?? EColors.DARK_BACKGROUND),
      buttonTheme: _getDefaultButtonThemeData(),
      textTheme: _getDefaultTextTheme(),
      useMaterial3: true,
    );
  }

  static ButtonThemeData _getDefaultButtonThemeData() {
    return ButtonThemeData(
        colorScheme: ColorScheme.fromSeed(
      seedColor: EColors.EQUAL_GREEN,
      primary: EqualUITheme.enabledButtonColor ?? EColors.EQUAL_GREEN,
      secondary:
          EqualUITheme.disabledButtonColor ?? EColors.disabledButtonColor,
      onPrimary:
          EqualUITheme.enabledButtonTextColor ?? EColors.enabledButtonTextColor,
      onSecondary:
          EqualUITheme.disabledButtonColor ?? EColors.disabledButtonTextColor,
    ));
  }

  static _getDefaultTextTheme() {
    return TextTheme(
      headlineLarge: EtextStyle.style.size16,
      headlineMedium: EtextStyle.style.size16,
      bodyLarge: EtextStyle.style.size14,
      bodyMedium: EtextStyle.style.size12,
      bodySmall: EtextStyle.style.size10,
    );
  }
}
