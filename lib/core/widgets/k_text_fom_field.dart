import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/color_util.dart' show ColorUtil;

class KTextFormField extends StatelessWidget {
  const KTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.validator,
    required this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final bool enabled;
  final bool readOnly;
  final void Function(dynamic)? onChanged;
  final EdgeInsets? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style,
      readOnly: readOnly,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: ColorUtil.primaryColor,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
        isDense: true,

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorUtil.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ColorUtil.greyColor.withValues(alpha: 0.3),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: ColorUtil.primaryColor.withValues(alpha: 0.1),
          ),
        ),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorUtil.blackColor.withValues(alpha: 0.5),
            ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
