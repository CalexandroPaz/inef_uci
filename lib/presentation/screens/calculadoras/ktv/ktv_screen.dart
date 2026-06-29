import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:inef_uci/core/constants/app_constants.dart';
import 'package:inef_uci/core/utils/number_format_helper.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/domain/usecases/calculadoras/ktv_daugirdas_usecase.dart';
import 'package:inef_uci/presentation/widgets/auto_filled_field.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/services/pdf_export_service.dart';
import 'package:inef_uci/theme/inef_colors.dart';
import 'package:inef_uci/l10n/app_localizations.dart';

typedef _KtvArgs = ({AppDatabase db, int pacienteId});

final ktvInputsProvider = StateNotifierProvider.autoDispose
    .family<KtvInputsNotifier, AsyncValue<KtvInputs>, _KtvArgs>(
  (ref, args) => KtvInputsNotifier(args.db, args.pacienteId),
);

class KtvInputsNotifier extends StateNotifier<AsyncValue<KtvInputs>> {
  final AppDatabase _db;
  final int _pacienteId;
  late KtvInputs _current;

  KtvInputsNotifier(this._db, this._pacienteId)
      : super(const AsyncValue.loading()) {
    _load();
  }

  Future<void> _load() async {
    try {
      final uc = KtvDaugirdasUseCase(_db);
      _current = await uc.autopoblar(_pacienteId);
      state = AsyncValue.data(_current);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateUreaPre(double? v) => _update(
        ureaPre: KtvVariable(
          value: v,
          origin: v != null ? VariableOrigin.manual : VariableOrigin.missing,
        ),
      );

  void updateUreaPost(double? v) => _update(
        ureaPost: KtvVariable(
          value: v,
          origin: v != null ? VariableOrigin.manual : VariableOrigin.missing,
        ),
      );

  void updateDuracionH(double? v) => _update(
        duracionH: KtvVariable(
          value: v,
          origin: v != null ? VariableOrigin.manual : VariableOrigin.missing,
        ),
      );

  void updateUfLitros(double? v) => _update(
        ufLitros: KtvVariable(
          value: v,
          origin: v != null ? VariableOrigin.manual : VariableOrigin.missing,
        ),
      );

  void updatePesoPost(double? v) => _update(
        pesoPostKg: KtvVariable(
          value: v,
          origin: v != null ? VariableOrigin.manual : VariableOrigin.missing,
        ),
      );

  void _update({
    KtvVariable? ureaPre,
    KtvVariable? ureaPost,
    KtvVariable? duracionH,
    KtvVariable? ufLitros,
    KtvVariable? pesoPostKg,
  }) {
    _current = KtvInputs(
      ureaPre: ureaPre ?? _current.ureaPre,
      ureaPost: ureaPost ?? _current.ureaPost,
      duracionH: duracionH ?? _current.duracionH,
      ufLitros: ufLitros ?? _current.ufLitros,
      pesoPostKg: pesoPostKg ?? _current.pesoPostKg,
    );
    state = AsyncValue.data(_current);
  }
}

class KtvScreen extends ConsumerStatefulWidget {
  const KtvScreen({
    super.key,
    required this.db,
    required this.pacienteId,
    required this.nombrePaciente,
    required this.numeroHc,
  });

  final AppDatabase db;
  final int pacienteId;
  final String nombrePaciente;
  final String numeroHc;

  @override
  ConsumerState<KtvScreen> createState() => _KtvScreenState();
}

class _KtvScreenState extends ConsumerState<KtvScreen> {
  KtvResult? _result;
  String? _errorMsg;
  bool _saving = false;

  _KtvArgs get _args => (db: widget.db, pacienteId: widget.pacienteId);

  void _calculate(KtvInputs inputs) {
    setState(() {
      _errorMsg = null;
      _result = null;
    });
    if (!inputs.isComplete) {
      setState(() {
        _errorMsg = 'Faltan campos: ${inputs.missingFields.join(', ')}';
      });
      return;
    }
    try {
      final result = KtvDaugirdasEngine.calculate(
        ureaPre: inputs.ureaPre.value!,
        ureaPost: inputs.ureaPost.value!,
        duracionH: inputs.duracionH.value!,
        ufLitros: inputs.ufLitros.value!,
        pesoPostKg: inputs.pesoPostKg.value!,
        inputs: inputs,
      );
      setState(() => _result = result);
    } on ArgumentError catch (e) {
      setState(() => _errorMsg = e.message.toString());
    }
  }

  Future<void> _save(BuildContext context, KtvInputs inputs) async {
    if (_result == null) return;
    setState(() => _saving = true);
    try {
      final inputsJson = {
        'urea_pre': inputs.ureaPre.value,
        'urea_post': inputs.ureaPost.value,
        'duracion_h': inputs.duracionH.value,
        'uf_litros': inputs.ufLitros.value,
        'peso_post_kg': inputs.pesoPostKg.value,
        'origenes': {
          'urea_pre': inputs.ureaPre.origin.name,
          'urea_post': inputs.ureaPost.origin.name,
          'duracion_h': inputs.duracionH.origin.name,
          'uf_litros': inputs.ufLitros.origin.name,
          'peso_post_kg': inputs.pesoPostKg.origin.name,
        }
      };
      final resultJson = {
        'ktv': _result!.ktv,
        'urr': _result!.urr,
        'adecuado': _result!.isAdequate,
      };
      await widget.db.into(widget.db.calculosRealizados).insert(
            CalculosRealizadosCompanion.insert(
              pacienteId: widget.pacienteId,
              tipoCalculo: AppConstants.ktvCalculatorId,
              inputsJson: json.encode(inputsJson),
              resultadoJson: json.encode(resultJson),
            ),
          );
      final logger = AuditLogger(widget.db);
      await logger.log(
        accion: AuditAction.calc,
        entidad: 'calculos_realizados',
        pacienteId: widget.pacienteId,
        detalle: {'tipo': AppConstants.ktvCalculatorId, 'ktv': _result!.ktv},
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).resultSaved),
            backgroundColor: InefColors.success,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _exportPdf(BuildContext context, KtvInputs inputs) async {
    if (_result == null) return;
    final l10n = AppLocalizations.of(context);
    final svc = PdfExportService();
    final bytes = await svc.generateCalculatorPdf(
      titulo: l10n.ktvTitle,
      subtituloInstitucion: l10n.institutionSubtitle,
      disclaimer: l10n.clinicalDisclaimer,
      exclusiveUseNotice: l10n.exclusiveUseNotice,
      nombrePaciente: widget.nombrePaciente,
      numerohc: widget.numeroHc,
      fechaHora: DateTime.now(),
      inputs: [
        PdfTableRow(
          label: l10n.fieldUreaPre,
          value: '${NumberFormatHelper.format(inputs.ureaPre.value!, decimals: 1)} mg/dL',
          origin: _originText(inputs.ureaPre, l10n),
        ),
        PdfTableRow(
          label: l10n.fieldUreaPost,
          value: '${NumberFormatHelper.format(inputs.ureaPost.value!, decimals: 1)} mg/dL',
          origin: _originText(inputs.ureaPost, l10n),
        ),
        PdfTableRow(
          label: l10n.fieldDuration,
          value:
              '${NumberFormatHelper.format(inputs.duracionH.value! * 60, decimals: 0)} min',
          origin: _originText(inputs.duracionH, l10n),
        ),
        PdfTableRow(
          label: l10n.fieldUfVolume,
          value: '${NumberFormatHelper.format(inputs.ufLitros.value!, decimals: 2)} L',
          origin: _originText(inputs.ufLitros, l10n),
        ),
        PdfTableRow(
          label: l10n.fieldWeightPost,
          value: '${NumberFormatHelper.format(inputs.pesoPostKg.value!, decimals: 1)} kg',
          origin: _originText(inputs.pesoPostKg, l10n),
        ),
      ],
      resultados: [
        PdfTableRow(
          label: 'Kt/V (Daugirdas II)',
          value: NumberFormatHelper.format(_result!.ktv, decimals: 2),
          origin: _result!.isAdequate ? l10n.ktvAdequate : l10n.ktvInadequate,
        ),
        PdfTableRow(
          label: 'URR',
          value: '${NumberFormatHelper.format(_result!.urr, decimals: 1)} %',
        ),
      ],
    );
    if (context.mounted) {
      final logger = AuditLogger(widget.db);
      await logger.log(
        accion: AuditAction.pdf,
        entidad: 'ktv_daugirdas_ii',
        pacienteId: widget.pacienteId,
      );
      await Printing.layoutPdf(onLayout: (_) => bytes);
    }
  }

  String _originText(KtvVariable v, AppLocalizations l10n) {
    switch (v.origin) {
      case VariableOrigin.autoLab:
        return l10n.originAutoLab(
            v.sourceDateTime != null ? _fmtDt(v.sourceDateTime!) : '—');
      case VariableOrigin.autoHd:
        return l10n.originAutoHd(
            v.sourceDateTime != null ? _fmtDt(v.sourceDateTime!) : '—');
      case VariableOrigin.manual:
        return l10n.originManual;
      case VariableOrigin.missing:
        return l10n.originMissing;
    }
  }

  String _fmtDt(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final inputsAsync = ref.watch(ktvInputsProvider(_args));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.ktvTitle)),
      body: inputsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('${l10n.error}: $e')),
        data: (inputs) => _buildForm(context, inputs, l10n),
      ),
    );
  }

  Widget _buildForm(
      BuildContext context, KtvInputs inputs, AppLocalizations l10n) {
    final notifier = ref.read(ktvInputsProvider(_args).notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            avatar: const Icon(Icons.person_outline, size: 16),
            label: Text('${widget.nombrePaciente} · HC: ${widget.numeroHc}'),
          ),
          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Variables de entrada',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  AutoFilledField(
                    label: l10n.fieldUreaPre,
                    unit: 'mg/dL',
                    variable: inputs.ureaPre,
                    rangeMin: 5,
                    rangeMax: 400,
                    decimals: 1,
                    onChanged: (v) => notifier.updateUreaPre(v),
                  ),
                  const SizedBox(height: 16),
                  AutoFilledField(
                    label: l10n.fieldUreaPost,
                    unit: 'mg/dL',
                    variable: inputs.ureaPost,
                    rangeMin: 2,
                    rangeMax: 400,
                    decimals: 1,
                    onChanged: (v) => notifier.updateUreaPost(v),
                  ),
                  const SizedBox(height: 16),
                  AutoFilledField(
                    label: l10n.fieldDuration,
                    unit: 'min',
                    variable: KtvVariable(
                      value: inputs.duracionH.value != null
                          ? inputs.duracionH.value! * 60
                          : null,
                      origin: inputs.duracionH.origin,
                      sourceDateTime: inputs.duracionH.sourceDateTime,
                    ),
                    rangeMin: 30,
                    rangeMax: 720,
                    decimals: 0,
                    onChanged: (v) =>
                        notifier.updateDuracionH(v != null ? v / 60.0 : null),
                  ),
                  const SizedBox(height: 16),
                  AutoFilledField(
                    label: l10n.fieldUfVolume,
                    unit: 'L',
                    variable: inputs.ufLitros,
                    rangeMin: 0,
                    rangeMax: 10,
                    decimals: 2,
                    onChanged: (v) => notifier.updateUfLitros(v),
                  ),
                  const SizedBox(height: 16),
                  AutoFilledField(
                    label: l10n.fieldWeightPost,
                    unit: 'kg',
                    variable: inputs.pesoPostKg,
                    rangeMin: 10,
                    rangeMax: 300,
                    decimals: 1,
                    onChanged: (v) => notifier.updatePesoPost(v),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (_errorMsg != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: InefColors.critical.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: InefColors.critical.withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: InefColors.critical),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(_errorMsg!,
                          style: const TextStyle(color: InefColors.critical))),
                ],
              ),
            ),

          if (_result != null) _buildResult(l10n),

          const SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: () => _calculate(inputs),
            icon: const Icon(Icons.calculate),
            label: Text(l10n.calculate),
          ),

          if (_result != null) ...[
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _saving ? null : () => _save(context, inputs),
                  icon: _saving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.save_outlined),
                  label: Text(l10n.saveResult),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _exportPdf(context, inputs),
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: Text(l10n.exportPdf),
                ),
              ),
            ]),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildResult(AppLocalizations l10n) {
    final result = _result!;
    final adequate = result.isAdequate;
    final color = adequate ? InefColors.success : InefColors.critical;

    return Card(
      color: color.withValues(alpha: 0.06),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withValues(alpha: 0.4), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              l10n.ktvResult(
                  NumberFormatHelper.format(result.ktv, decimals: 2)),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  adequate ? Icons.check_circle : Icons.cancel,
                  color: color,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Text(
                  adequate ? l10n.ktvAdequate : l10n.ktvInadequate,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'URR: ${NumberFormatHelper.format(result.urr, decimals: 1)} %',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
