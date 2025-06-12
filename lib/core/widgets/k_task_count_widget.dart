import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/color_util.dart' show ColorUtil;
import 'k_text.dart' show KText;

class KTaskCountWidget extends StatelessWidget {
  const KTaskCountWidget({
    super.key,
    required this.count,
    required this.title,
    required this.type,
  });
  final String count;
  final String title;
  final KTaskCountWidgetType type;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(12.spMin),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.spMin),
            border: Border.all(
              color: ColorUtil.greyColor.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              KText(
                text: count,
                fontSize: 12.spMin,
                fontWeight: FontWeight.bold,
                color: ColorUtil.blackColor,
              ),
              KText(
                text: title,
                fontSize: 12.spMin,
                fontWeight: FontWeight.w400,
                color: ColorUtil.blackColor,
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          left: 0,
          child: Transform.translate(
            offset: Offset(0, 15.spMin),
            child: Container(
              alignment: Alignment.center,
              width: 5.spMin,
              height: 30.spMin,
              decoration: BoxDecoration(
                color: type.color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.spMin),
                  bottomRight: Radius.circular(12.spMin),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum KTaskCountWidgetType {
  pending(color: ColorUtil.greyColor),
  completed(color: ColorUtil.greenColor),
  inProgress(color: ColorUtil.orangeColor),
  delayed(color: ColorUtil.redColor);

  const KTaskCountWidgetType({required this.color});
  final Color color;
}
