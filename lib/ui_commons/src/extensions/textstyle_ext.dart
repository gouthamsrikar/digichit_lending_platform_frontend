import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_fonts.dart';

import '../../equal_ui.dart';

extension StyleExtension on EtextStyle {
  /// Font weight 100
  EtextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  /// Font weight 200
  EtextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  /// Font weight 300
  EtextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Font weight 400
  EtextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Font weight 500
  EtextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Font weight 600
  EtextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Font weight 700
  EtextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Font weight 800
  EtextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  EtextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  EtextStyle get underline => copyWith(decoration: TextDecoration.underline);
  EtextStyle get lineThrough =>
      copyWith(decoration: TextDecoration.lineThrough);
  EtextStyle get overline => copyWith(decoration: TextDecoration.overline);

  EtextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  EtextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  EtextStyle get w300 => copyWith(fontWeight: FontWeight.w300);
  EtextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  EtextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  EtextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  EtextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  EtextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  EtextStyle get w900 => copyWith(fontWeight: FontWeight.w900);

  EtextStyle get size8 => copyWith(fontSize: 8);
  EtextStyle get size10 => copyWith(fontSize: 10);
  EtextStyle get size12 => copyWith(fontSize: 12);
  EtextStyle get size14 => copyWith(fontSize: 14);
  EtextStyle get size16 => copyWith(fontSize: 16);
  EtextStyle get size18 => copyWith(fontSize: 18);
  EtextStyle get size20 => copyWith(fontSize: 20);
  EtextStyle get size22 => copyWith(fontSize: 22);
  EtextStyle get size24 => copyWith(fontSize: 24);
  EtextStyle get size26 => copyWith(fontSize: 26);
  EtextStyle get size28 => copyWith(fontSize: 28);
  EtextStyle get size30 => copyWith(fontSize: 30);
  EtextStyle get size32 => copyWith(fontSize: 32);
  EtextStyle get size34 => copyWith(fontSize: 34);
  EtextStyle get size36 => copyWith(fontSize: 36);
  EtextStyle get size38 => copyWith(fontSize: 38);
  EtextStyle get size40 => copyWith(fontSize: 40);
  EtextStyle get size42 => copyWith(fontSize: 42);
  EtextStyle get size44 => copyWith(fontSize: 44);
  EtextStyle get size46 => copyWith(fontSize: 46);
  EtextStyle get size48 => copyWith(fontSize: 48);
  EtextStyle get size50 => copyWith(fontSize: 50);

  EtextStyle get ubuntu => copyWith(fontFamily: EFonts.UBUNTU);
}
