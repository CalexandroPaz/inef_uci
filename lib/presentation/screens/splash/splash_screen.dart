import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/widgets/inef_logo.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _fadeIn = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _ctrl.forward().whenComplete(_onAnimationDone);
  }

  Future<void> _onAnimationDone() async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    final vault = ref.read(keyVaultServiceProvider);
    final hasPin = await vault.hasPinConfigured();
    if (!mounted) return;
    context.go(hasPin ? '/auth' : '/setup-pin');
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: InefColors.primaryDark,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeIn,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                const InefLogo(size: 96, mono: true),
                const SizedBox(height: 24),
                Text(
                  l10n.institutionSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xCCFFFFFF), fontSize: 14, height: 1.4),
                ),
                const Spacer(flex: 3),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    l10n.exclusiveUseNotice,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xAAFFFFFF),
                        fontSize: 11,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.clinicalDisclaimer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0x88FFFFFF),
                      fontSize: 10,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
