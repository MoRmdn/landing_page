import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouterState;

import '../../../../core/widgets/custom_transition_page.dart'
    show CustomTransitionPageBuilder;
import '../../../../core/widgets/global_scaffold.dart' show GlobalScaffold;
import '../../../../core/widgets/k_text.dart' show KText;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';
  static const String path = '/home';

  static Page<void> pageBuilder(BuildContext context, GoRouterState state) =>
      CustomTransitionPageBuilder(
        key: state.pageKey,
        name: routeName,
        page: const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return const GlobalScaffold(body: KText(text: 'Home'));
  }
}
