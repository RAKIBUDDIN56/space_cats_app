import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:space_cats_app/config/config.dart';
import '../providers/user/user_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(context, ref.watch(appThemeProvider)),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(ref.watch(appLanguageProvider)),
      routerConfig: route,
    );
  }
}
