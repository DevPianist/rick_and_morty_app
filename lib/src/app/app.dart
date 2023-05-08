import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/di/dependencies.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';
import 'package:rick_and_morty_app/src/app/router/router.dart';
import 'package:rick_and_morty_app/src/app/theme/theme.dart';
export 'extensions/extensions.dart';
export 'widgets/widgets.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.dependencies,
  });
  final Dependencies dependencies;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin, ThemeMixin {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.dependencies,
      child: MaterialApp.router(
        theme: theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: routerConfig,
      ),
    );
  }
}
