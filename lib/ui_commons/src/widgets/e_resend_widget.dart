import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/ui_commons/src/widgets/e_timer.dart';

import '../tokens/e_textstyle.dart';

class EResendWidget extends StatefulWidget {
  const EResendWidget({
    super.key,
    required this.onResendOtp,
    required this.timeInSeconds,
    this.padding = const EdgeInsets.symmetric(
      vertical: 8,
    ),
  });
  final VoidCallback? onResendOtp;
  final int timeInSeconds;
  final EdgeInsetsGeometry padding;

  @override
  State<EResendWidget> createState() => _EResendWidgetState();
}

class _EResendWidgetState extends State<EResendWidget> {
  bool _isFinished = false;

  @override
  Widget build(BuildContext context) {
    return !_isFinished
        ? ETimer(
            seconds: widget.timeInSeconds,
            onFinished: () {
              setState(() {
                _isFinished = true;
              });
            },
          )
        : MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                if (widget.onResendOtp != null) {
                  setState(() {
                    _isFinished = false;
                  });
                  widget.onResendOtp?.call();
                }
              },
              child: Padding(
                padding: widget.padding,
                child: Text(
                  "Resend OTP",
                  style: EtextStyle.style.size12.w400.underline
                      .copyWith(color: Colors.black, height: 14 / 12),
                ),
              ),
            ),
          );
  }
}
