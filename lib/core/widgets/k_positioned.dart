import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global.dart' show Global;

class KPositioned extends StatelessWidget {
  const KPositioned({
    super.key,
    this.top,
    this.bottom,
    required this.child,
    required this.isEnglishOnRight,
    required this.value,
  });
  final double? top;
  final double? bottom;
  final Widget child;
  final bool isEnglishOnRight;
  final double value;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Global.kLang == "en";
    return Positioned(
      top: top,
      bottom: bottom,
      right:
          (isEnglish && isEnglishOnRight) || (!isEnglish && !isEnglishOnRight)
          ? value.sp
          : null,
      left: (!isEnglish && isEnglishOnRight) || (isEnglish && !isEnglishOnRight)
          ? value.sp
          : null,
      child: child,
    );
  }
}
