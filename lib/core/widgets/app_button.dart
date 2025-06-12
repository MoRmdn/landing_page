import 'package:flutter/material.dart';

import '../utilities/app_util.dart';
import 'loading.dart';

const kButtonSize = Size.fromHeight(48.0);
const kButtonPadding = EdgeInsets.all(20.0);

class AppButton extends _Button {
  AppButton(
    BuildContext context, {
    super.key,
    required String title,
    required Function()? onTap,
    EdgeInsets? padding,
    double fontSize = 16.0,
    Color? textColor,
    super.margin,
    Color? borderColor,
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
    super.isBusy,
    Widget? child,
    bool shrink = false,
    FontWeight fontWeight = FontWeight.w500,
    super.applyHomeNotch,
  }) : super(
          child: Center(
            child: child ??
                TextButton(
                  onPressed: onTap,
                  style: TextButton.styleFrom(
                    foregroundColor: textColor ?? Colors.white,
                    elevation: elevation ?? 3.0,
                    minimumSize: shrink ? null : kButtonSize,
                    padding: padding ?? kButtonPadding,
                    backgroundColor: onTap == null
                        ? Theme.of(context).unselectedWidgetColor
                        : (backgroundColor ?? Theme.of(context).primaryColor),
                    shape: ContinuousRectangleBorder(
                      borderRadius: borderRadius ?? AppUtil.borderRadius10,
                    ),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
          ),
        );

  factory AppButton.icon(
    BuildContext context, {
    Key? key,
    required String title,
    required Function()? onTap,
    required Widget icon,
    EdgeInsets? padding,
    double fontSize,
    Color? textColor,
    Color? backgroundColor,
    EdgeInsets? margin,
    double? elevation,
    BorderRadius? borderRadius,
    bool isBusy,
    bool shrink,
    FontWeight fontWeight,
    bool applyHomeNotch,
  }) = _AppButtonWithIcon;

  factory AppButton.outlined(
    BuildContext context, {
    Key? key,
    required String title,
    required Function()? onTap,
    EdgeInsets? padding,
    double fontSize,
    Color? textColor,
    EdgeInsets? margin,
    Color? borderColor,
    BorderRadius? borderRadius,
    bool isBusy,
    bool shrink,
    FontWeight fontWeight,
    bool applyHomeNotch,
  }) = _AppButtonOutlined;

  factory AppButton.outlinedWithIcon(
    BuildContext context, {
    Key? key,
    required String title,
    required Function()? onTap,
    required Widget icon,
    EdgeInsets? padding,
    double fontSize,
    Color? textColor,
    EdgeInsets? margin,
    Color? borderColor,
    BorderRadius? borderRadius,
    bool isBusy,
    bool shrink,
    FontWeight fontWeight,
    bool applyHomeNotch,
  }) = _AppButtonOutlinedWithIcon;
}

class _AppButtonWithIcon extends AppButton {
  _AppButtonWithIcon(
    super.context, {
    super.key,
    required super.title,
    required super.onTap,
    required Widget icon,
    EdgeInsets? padding,
    double fontSize = 16.0,
    Color? textColor,
    Color? backgroundColor,
    super.margin,
    double? elevation,
    BorderRadius? borderRadius,
    super.isBusy,
    bool shrink = false,
    FontWeight fontWeight = FontWeight.w500,
    super.applyHomeNotch,
  }) : super(
          child: TextButton.icon(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: textColor ?? Colors.white,
              elevation: elevation ?? 3.0,
              minimumSize: shrink ? null : kButtonSize,
              padding: padding ?? kButtonPadding,
              backgroundColor: onTap == null
                  ? Theme.of(context).unselectedWidgetColor
                  : (backgroundColor ?? Theme.of(context).primaryColor),
              shape: ContinuousRectangleBorder(
                borderRadius: borderRadius ?? AppUtil.borderRadius10,
              ),
            ),
            icon: icon,
            label: Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        );
}

class _AppButtonOutlined extends AppButton {
  _AppButtonOutlined(
    super.context, {
    super.key,
    required super.title,
    required super.onTap,
    EdgeInsets? padding,
    double fontSize = 16.0,
    Color? textColor,
    super.margin,
    Color? borderColor,
    BorderRadius? borderRadius,
    super.isBusy,
    bool shrink = false,
    FontWeight fontWeight = FontWeight.w500,
    super.applyHomeNotch,
  }) : super(
          child: TextButton(
            onPressed: onTap,
            style: ButtonStyle(
              minimumSize: shrink ? null : WidgetStateProperty.all(kButtonSize),
              padding: WidgetStateProperty.all(
                padding ?? kButtonPadding,
              ),
              elevation: WidgetStateProperty.all(0.0),
              shape: WidgetStateProperty.all(
                ContinuousRectangleBorder(
                  borderRadius: borderRadius ?? AppUtil.borderRadius8,
                ),
              ),
              side: WidgetStateProperty.all(
                BorderSide(
                  width: 1,
                  color: onTap == null
                      ? Theme.of(context).unselectedWidgetColor
                      : (borderColor ?? Theme.of(context).primaryColor),
                ),
              ),
              foregroundColor: WidgetStateProperty.all(
                onTap == null
                    ? Theme.of(context).unselectedWidgetColor
                    : (textColor ?? Theme.of(context).primaryColor),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: textColor ?? Theme.of(context).primaryColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        );
}

class _AppButtonOutlinedWithIcon extends AppButton {
  _AppButtonOutlinedWithIcon(
    super.context, {
    super.key,
    required super.title,
    required super.onTap,
    required Widget icon,
    EdgeInsets? padding,
    double fontSize = 16.0,
    Color? textColor,
    super.margin,
    Color? borderColor,
    BorderRadius? borderRadius,
    super.isBusy,
    bool shrink = false,
    FontWeight fontWeight = FontWeight.w500,
    super.applyHomeNotch,
  }) : super(
          child: TextButton.icon(
            onPressed: onTap,
            label: Text(
              title,
              style: TextStyle(
                color: textColor ?? Theme.of(context).primaryColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
            icon: icon,
            style: ButtonStyle(
              minimumSize: shrink ? null : WidgetStateProperty.all(kButtonSize),
              padding: WidgetStateProperty.all(
                padding ?? kButtonPadding,
              ),
              elevation: WidgetStateProperty.all(0.0),
              shape: WidgetStateProperty.all(
                ContinuousRectangleBorder(
                  borderRadius: borderRadius ?? AppUtil.borderRadius8,
                ),
              ),
              side: WidgetStateProperty.all(
                BorderSide(
                  width: 1,
                  color: onTap == null
                      ? Theme.of(context).unselectedWidgetColor
                      : (borderColor ?? Theme.of(context).primaryColor),
                ),
              ),
              foregroundColor: WidgetStateProperty.all(
                onTap == null
                    ? Theme.of(context).unselectedWidgetColor
                    : (textColor ?? Theme.of(context).primaryColor),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        );
}

class _Button extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final bool isBusy;
  final bool applyHomeNotch;

  const _Button({
    super.key,
    this.margin,
    this.isBusy = false,
    required this.child,
    this.applyHomeNotch = false,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets buttonMargin = margin ?? EdgeInsets.zero;
    if (applyHomeNotch) {
      final data = MediaQuery.of(context);
      buttonMargin = buttonMargin.copyWith(
        bottom: buttonMargin.bottom + data.padding.bottom,
      );
    }
    return Padding(
      padding: buttonMargin,
      child: isBusy ? const AdaptiveLoading(size: 50.0) : child,
    );
  }
}
