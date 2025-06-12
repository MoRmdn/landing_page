import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart'
    show LoadingAnimationWidget;

import '../utilities/color_util.dart' show ColorUtil;
import '../utilities/responsive.dart' show responsive;
import 'k_text.dart';

class KElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool isDisabled;
  final double? width;
  final double height;
  final Widget? child;
  final bool isLoading;
  const KElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isDisabled = false,
    this.width,
    this.height = 45,
    this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            width: width ?? responsive.sWidth(context),
            height: height,
            child: ElevatedButton(
              onPressed: isDisabled || isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtil.primaryColor,
                disabledBackgroundColor: ColorUtil.primaryColor.withValues(
                  alpha: 0.1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.spMin),
                ),
              ),
              child: Center(
                child:
                    child ??
                    (isLoading
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            size: 40.r,
                            color: ColorUtil.whiteColor,
                          )
                        : KText(
                            text: text,
                            fontSize: 15.spMin,
                            fontWeight: FontWeight.w700,
                            fontHeight: 1.5,
                            color: isDisabled
                                ? ColorUtil.primaryColor.withValues(alpha: 0.5)
                                : ColorUtil.whiteColor,
                          )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
