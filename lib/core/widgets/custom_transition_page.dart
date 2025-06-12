import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTransitionPageBuilder extends CustomTransitionPage {
  CustomTransitionPageBuilder({
    required LocalKey super.key,
    required Widget page,
    required String name,
  }) : super(
         child: page,
         transitionDuration: const Duration(milliseconds: 500),
         name: name,
         transitionsBuilder:
             (
               BuildContext context,
               Animation<double> animation,
               Animation<double> secondaryAnimation,
               Widget child,
             ) => FadeTransition(
               opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
               child: child,
             ),
       );
}

class FadePageTransitionPageBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => FadeTransition(
    opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
    child: child,
  );
}
