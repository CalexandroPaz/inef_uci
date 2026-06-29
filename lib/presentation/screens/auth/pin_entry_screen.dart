import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/core/constants/app_constants.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/widgets/inef_logo.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class PinEntryScreen extends ConsumerStatefulWidget {
  const PinEntryScreen({super.key});

  @override
  ConsumerState<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends ConsumerState<PinEntryScreen> {
  String _pin = '';
  String? _error;
  bool _submitting = false;

  void _onDigit(String d) {
    final lockService = ref.read(appLockServiceProvider);
    if (lockService.isLockedOut || _submitting) return;
    if (_pin.length >= AppConstants.pinLength) return;
    setState(() {
      _pin += d;
      _error = null;
    });
    if (_pin.length == AppConstants.pinLength) {
      _submit();
    }
  }

  void _onDelete() {
    if (_pin.isEmpty) return;
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  Future<void> _submit() async {
    if (_submitting) return;
    setState(() => _submitting = true);
    try {
      final lockService = ref.read(appLockServiceProvider);
      final vault = ref.read(keyVaultServiceProvider);
      final l10n = AppLocalizations.of(context);

      final ok = await lockService.tryUnlockWithPin(_pin);
      if (!ok) {
        final remaining =
            AppConstants.maxPinAttempts - lockService.failedAttempts;
        setState(() {
          _pin = '';
          _error = lockService.isLockedOut
              ? l10n.accountLocked
              : l10n.attemptsRemaining(remaining.clamp(0, AppConstants.maxPinAttempts));
          _submitting = false;
        });
        return;
      }

      final dmkHex = vault.dmkHex;
      if (dmkHex == null) {
        setState(() {
          _error = 'Error de seguridad: DMK no disponible';
          _submitting = false;
          _pin = '';
        });
        return;
      }

      final db = await openAppDatabase(dmkHex);
      ref.read(appDatabaseProvider.notifier).state = db;
      if (mounted) context.go('/pacientes');
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
        _submitting = false;
        _pin = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lockService = ref.watch(appLockServiceProvider);

    return Scaffold(
      backgroundColor: InefColors.primaryDark,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const InefLogo(size: 72, mono: true),
                  const SizedBox(height: 32),
                  Text(l10n.loginTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(l10n.loginSubtitle,
                      style: const TextStyle(color: Color(0xBBFFFFFF))),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(AppConstants.pinLength, (i) {
                      final filled = i < _pin.length;
                      return Container(
                        width: 16,
                        height: 16,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: filled ? Colors.white : Colors.white24,
                          border: Border.all(color: Colors.white38),
                        ),
                      );
                    }),
                  ),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(_error!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: InefColors.critical, fontSize: 13)),
                    ),
                  if (lockService.isLockedOut) ...[
                    const SizedBox(height: 8),
                    StreamBuilder<int>(
                      stream: Stream.periodic(
                          const Duration(seconds: 1), (_) => 0),
                      builder: (context, _) {
                        final rem = lockService.lockoutRemaining;
                        if (rem == null) return const SizedBox.shrink();
                        final s = rem.inSeconds;
                        return Text(
                          '${s}s',
                          style: const TextStyle(
                              color: Color(0xBBFFFFFF), fontSize: 12),
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 32),
                  if (_submitting)
                    const CircularProgressIndicator(color: Colors.white)
                  else
                    _buildKeypad(lockService.isLockedOut),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad(bool disabled) {
    const digits = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['', '0', '⌫'],
    ];
    return Column(
      children: digits
          .map((row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.map((d) {
                  if (d.isEmpty) return const SizedBox(width: 80, height: 64);
                  return GestureDetector(
                    onTap: disabled ? null : () => d == '⌫' ? _onDelete() : _onDigit(d),
                    child: Container(
                      width: 80,
                      height: 64,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: disabled ? Colors.white.withValues(alpha: 0.05) : Colors.white12,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Text(d,
                          style: TextStyle(
                              color: disabled
                                  ? Colors.white38
                                  : Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                    ),
                  );
                }).toList(),
              ))
          .toList(),
    );
  }
}
