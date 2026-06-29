import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inef_uci/core/utils/number_format_helper.dart';
import 'package:inef_uci/domain/usecases/calculadoras/ktv_daugirdas_usecase.dart';
import 'package:inef_uci/theme/inef_colors.dart';

import 'package:inef_uci/l10n/app_localizations.dart';

class AutoFilledField extends StatefulWidget {
  const AutoFilledField({
    super.key,
    required this.label,
    required this.unit,
    required this.variable,
    required this.onChanged,
    this.validator,
    this.rangeMin,
    this.rangeMax,
    this.decimals = 2,
  });

  final String label;
  final String unit;
  final KtvVariable variable;
  final ValueChanged<double?> onChanged;
  final String? Function(String?)? validator;
  final double? rangeMin;
  final double? rangeMax;
  final int decimals;

  @override
  State<AutoFilledField> createState() => _AutoFilledFieldState();
}

class _AutoFilledFieldState extends State<AutoFilledField> {
  late TextEditingController _ctrl;
  bool _editedManually = false;
  bool _showRangeWarning = false;

  @override
  void initState() {
    super.initState();
    final v = widget.variable.value;
    _ctrl = TextEditingController(
      text: v != null
          ? NumberFormatHelper.format(v, decimals: widget.decimals, locale: _locale)
          : '',
    );
  }

  String? get _locale {
    try {
      return Intl.defaultLocale;
    } catch (_) {
      return null;
    }
  }

  @override
  void didUpdateWidget(AutoFilledField old) {
    super.didUpdateWidget(old);
    if (!_editedManually && widget.variable.value != old.variable.value) {
      final v = widget.variable.value;
      _ctrl.text = v != null
          ? NumberFormatHelper.format(v, decimals: widget.decimals, locale: _locale)
          : '';
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Color get _badgeColor {
    switch (widget.variable.origin) {
      case VariableOrigin.autoLab:
      case VariableOrigin.autoHd:
        return _editedManually ? InefColors.warning : InefColors.success;
      case VariableOrigin.manual:
        return InefColors.warning;
      case VariableOrigin.missing:
        return InefColors.critical;
    }
  }

  String _badgeText(AppLocalizations l10n) {
    if (_editedManually) return l10n.originManual;
    switch (widget.variable.origin) {
      case VariableOrigin.autoLab:
        final dt = widget.variable.sourceDateTime;
        return dt != null
            ? l10n.originAutoLab(DateFormat('dd/MM/yy HH:mm').format(dt))
            : l10n.originAutoLab('—');
      case VariableOrigin.autoHd:
        final dt = widget.variable.sourceDateTime;
        return dt != null
            ? l10n.originAutoHd(DateFormat('dd/MM/yy HH:mm').format(dt))
            : l10n.originAutoHd('—');
      case VariableOrigin.manual:
        return l10n.originManual;
      case VariableOrigin.missing:
        return l10n.originMissing;
    }
  }

  void _onChanged(String raw) {
    _editedManually = true;
    final parsed = NumberFormatHelper.parseDouble(raw);
    _checkRange(parsed);
    widget.onChanged(parsed);
  }

  void _checkRange(double? v) {
    if (v == null) {
      setState(() => _showRangeWarning = false);
      return;
    }
    final min = widget.rangeMin;
    final max = widget.rangeMax;
    final outOfRange = (min != null && v < min) || (max != null && v > max);
    if (outOfRange != _showRangeWarning) {
      setState(() => _showRangeWarning = outOfRange);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _ctrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: '${widget.label} (${widget.unit})',
            suffixIcon: _showRangeWarning
                ? const Icon(Icons.warning_amber_rounded, color: InefColors.warning)
                : null,
          ),
          validator: widget.validator,
          onChanged: _onChanged,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _badgeColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: _badgeColor.withValues(alpha: 0.4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.variable.origin == VariableOrigin.missing
                        ? Icons.warning_amber
                        : _editedManually
                            ? Icons.edit
                            : Icons.auto_fix_high,
                    size: 12,
                    color: _badgeColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _badgeText(l10n),
                    style: TextStyle(fontSize: 11, color: _badgeColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (_showRangeWarning)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              l10n.warningOutOfRange(
                NumberFormatHelper.format(widget.rangeMin ?? 0, decimals: 1),
                NumberFormatHelper.format(widget.rangeMax ?? 0, decimals: 1),
                widget.unit,
              ),
              style: const TextStyle(color: InefColors.warning, fontSize: 11),
            ),
          ),
      ],
    );
  }
}
