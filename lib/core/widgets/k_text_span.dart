import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart' show Global;

class KTextSpan extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontHeight;
  final TextDecoration? decoration;
  final List<InlineSpan> children;

  const KTextSpan({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontHeight,
    this.decoration,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    /// Validate that either text or children is provided
    if (text == null && children.isEmpty) {
      return ErrorWidget(
        'KTextSpan requires either text or children to be provided',
      );
    }

    final defaultStyle = Global.kLang == "en"
        ? GoogleFonts.alike(
            decoration: decoration,
            decorationColor: color,
            height: fontHeight,
            fontSize: fontSize ?? 15,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: color,
          )
        : GoogleFonts.almarai(
            decoration: decoration,
            decorationColor: color,
            height: fontHeight,
            fontSize: fontSize ?? 15,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: color,
          );

    return RichText(
      text: TextSpan(
        text: text,
        style: defaultStyle,
        children: children.isEmpty ? null : children,
      ),
    );
  }
}
