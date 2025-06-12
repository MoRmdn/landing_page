import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../generated/l10n.dart';
import '../utilities/path_util.dart';
import 'custom_transition_page.dart';
import 'global_scaffold.dart';

class PageNotFoundView extends StatelessWidget {
  final String? errorMsg;
  final bool homeButtonEnabled;

  const PageNotFoundView({
    super.key,
    this.errorMsg,
    this.homeButtonEnabled = true,
  });

  static const String routeName = "not-found";
  static const String path = '/not-found';

  static GoRouterWidgetBuilder widgetBuilder = (context, state) =>
      PageNotFoundView(errorMsg: state.error.toString());

  static GoRouterPageBuilder pageBuilder = (context, state) =>
      CustomTransitionPageBuilder(
        key: state.pageKey,
        name: routeName,
        page: PageNotFoundView(errorMsg: state.error.toString()),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String? error = errorMsg;
    if (error != null && error.length > 100) {
      error = errorMsg!.substring(0, 100);
    }

    return GlobalScaffold(
      showTobBar: true,
      topPadding: true,
      bottomPadding: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(PathUtil.pageNotFoundLottie, fit: BoxFit.fitWidth),
          Text(
            S.of(context).pageNotFound,
            style: theme.textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Text(
            // show 100 characters of the error msg
            "${error ?? S.of(context).pageNotFoundMsg}...",
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
