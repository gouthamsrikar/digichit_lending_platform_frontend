import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onemoney_hack/api/models/data/theme_response.dart';
import 'package:onemoney_hack/di/theme_provider.dart';
import 'package:onemoney_hack/ui_commons/src/extensions/textstyle_ext.dart';
import 'package:onemoney_hack/ui_commons/src/tokens/e_textstyle.dart';

import '../../equal_ui.dart';

typedef OnChangedInterceptor = String Function(String value);

// ignore: must_be_immutable
class ETextField extends StatelessWidget {
  ETextField({
    super.key,
    this.controller,
    this.description,
    this.hintText,
    this.labelText,
    this.leading,
    this.keyboardType,
    this.initialValue,
    this.onChanged,
    this.maxLength,
    this.inputFormatters,
    this.onChangedInterceptor,
    this.errorText,
    this.onFieldSubmitted,
    this.onTap,
    this.enabled,
    this.suffix,
    this.borderColor,
  });

  ETextField.mobileInput({
    super.key,
    this.controller,
    this.description,
    this.initialValue,
    this.onChanged,
    this.onChangedInterceptor,
    this.errorText,
    this.onFieldSubmitted,
    this.onTap,
    this.enabled,
    this.suffix,
    this.borderColor,
  })  : labelText = null,
        leading = Text(
          '+91',
          style: TextStyle(
            color: Color(0xFF00B140),
            fontSize: 18,
            fontFamily: 'Red Hat Text',
            fontWeight: FontWeight.w600,
          ),
        ),
        keyboardType = TextInputType.phone,
        maxLength = 10,
        hintText = 'Enter Mobile No.',
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];

  ETextField.aadhar({
    super.key,
    this.controller,
    this.description,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.onFieldSubmitted,
    this.onTap,
    this.enabled,
    this.suffix,
    this.borderColor,
  })  : leading = null,
        hintText = null,
        labelText = 'Aadhaar No.',
        keyboardType = const TextInputType.numberWithOptions(decimal: false),
        maxLength = 14,
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          const GapInputFormatter(4),
        ] {
    onChangedInterceptor = (value) {
      return value.replaceAll(' ', '');
    };
  }

  ETextField.otp({
    super.key,
    this.controller,
    this.description,
    this.initialValue,
    this.onChanged,
    this.errorText,
    this.labelText,
    this.onFieldSubmitted,
    this.onTap,
    this.enabled,
    this.borderColor,
    required VoidCallback? onResend,
    int resendTime = 30,
    String? hint,
  })  : leading = null,
        hintText = hint ?? 'Enter OTP',
        keyboardType = const TextInputType.numberWithOptions(decimal: false),
        maxLength = 7,
        suffix = EResendWidget(
          onResendOtp: onResend,
          timeInSeconds: resendTime,
        ),
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          const GapInputFormatter(3),
        ] {
    onChangedInterceptor = (value) {
      return value.replaceAll(' ', '');
    };
  }

  final Widget? suffix;

  final TextEditingController? controller;
  final String? description;
  final String? hintText;
  final String? labelText;
  final Widget? leading;
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  late OnChangedInterceptor? onChangedInterceptor;
  final String? errorText;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    const border = InputBorder.none;

    TextfieldProps? props =
        ThemeProvider.getInstance().getTextfieldPropsById("");

    final _leading = leading != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading!,
              ],
            ),
          )
        : null;

    final _suffix = suffix != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                suffix!,
              ],
            ),
          )
        : null;

    final textField = TextFormField(
      selectionHeightStyle: BoxHeightStyle.tight,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      style: EtextStyle.style.size16.w400.copyWith(
        color: Colors.black,
        height: 1,
      ),
      enabled: enabled,
      onTap: onTap,
      maxLength: maxLength,
      onChanged: onChangedInterceptor == null
          ? onChanged
          : (value) {
              onChanged?.call(onChangedInterceptor!(value));
            },
      // cursorHeight: 15,
      cursorWidth: 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      enableSuggestions: true,
      cursorColor: Colors.black54,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: _leading,
        suffixIcon: _suffix,
        focusedErrorBorder: border,
        errorBorder: border,
        disabledBorder: border,
        contentPadding: labelText == null
            ? const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 16,
                right: 16,
                // horizontal: 16,
              )
            : const EdgeInsets.symmetric(
                // vertical: 19,
                horizontal: 16,
              ),

        counterText: '',
        labelText: labelText,
        hintText: hintText,
        filled: false,
        fillColor: Colors.white,
        hoverColor: Colors.transparent,
        hintStyle: EtextStyle.style.size16.w400.copyWith(
          color: Colors.black,
          height: 22 / 16,
        ),
        floatingLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          height: 22 / 12,
        ),
        // alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );

    final wrappedTextField = Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
          // horizontal: 20,
          ),
      decoration: ShapeDecoration(
        // default text field color
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: errorText != null
                ? context.colorScheme.error
                : borderColor ?? context.colorScheme.tertiary,
            width: 1,
            strokeAlign: 1,
          ),
        ),
      ),
      child: textField,
    );

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrappedTextField,
          SizedBox(
            height: 32,
            child: (description != null || errorText != null)
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        errorText ?? description!,
                        style: EtextStyle.style.size12.w500.copyWith(
                          color: errorText != null
                              ? context.colorScheme.error
                              : context.colorScheme.tertiary,
                        ),
                      ),
                    ),
                  )
                : null,
          )
        ],
      ),
    );
  }
}

class GapInputFormatter extends TextInputFormatter {
  const GapInputFormatter(this.gap);
  final int gap;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % gap == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 4 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
