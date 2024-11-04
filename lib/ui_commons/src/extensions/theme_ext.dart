import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  CardTheme get cardTheme => Theme.of(this).cardTheme;

  ButtonThemeData get buttonThemeData => Theme.of(this).buttonTheme;
}
