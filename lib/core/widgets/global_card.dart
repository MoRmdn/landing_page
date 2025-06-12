import 'package:flutter/material.dart';

import '../utilities/app_util.dart';

class GlobalCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressEndCallback? onLongPressEnd;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;
  final double? elevation;
  final Gradient? gradient;
  final double? blurRadius;

  const GlobalCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.margin,
    this.padding,
    this.elevation,
    this.borderColor,
    this.gradient,
    this.blurRadius,
    this.onLongPressStart,
    this.onLongPressEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        child: Material(
          elevation: elevation ?? 0.0,
          shadowColor: shadowColor ?? Colors.black,
          shape: ContinuousRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: borderRadius ?? AppUtil.borderRadius8,
          ),
          color: color ?? Theme.of(context).cardColor,
          child: Container(
            decoration: BoxDecoration(gradient: gradient),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
