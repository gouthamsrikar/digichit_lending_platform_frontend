import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/logging/logger.dart';
import 'package:onemoney_hack/api/models/data/theme_response.dart';
import 'package:onemoney_hack/di/theme_provider.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/ui_commons/src/extensions/textstyle_ext.dart';
import 'package:onemoney_hack/ui_commons/src/extensions/theme_ext.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_colors.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_textstyle.dart';
import 'package:onemoney_hack/ui_commons/src/widgets/e_button_shimmer.dart';

import '../helpers/event_base_widget.dart';

// ignore: must_be_immutable
class EFilledButton extends EventBaseWidget {
  EFilledButton({
    super.key,
    super.componentId,
    super.onTap,
    super.componentType = "BUTTON",
    required this.child,
    this.isLoading = false,
    this.isShimmerRequired = false,
    this.enabledButtonTextColor,
    this.loaderWidget,
  });

  EFilledButton.text({
    super.key,
    super.componentId,
    super.onTap,
    super.componentType = "BUTTON",
    this.loaderWidget,
    // required this.onPressed,
    required String title,
    this.isLoading = false,
    this.enabledButtonTextColor,
    this.isShimmerRequired = true,
  }) : child = Text(
          title,
          style: EtextStyle.style.size16.w700.copyWith(
            color: onTap != null
                ? enabledButtonTextColor ?? EColors.enabledButtonTextColor
                : EColors.disabledButtonTextColor,
          ),
          textAlign: TextAlign.center,
        );

  final Widget? child;

  final bool isLoading;

  final bool isShimmerRequired;

  final Color? enabledButtonTextColor;

  final Widget? loaderWidget;

  /// The callback that is called when the button is tapped or otherwise activated.
  // final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    FilledbuttonProps? props = ThemeProvider.getInstance()
        .getFilledButtonPropsById(componentId?.componentId);

    return MaterialButton(
        minWidth: double.infinity,
        onPressed: !isLoading ? onTap : null,
        color: enabledButtonTextColor ??
            ColorUtil.colorFromHex(props?.enabledColor ?? '') ??
            context.buttonThemeData.colorScheme?.primary ??
            EColors.enabledButtonColor,
        disabledColor: isLoading
            ? enabledButtonTextColor ??
                ColorUtil.colorFromHex(props?.enabledColor ?? '') ??
                EColors.enabledButtonColor ??
                context.buttonThemeData.colorScheme?.primary
            : ColorUtil.colorFromHex(props?.disabledColor ?? '') ??
                context.buttonThemeData.colorScheme?.secondary ??
                EColors.disabledButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(props?.borderRadius ?? 5),
        ),
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHighlightChanged: (value) => false,
        height: props?.height ?? 48,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: props?.height ?? 48,
          width: isLoading ? props?.height ?? 48 : null,
          child: isLoading
              ? loaderWidget ??
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: CircularProgressIndicator(
                      color: context.buttonThemeData.colorScheme?.onPrimary,
                      strokeWidth: 2.5,
                      strokeCap: StrokeCap.round,
                    ),
                  )
              // _shimmerWrapper(
              //         shimmerChild: const SizedBox(
              //         height: 48,
              //         width: double.infinity,
              //       ))
              : onTap == null
                  ? Center(
                      child: child,
                    )
                  : _shimmerWrapper(
                      shimmerChild: Center(
                        child: child,
                      ),
                    ),
        ));
  }

  Widget _shimmerWrapper({required Widget shimmerChild}) {
    return isShimmerRequired
        ? ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: EButtonShimmer(
              isLoading: isLoading,
              lineCount: isLoading ? 3 : 1,
              shimmerDuration: isLoading
                  ? const Duration(milliseconds: 1000)
                  : const Duration(milliseconds: 3000),
              child: shimmerChild,
            ),
          )
        : shimmerChild;
  }
}
