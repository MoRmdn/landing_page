import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/utilities/responsive.dart';

import '../utilities/color_util.dart' show ColorUtil;

class KBottomNavigationBar extends StatelessWidget {
  final Widget child;
  final double height;
  final double? width;
  final EdgeInsets? padding;
  const KBottomNavigationBar({
    super.key,
    required this.child,
    this.height = 70,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ??
          EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: responsive.sBottomPadding(context),
          ).r,
      height: (height + responsive.sBottomPadding(context)).spMin,
      width: width?.spMin,
      decoration: BoxDecoration(
        color: ColorUtil.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ).r,
        boxShadow: [
          BoxShadow(
            color: ColorUtil.greyColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: child,
    );
  }
}
