import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../utilities/path_util.dart' show PathUtil;
import '/core/utilities/color_util.dart';
import '/core/utilities/extensions.dart';

import 'k_text.dart' show KText;

class GlobalScaffold extends StatelessWidget {
  final Widget? title;
  final String? titleText;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? barChild;
  final bool showTobBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final Widget? drawer;
  final Widget? endDrawer;
  final Key? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? showAppBar;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? showBackButton;
  final bool? topPadding;
  final bool? bottomPadding;
  final EdgeInsets padding;

  const GlobalScaffold({
    super.key,
    required this.body,
    this.title,
    this.titleText,
    this.showTobBar = true,
    this.floatingActionButton,
    this.barChild,
    this.backgroundColor,
    this.drawer,
    this.endDrawer,
    this.scaffoldKey,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset = false,
    this.showAppBar = false,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.topPadding,
    this.bottomPadding,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.currentTheme;
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      appBar: showAppBar == true
          ? AppBar(
              surfaceTintColor: ColorUtil.transparentColor,
              backgroundColor: ColorUtil.whiteColor,
              elevation: 0,
              scrolledUnderElevation: 0,
              shadowColor: ColorUtil.greyColor.withValues(alpha: 0.1),
              leading:
                  showBackButton == true &&
                      (context.canPop() || leading != null)
                  ? leading
                  : null,
              actions: actions,
              title:
                  title ?? (titleText != null ? KText(text: titleText!) : null),
            )
          : null,
      body: SafeArea(
        top: topPadding == true,
        bottom: bottomPadding == true,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(PathUtil.backgroundImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              // light black overlay
              Positioned.fill(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: ColorUtil.blackColor.withValues(alpha: 0.6),
                ),
              ),
              Padding(padding: padding.r, child: body),
            ],
          ),
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
      endDrawer: endDrawer,
    );
  }
}
