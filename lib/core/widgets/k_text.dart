import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/generated/l10n.dart';
import 'package:readmore/readmore.dart';

import '../global.dart' show Global;
import '../utilities/color_util.dart' show ColorUtil;

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? fontHeight;
  final TextDecoration? decoration;
  final int? trimLines;
  final List<Annotation>? annotations;
  final TextStyle? style;

  const KText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.fontHeight,
    this.decoration,
    this.trimLines,
    this.annotations,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (trimLines != null) {
      return ReadMoreText(
        text,
        style:
            style ??
            TextStyle(
              fontSize: fontSize?.spMin ?? 15.spMin,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: color,
              height: fontHeight,
              decoration: decoration,
            ),
        trimMode: TrimMode.Line,
        trimLines: trimLines!,
        annotations: annotations,
        trimCollapsedText: S.current.showMore,
        trimExpandedText: S.current.showLess,
        lessStyle: TextStyle(
          fontSize: 15.spMin,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        moreStyle: TextStyle(
          fontSize: 15.spMin,
          fontWeight: FontWeight.w500,
          color: ColorUtil.primaryColor,
        ),
      );
    } else {
      return Text(
        text,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textDirection: Global.kLang == "en"
            ? TextDirection.ltr
            : TextDirection.rtl,
        style:
            style ??
            (Global.kLang == "en"
                ? GoogleFonts.alike(
                    decoration: decoration,
                    decorationColor: color,
                    height: fontHeight,
                    fontSize: fontSize?.spMin ?? 15.spMin,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: color,
                  )
                : GoogleFonts.almarai(
                    decoration: decoration,
                    decorationColor: color,
                    height: fontHeight,
                    fontSize: fontSize?.spMin ?? 15.spMin,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: color,
                  )),
      );
    }
  }
}
