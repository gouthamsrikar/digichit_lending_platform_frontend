import 'dart:ui';

class ColorUtil {
  static Color? colorFromHex(
    String color,
  ) {
    String c = color.toUpperCase().replaceAll("#", "");

    if (![6, 8].contains(c.length)) {
      return null;
    }

    if (c.length == 6) {
      c = 'FF$c';
    }

    int? iVal = int.tryParse(c, radix: 16);

    if (iVal != null) {
      return Color(iVal);
    }

    return null;
  }

  static Color? colorFromHexString(String? colorString) {
    if (colorString?.isNotEmpty ?? false) {
      String c = colorString?.toUpperCase().replaceAll("#", "") ?? '';

      if (![6, 8].contains(c.length)) {
        return null;
      }

      if (c.length == 6) {
        c = 'FF$c';
      }
      int? iVal = int.tryParse(c, radix: 16);
      if (iVal != null) {
        return Color(iVal);
      }
    }
    return null;
  }
}
