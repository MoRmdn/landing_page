import 'package:flutter/material.dart';
import '../utilities/color_util.dart' show ColorUtil;

class AdaptiveLoading extends StatelessWidget {
  final double? size;
  const AdaptiveLoading({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ColorUtil.primaryColor),
    );
  }
}
