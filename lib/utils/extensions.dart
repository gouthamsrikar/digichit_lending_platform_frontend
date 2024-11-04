import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  bool get isMobile => MediaQuery.of(this).size.width < 600;
}

extension MobileNumberValidation on String {
  bool isValidMobileNumber() {
    // Regular expression for Indian mobile numbers
    final regex = RegExp(r'^[6-9]\d{9}$');
    return regex.hasMatch(this);
  }
}
