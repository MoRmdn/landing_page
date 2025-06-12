import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

import '../utilities/color_util.dart' show ColorUtil;
import '../utilities/responsive.dart' show responsive;
import 'k_text.dart' show KText;

class KRadio extends StatelessWidget {
  final String label;
  final String description;
  final int value;
  final String icon;
  final Function(dynamic) onChanged;
  final bool isSelected;
  final int? groupValue;

  const KRadio({
    super.key,
    required this.label,
    required this.description,
    required this.value,
    required this.onChanged,
    required this.icon,
    required this.isSelected,
    this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8).r,
        padding: EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          color: ColorUtil.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? ColorUtil.primaryColor
                : ColorUtil.transparentColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            responsive.sizedBoxW10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                KText(
                  text: label,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: ColorUtil.blackColor),
                ),
                KText(
                  text: description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorUtil.blackColor80,
                  ),
                ),
              ],
            ),
            Spacer(),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isSelected ? Icons.check : Icons.radio_button_unchecked,
                color: ColorUtil.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
