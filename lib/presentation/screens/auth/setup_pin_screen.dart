import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/core/constants/app_constants.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/widgets/inef_logo.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class SetupPinScreen extends ConsumerStatefulWidget {
  const SetupPinScreen({super.key});

  @override
  ConsumerState<SetupPinScreen> createState() => _SetupPinScreenState();
}

class _SetupPinScreenState extends ConsumerState<SetupPinScreen> {
  String _pin = '';
  String _confirmPin = '';
  bool _confirming = false;
  bool _saving = false;
  String? _error;

  void _onDigit(String d) {
    final current = _confirming ? _confirmPin : _pin;
    if (current.length >= AppConstants.pinLength) return;
    setState(() {
      if (_confirming) {
        _confirmPin += d;
      } else {
        _pin += d;
      }
      _error = null;
    });
    final updated = _confirming ? _confirmPin : _pin;
    if (updated.length == AppConstants.pinLength) {
      if (!_confirming) {
        setState(() => _confirming = true);
      } else {
        _finish();
      }
    }
  }

  void _onDelete() {
    setState(() {
      if (_confirming) {
        if (_confirmPin.isNotEmpty) {
          _confirmPin = _confirmPin.substring(0, _confirmPin.length - 1);
        }
      } else {
        if (_pin.isNotEmpty) {
          _pin = _pin.substring(0, _pin.length - 1);
        }
      }
    });
  }

  Future<void> _finish() async {
    if (_pin != _confirmPin) {
      setState(() {
        _error = 'Los PIN no coinciden';
        _confirmPin = '';
        _confirming = false;
      });
      return;
    }
    setState(() => _saving = true);
    try {
      final vault = ref.read(keyVaultServiceProvider);
      await vault.initializeDmk();
      await vault.setPinHash(_pin);
      final dmkHex = vault.dmkHex;
      if (dmkHex == null) throw Exception('DMK no disponible');
      final db = await openAppDatabase(dmkHex);
      ref.read(appDatabaseProvider.notifier).state = db;
      ref.read(appLockServiceProvider).setUnlocked();
      if (mounted) context.go('/pacientes');
    } catch (e) {
      setState(() {
        _error = 'Error al configurar: $e';
        _saving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final activePin = _confirming ? _confirmPin : _pin;
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
                  const InefLogo(size: 64, mono: true),
                  const SizedBox(height: 24),
                  Text(
                    _confirming ? l10n.pinConfirm : l10n.pinSetupTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.pinSetupSubtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xBBFFFFFF), fontSize: 13)),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(AppConstants.pinLength, (i) {
                      final filled = i < activePin.length;
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
                          style:
                              const TextStyle(color: InefColors.critical)),
                    ),
                  const SizedBox(height: 32),
                  if (_saving)
                    const CircularProgressIndicator(color: Colors.white)
                  else
                    _buildKeypad(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
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
                    onTap: () => d == '⌫' ? _onDelete() : _onDigit(d),
                    child: Container(
                      width: 80,
                      height: 64,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Text(d,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22)),
                    ),
                  );
                }).toList(),
              ))
          .toList(),
    );
  }
}
