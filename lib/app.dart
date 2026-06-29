import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/providers/locale_provider.dart';
import 'package:inef_uci/presentation/router/app_router.dart';
import 'package:inef_uci/services/app_lock_service.dart';
import 'package:inef_uci/theme/app_theme.dart';

class InefUciApp extends ConsumerWidget {
  const InefUciApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final router = ref.watch(appRouterProvider);

    ref.listen<AppLockService>(appLockServiceProvider, (prev, next) {
      if (prev?.isLocked == false && next.isLocked) {
        final db = ref.read(appDatabaseProvider);
        db?.close();
        ref.read(appDatabaseProvider.notifier).state = null;
      }
    });

    return MaterialApp.router(
      title: 'INEF UCI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: router,
    );
  }
}
