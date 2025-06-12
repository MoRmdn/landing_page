import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:landing_page/features/home/presentation/pages/home_page.dart';
import '../core/widgets/page_not_found_view.dart' show PageNotFoundView;

import 'navigation_observer.dart' show GoRouterObserver;

NavigatorState get systemOwnerRouterNavigatorState =>
    systemOwnerRouter.configuration.navigatorKey.currentState!;

final GoRouter systemOwnerRouter = GoRouter(
  observers: <NavigatorObserver>[
    // if (!env.isLive) AppNavigationObserver(),
    GoRouterObserver(),
  ],
  initialLocation: HomePage.path,
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.path,
      name: HomePage.routeName,
      pageBuilder: HomePage.pageBuilder,
    ),
  ],
  errorBuilder: PageNotFoundView.widgetBuilder,
  // redirect to the login page if the user is not logged in
  redirect: (BuildContext context, GoRouterState state) {
    return null;
  },
);
