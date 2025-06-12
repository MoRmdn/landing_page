import 'dart:developer' show log;

import 'package:flutter/material.dart' show NavigatorObserver, Route;

class GoRouterObserver extends NavigatorObserver {
  final List<Route<dynamic>> _routeStack = [];

  List<String> get routeNameStack =>
      _routeStack.map((route) => route.settings.name ?? 'unknown').toList();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeStack.add(route);
    log(
      'GoRouter: PUSHED route=${route.settings.name} previousRoute=${previousRoute?.settings.name}',
      name: "GoRouter: PUSHED",
    );
    _printCurrentStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
    }
    log(
      'GoRouter: POPPED route=${route.settings.name} previousRoute=${previousRoute?.settings.name}',
      name: "GoRouter: POPPED",
    );
    _printCurrentStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _routeStack.remove(route);
    log(
      'GoRouter: REMOVED route=${route.settings.name} previousRoute=${previousRoute?.settings.name}',
      name: "GoRouter: REMOVED",
    );
    _printCurrentStack();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final index = _routeStack.indexOf(oldRoute!);
    if (index != -1 && newRoute != null) {
      _routeStack[index] = newRoute;
    }
    log(
      'GoRouter: REPLACED newRoute=${newRoute?.settings.name} oldRoute=${oldRoute.settings.name}',
      name: "GoRouter: REPLACED",
    );
    _printCurrentStack();
  }

  void _printCurrentStack() {
    log('GoRouter: Current Stack:');
    for (int i = 0; i < _routeStack.length; i++) {
      final route = _routeStack[i];
      log(
        '  $i: ${route.settings.name ?? 'unknown'} (${route.runtimeType})',
        name: "GoRouter: Current Stack:",
      );
    }
  }
}
