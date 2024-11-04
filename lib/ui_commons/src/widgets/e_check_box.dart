import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/models/data/theme_response.dart';
import 'package:onemoney_hack/di/theme_provider.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_colors.dart';

class ECheckBox extends StatelessWidget {
  final bool isTrue;

  final ValueChanged<bool?>? onChanged;

  const ECheckBox({
    super.key,
    required this.isTrue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    CheckboxProps? props = ThemeProvider.getInstance().getCheckboxPropsById("");
    return Checkbox(
      value: isTrue,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      onChanged: onChanged,
      checkColor:
          ColorUtil.colorFromHex(props?.checkColor ?? '') ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          2,
        ),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) {
          if (isTrue) {
            return BorderSide(
              width: props?.activeBorderWidth ?? 2.0,
              color: ColorUtil.colorFromHex(props?.activeBorderColor ?? '') ??
                  EColors.EQUAL_GREEN,
            );
          }
          return BorderSide(
            width: props?.inactiveBorderWidth ?? 2.0,
            color: ColorUtil.colorFromHex(props?.inactiveBorderColor ?? '') ??
                EColors.EQUAL_GREEN,
          );
        },
      ),
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (isTrue) {
            return ColorUtil.colorFromHex(props?.fillColor ?? '') ??
                EColors.EQUAL_GREEN;
          }
          return Colors.white;
        },
      ),
      focusColor: null,
      hoverColor: Colors.transparent,
      splashRadius: kMinInteractiveDimension / 2,
    );
  }
}
