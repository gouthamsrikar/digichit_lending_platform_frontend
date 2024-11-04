// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/src/equal_ui_theme.dart';

class EColors {
  const EColors._();

  ///0xffF1F1F1
  static const GREY_LIGHT_1 = Color(0xffF1F1F1);

  static const DARK_BACKGROUND = Color(0xff191919);

  ///0xffF4F4F4
  static const GREY_LIGHT_2 = Color(0xffF4F4F4);

  ///0xffCAC4D0
  static const GREY_MEDIUM = Color(0xffCAC4D0);

  ///0xff676767
  static const GREY_STRONG = Color(0xffBCBCBC);

  ///0xff00B140
  static const EQUAL_GREEN = Color(0xff00B140);

  ///0xffeb1c23
  static const ERROR_RED = Color(0xffeb1c23);

  ///0xff00B140 is [EQUAL_GREEN]
  static Color get enabledButtonColor =>
      EqualUITheme.enabledButtonColor ?? EQUAL_GREEN;

  ///0xffF4F4F4 is [GREY_LIGHT_2]
  static Color get disabledButtonColor =>
      EqualUITheme.disabledButtonColor ?? GREY_LIGHT_2;

  ///white is [MATERIAL_WHITE]
  static Color get enabledButtonTextColor => Colors.white;

  ///0xffF4F4F4 is [GREY_STRONG]
  static Color get disabledButtonTextColor => GREY_STRONG;

  ///0xffF1F1F1 is [GREY_LIGHT_1]
  static Color get borderColor => GREY_LIGHT_1;

  ///0xffCAC4D0 is [GREY_MEDIUM]
  static Color get dividerColor => GREY_MEDIUM;
}
