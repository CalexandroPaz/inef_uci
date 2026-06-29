import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/services/audit_logger.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class PacienteFormScreen extends ConsumerStatefulWidget {
  const PacienteFormScreen({super.key, this.pacienteId});
  final int? pacienteId;

  @override
  ConsumerState<PacienteFormScreen> createState() =>
      _PacienteFormScreenState();
}

class _PacienteFormScreenState extends ConsumerState<PacienteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;
  bool _saving = false;

  final _hcCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();
  final _cedulaCtrl = TextEditingController();
  final _pesoSecoCtrl = TextEditingController();
  final _pesoActualCtrl = TextEditingController();
  final _tallaCtrl = TextEditingController();
  final _servicioCtrl = TextEditingController();
  final _motivoCtrl = TextEditingController();

  DateTime? _fechaNacimiento;
  DateTime? _fechaIngreso;
  String _sexo = 'M';
  String? _grupoSanguineo;
  String? _factorRh;
  String _estado = 'activo';

  static const _grupos = ['A', 'B', 'AB', 'O'];
  static const _factoresRh = ['+', '-'];
  static const _servicios = [
    'UCI',
    'Nefrología',
    'Hemodiálisis',
    'Trasplante',
    'Otro',
  ];

  @override
  void initState() {
    super.initState();
    _loadIfEditing();
  }

  @override
  void dispose() {
    _hcCtrl.dispose();
    _nombreCtrl.dispose();
    _cedulaCtrl.dispose();
    _pesoSecoCtrl.dispose();
    _pesoActualCtrl.dispose();
    _tallaCtrl.dispose();
    _servicioCtrl.dispose();
    _motivoCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadIfEditing() async {
    if (widget.pacienteId == null) {
      setState(() => _loading = false);
      return;
    }
    final db = ref.read(appDatabaseProvider);
    if (db == null) {
      setState(() => _loading = false);
      return;
    }
    final p = await db.getPacienteById(widget.pacienteId!);
    if (p != null && mounted) {
      setState(() {
        _hcCtrl.text = p.numeroHc;
        _nombreCtrl.text = p.nombreCompleto;
        _cedulaCtrl.text = p.cedula ?? '';
        _sexo = p.sexo;
        _fechaNacimiento = p.fechaNacimiento;
        _grupoSanguineo = p.grupoSanguineo;
        _factorRh = p.factorRh;
        _pesoSecoCtrl.text = p.pesoSeco?.toString() ?? '';
        _pesoActualCtrl.text = p.pesoActual?.toString() ?? '';
        _tallaCtrl.text = p.talla?.toString() ?? '';
        _servicioCtrl.text = p.servicioActual ?? '';
        _estado = p.estado;
        _fechaIngreso = p.fechaIngreso;
        _motivoCtrl.text = p.motivoIngreso ?? '';
        _loading = false;
      });
    } else {
      setState(() => _loading = false);
    }
  }

  String _normalizarNombre(String nombre) {
    var s = nombre.toLowerCase();
    const from = 'áéíóúàèìòùäëïöüâêîôûãõñç';
    const to   = 'aeiouaeiouaeiouaeiouaonc';
    for (var i = 0; i < from.length; i++) {
      s = s.replaceAll(from[i], to[i]);
    }
    return s;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '${AppLocalizations.of(context).fieldBirthDate}: ${AppLocalizations.of(context).fieldRequired}'),
          backgroundColor: InefColors.critical,
        ),
      );
      return;
    }

    setState(() => _saving = true);
    final db = ref.read(appDatabaseProvider);
    if (db == null) return;
    final l10n = AppLocalizations.of(context);

    try {
      final companion = PacientesCompanion(
        numeroHc: Value(_hcCtrl.text.trim()),
        nombreCompleto: Value(_nombreCtrl.text.trim()),
        nombreNormalizado: Value(_normalizarNombre(_nombreCtrl.text.trim())),
        cedula: Value(_cedulaCtrl.text.trim().isEmpty
            ? null
            : _cedulaCtrl.text.trim()),
        fechaNacimiento: Value(_fechaNacimiento!),
        sexo: Value(_sexo),
        grupoSanguineo: Value(_grupoSanguineo),
        factorRh: Value(_factorRh),
        pesoSeco: Value(double.tryParse(_pesoSecoCtrl.text)),
        pesoActual: Value(double.tryParse(_pesoActualCtrl.text)),
        talla: Value(double.tryParse(_tallaCtrl.text)),
        servicioActual: Value(_servicioCtrl.text.trim().isEmpty
            ? null
            : _servicioCtrl.text.trim()),
        estado: Value(_estado),
        fechaIngreso: Value(_fechaIngreso),
        motivoIngreso: Value(_motivoCtrl.text.trim().isEmpty
            ? null
            : _motivoCtrl.text.trim()),
      );

      final logger = AuditLogger(db);
      if (widget.pacienteId == null) {
        final id = await db.insertarPaciente(companion);
        await logger.log(
          accion: AuditAction.create,
          entidad: 'pacientes',
          entidadId: id,
          detalle: {'hc': _hcCtrl.text.trim()},
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.patientSaved),
              backgroundColor: InefColors.success,
            ),
          );
          context.go('/pacientes');
        }
      } else {
        await db.actualizarPaciente(widget.pacienteId!, companion);
        await logger.log(
          accion: AuditAction.update,
          entidad: 'pacientes',
          entidadId: widget.pacienteId,
          detalle: {'hc': _hcCtrl.text.trim()},
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.patientUpdated),
              backgroundColor: InefColors.success,
            ),
          );
          context.go('/pacientes');
        }
      }
    } on Exception catch (e) {
      final msg = e.toString().toLowerCase().contains('unique')
          ? l10n.duplicateHc
          : '${l10n.error}: $e';
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: InefColors.critical),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _pickDate(BuildContext context,
      {required bool isBirth}) async {
    final l10n = AppLocalizations.of(context);
    final initial = isBirth
        ? (_fechaNacimiento ?? DateTime(1970))
        : (_fechaIngreso ?? DateTime.now());
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: isBirth ? l10n.fieldBirthDate : l10n.fieldAdmissionDate,
    );
    if (picked != null) {
      setState(() {
        if (isBirth) {
          _fechaNacimiento = picked;
        } else {
          _fechaIngreso = picked;
        }
      });
    }
  }

  String _fmtDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isNew = widget.pacienteId == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNew ? l10n.newPatient : l10n.edit),
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            TextButton(
              onPressed: _save,
              child: Text(l10n.save,
                  style: const TextStyle(
                      color: InefColors.primaryDark,
                      fontWeight: FontWeight.bold)),
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _sectionHeader(l10n.generalData),
                  const SizedBox(height: 12),

                  // HC
                  TextFormField(
                    controller: _hcCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.fieldHc,
                      prefixIcon: const Icon(Icons.badge_outlined),
                    ),
                    textCapitalization: TextCapitalization.characters,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l10n.fieldRequired : null,
                  ),
                  const SizedBox(height: 12),

                  // Nombre completo
                  TextFormField(
                    controller: _nombreCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.fieldFullName,
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                    textCapitalization: TextCapitalization.words,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l10n.fieldRequired : null,
                  ),
                  const SizedBox(height: 12),

                  // Cédula
                  TextFormField(
                    controller: _cedulaCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.fieldCedula,
                      prefixIcon: const Icon(Icons.credit_card_outlined),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),

                  // Fecha de nacimiento
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.cake_outlined,
                        color: InefColors.primaryMedium),
                    title: Text(l10n.fieldBirthDate),
                    subtitle: Text(
                      _fechaNacimiento != null
                          ? _fmtDate(_fechaNacimiento!)
                          : l10n.selectDate,
                      style: TextStyle(
                        color: _fechaNacimiento != null
                            ? null
                            : Colors.grey[500],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _pickDate(context, isBirth: true),
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 12),

                  // Sexo
                  Text(l10n.fieldSex,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  SegmentedButton<String>(
                    segments: [
                      ButtonSegment(value: 'M', label: Text(l10n.sexMale)),
                      ButtonSegment(value: 'F', label: Text(l10n.sexFemale)),
                    ],
                    selected: {_sexo},
                    onSelectionChanged: (s) =>
                        setState(() => _sexo = s.first),
                  ),
                  const SizedBox(height: 12),

                  // Grupo sanguíneo + Rh
                  Row(children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _grupoSanguineo,
                        decoration: InputDecoration(
                            labelText: l10n.fieldBloodGroup),
                        items: [
                          const DropdownMenuItem(
                              value: null, child: Text('—')),
                          ..._grupos.map((g) =>
                              DropdownMenuItem(value: g, child: Text(g))),
                        ],
                        onChanged: (v) =>
                            setState(() => _grupoSanguineo = v),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: _factorRh,
                        decoration:
                            InputDecoration(labelText: l10n.fieldRhFactor),
                        items: [
                          const DropdownMenuItem(
                              value: null, child: Text('—')),
                          ..._factoresRh.map((r) =>
                              DropdownMenuItem(value: r, child: Text(r))),
                        ],
                        onChanged: (v) => setState(() => _factorRh = v),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),

                  _sectionHeader(l10n.fieldService),
                  const SizedBox(height: 12),

                  // Servicio
                  DropdownButtonFormField<String>(
                    initialValue: _servicioCtrl.text.isEmpty
                        ? null
                        : (_servicios.contains(_servicioCtrl.text)
                            ? _servicioCtrl.text
                            : null),
                    decoration:
                        InputDecoration(labelText: l10n.fieldService),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('—')),
                      ..._servicios.map((s) =>
                          DropdownMenuItem(value: s, child: Text(s))),
                    ],
                    onChanged: (v) =>
                        setState(() => _servicioCtrl.text = v ?? ''),
                  ),
                  const SizedBox(height: 12),

                  // Fecha ingreso
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.login_outlined,
                        color: InefColors.primaryMedium),
                    title: Text(l10n.fieldAdmissionDate),
                    subtitle: Text(
                      _fechaIngreso != null
                          ? _fmtDate(_fechaIngreso!)
                          : '—',
                      style: TextStyle(
                        color: _fechaIngreso != null
                            ? null
                            : Colors.grey[500],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _pickDate(context, isBirth: false),
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 12),

                  // Motivo de ingreso
                  TextFormField(
                    controller: _motivoCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.fieldAdmissionReason,
                      prefixIcon: const Icon(Icons.note_outlined),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),

                  _sectionHeader('Medidas antropométricas'),
                  const SizedBox(height: 12),

                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pesoSecoCtrl,
                        decoration: InputDecoration(
                            labelText: l10n.fieldDryWeight),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (v) {
                          if (v == null || v.isEmpty) return null;
                          final d = double.tryParse(v);
                          if (d == null || d <= 0 || d > 300) {
                            return '1–300';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _pesoActualCtrl,
                        decoration: InputDecoration(
                            labelText: l10n.fieldCurrentWeight),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        validator: (v) {
                          if (v == null || v.isEmpty) return null;
                          final d = double.tryParse(v);
                          if (d == null || d <= 0 || d > 300) {
                            return '1–300';
                          }
                          return null;
                        },
                      ),
                    ),
                  ]),
                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _tallaCtrl,
                    decoration:
                        InputDecoration(labelText: l10n.fieldHeight),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    validator: (v) {
                      if (v == null || v.isEmpty) return null;
                      final d = double.tryParse(v);
                      if (d == null || d < 50 || d > 250) return '50–250';
                      return null;
                    },
                  ),

                  if (!isNew) ...[
                    const SizedBox(height: 20),
                    _sectionHeader(l10n.filterStatus),
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: [
                        ButtonSegment(
                            value: 'activo', label: Text(l10n.statusActive)),
                        ButtonSegment(
                            value: 'egresado',
                            label: Text(l10n.statusDischarged)),
                        ButtonSegment(
                            value: 'fallecido',
                            label: Text(l10n.statusDeceased)),
                      ],
                      selected: {_estado},
                      onSelectionChanged: (s) =>
                          setState(() => _estado = s.first),
                    ),
                  ],

                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: _saving ? null : _save,
                    icon: const Icon(Icons.save_outlined),
                    label: Text(l10n.save),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: InefColors.primaryDark,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: InefColors.primaryDark,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        letterSpacing: 0.5,
      ),
    );
  }
}

