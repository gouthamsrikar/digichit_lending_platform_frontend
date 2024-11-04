// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


import '../../../api/models/data/theme_response.dart';
import '../../../di/theme_provider.dart';
import '../../equal_ui.dart';
import '../helpers/event_base_widget.dart';
import '../utils/color_util.dart';

class EOutlinedButton extends EventBaseWidget {
  EOutlinedButton({
    super.key,
    super.componentId,
    super.onTap,
    super.componentType = "BUTTON",
    required this.child,
  });

  EOutlinedButton.text({
    super.key,
    super.componentId,
    super.onTap,
    super.componentType = "BUTTON",
    required String title,
  }) : child = Text(
          title,
          style: EtextStyle.style.size16.w700.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        );

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    OutlinedbuttonProps? props = ThemeProvider.getInstance()
        .getOutlinedbuttonPropsById(componentId?.componentId);
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onTap,
      color: Colors.white,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      disabledColor: Colors.transparent,
      splashColor: Colors.transparent,
      colorBrightness: Brightness.light,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      height: props?.height ?? 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(props?.borderRadius ?? 5),
        side: BorderSide(
          color: ColorUtil.colorFromHex(props?.enabledBorderColor ?? '') ??
              Colors.black,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: SizedBox(
        height: props?.height ?? 48,
        child: Center(child: child),
      ),
    );
  }
}
