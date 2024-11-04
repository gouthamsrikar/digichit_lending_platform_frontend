import 'dart:ui';

class EqualUITheme {
  // BackGround
  static Color? _surfaceColor;

  static Color? get surfaceColor => _surfaceColor;

  // TextTheme
  static Color? _primaryTextColor;
  static Color? _secondaryTextColor;
  static Color? _tertiaryTextColor;
  static Color? _errorTextColor;

  static Color? get primaryTextColor => _primaryTextColor;

  static Color? get secondaryTextColor => _secondaryTextColor;

  static Color? get tertiaryTextColor => _tertiaryTextColor;

  static Color? get errorTextColor => _errorTextColor;

  // ButtonTheme
  static Color? _enabledButtonColor;
  static Color? _disabledButtonColor;
  static Color? _enabledButtonTextColor;
  static Color? _disabledButtonTextColor;

  static Color? get enabledButtonColor => _enabledButtonColor;

  static Color? get disabledButtonColor => _disabledButtonColor;

  static Color? get enabledButtonTextColor => _enabledButtonTextColor;

  static Color? get disabledButtonTextColor => _disabledButtonTextColor;

  // Miscellaneous
  static Color? _componentBorderColor;
  static Color? _logoBorderColor;
  static Color? _iconColor;

  static Color? get componentBorderColor => _componentBorderColor;

  static Color? get logoBorderColor => _logoBorderColor;

  static Color? get iconColor => _iconColor;

  static init({
    // BackGround
    Color? surfaceColor,
    Color? headerColor,
    // TextTheme
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? tertiaryTextColor,
    Color? errorTextColor,
    // Button Theme
    Color? enabledButtonColor,
    Color? disabledButtonColor,
    Color? enabledButtonTextColor,
    Color? disabledButtonTextColor,
    // Miscellaneous
    Color? componentBorderColor,
    Color? logoBorderColor,
    Color? iconColor,
  }) {
    // BackGround
    _surfaceColor  = surfaceColor;
    // TextTheme
    _primaryTextColor = primaryTextColor;
    _secondaryTextColor = secondaryTextColor;
    _tertiaryTextColor = tertiaryTextColor;
    _errorTextColor = errorTextColor;
    // Button Theme
    _enabledButtonColor = enabledButtonColor;
    _disabledButtonColor = disabledButtonColor;
    _enabledButtonTextColor = enabledButtonTextColor;
    _disabledButtonTextColor = disabledButtonTextColor;
    // Miscellaneous
    _componentBorderColor = componentBorderColor;
    _logoBorderColor = logoBorderColor;
    _iconColor = iconColor;

  }
}
