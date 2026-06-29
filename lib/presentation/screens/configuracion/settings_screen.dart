import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/providers/locale_provider.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);
    final lockMin = ref.watch(lockTimeoutProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          // ── Idioma ─────────────────────────────────────────────────────────
          _SectionHeader(l10n.languageLabel),
          RadioGroup<String>(
            groupValue: currentLocale.languageCode,
            onChanged: (v) {
              if (v != null) {
                ref.read(localeProvider.notifier).setLocale(Locale(v));
              }
            },
            child: Column(
              children: [
                RadioListTile<String>(
                  title: Text(l10n.languageEs),
                  value: 'es',
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<String>(
                  title: Text(l10n.languageEn),
                  value: 'en',
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<String>(
                  title: Text(l10n.languageFr),
                  value: 'fr',
                  activeColor: InefColors.primaryDark,
                ),
              ],
            ),
          ),
          const Divider(),

          // ── Bloqueo automático ─────────────────────────────────────────────
          _SectionHeader(l10n.lockTimeout),
          RadioGroup<int>(
            groupValue: lockMin,
            onChanged: (v) {
              if (v != null) ref.read(lockTimeoutProvider.notifier).set(v);
            },
            child: Column(
              children: [
                RadioListTile<int>(
                  title: Text(l10n.lockTimeout5min),
                  value: 5,
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<int>(
                  title: Text(l10n.lockTimeout10min),
                  value: 10,
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<int>(
                  title: Text(l10n.lockTimeout15min),
                  value: 15,
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<int>(
                  title: Text(l10n.lockTimeout20min),
                  value: 20,
                  activeColor: InefColors.primaryDark,
                ),
                RadioListTile<int>(
                  title: Text(l10n.lockTimeout30min),
                  value: 30,
                  activeColor: InefColors.primaryDark,
                ),
              ],
            ),
          ),
          const Divider(),

          // ── Acerca de ──────────────────────────────────────────────────────
          _SectionHeader(l10n.aboutTitle),
          ListTile(
            leading: const Icon(Icons.info_outline,
                color: InefColors.primaryMedium),
            title: Text(l10n.appVersion('1.0.0')),
            subtitle: const Text(
                'Instituto de Nefrología Dr. Abelardo Buch López\nLa Habana, Cuba'),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: InefColors.primaryMedium,
            letterSpacing: 1.2,
          ),
        ),
      );
}
