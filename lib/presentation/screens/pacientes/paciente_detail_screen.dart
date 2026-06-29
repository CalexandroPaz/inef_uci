import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class PacienteDetailScreen extends ConsumerStatefulWidget {
  final int pacienteId;
  const PacienteDetailScreen({super.key, required this.pacienteId});

  @override
  ConsumerState<PacienteDetailScreen> createState() =>
      _PacienteDetailScreenState();
}

class _PacienteDetailScreenState extends ConsumerState<PacienteDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() => _tabIndex = _tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final pacienteAsync = ref.watch(pacienteByIdProvider(widget.pacienteId));

    return pacienteAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('...')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: Text(l10n.error)),
        body: Center(child: Text(e.toString())),
      ),
      data: (paciente) {
        if (paciente == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Icon(Icons.person_off, size: 64)),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              paciente.nombreCompleto,
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: l10n.edit,
                onPressed: () =>
                    context.go('/pacientes/${widget.pacienteId}/editar'),
              ),
              IconButton(
                icon: const Icon(Icons.calculate_outlined),
                tooltip: 'Kt/V',
                onPressed: () => context.go(
                  '/pacientes/${widget.pacienteId}/ktv',
                  extra: {
                    'nombre': paciente.nombreCompleto,
                    'hc': paciente.numeroHc,
                  },
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(icon: const Icon(Icons.person_outline, size: 18), text: l10n.tabData),
                Tab(icon: const Icon(Icons.biotech_outlined, size: 18), text: l10n.labs),
                Tab(icon: const Icon(Icons.monitor_heart_outlined, size: 18), text: l10n.vitals),
                Tab(icon: const Icon(Icons.water_drop_outlined, size: 18), text: l10n.tabHd),
                Tab(icon: const Icon(Icons.air_outlined, size: 18), text: l10n.tabVent),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _DatosTab(paciente: paciente, l10n: l10n),
              _LabsTab(pacienteId: widget.pacienteId, l10n: l10n),
              _VitalesTab(pacienteId: widget.pacienteId, l10n: l10n),
              _HdTab(pacienteId: widget.pacienteId, l10n: l10n),
              _VentTab(pacienteId: widget.pacienteId, l10n: l10n),
            ],
          ),
          floatingActionButton: switch (_tabIndex) {
            1 => FloatingActionButton.extended(
                heroTag: 'fab_lab',
                icon: const Icon(Icons.add),
                label: Text(l10n.newLab),
                backgroundColor: InefColors.primaryDark,
                foregroundColor: Colors.white,
                onPressed: () => context
                    .go('/pacientes/${widget.pacienteId}/labs/nuevo'),
              ),
            2 => FloatingActionButton.extended(
                heroTag: 'fab_vitales',
                icon: const Icon(Icons.add),
                label: Text(l10n.newVitalSigns),
                backgroundColor: InefColors.primaryDark,
                foregroundColor: Colors.white,
                onPressed: () => context.go(
                    '/pacientes/${widget.pacienteId}/vitales/nuevo'),
              ),
            3 => FloatingActionButton.extended(
                heroTag: 'fab_hd',
                icon: const Icon(Icons.add),
                label: Text(l10n.hdNew),
                backgroundColor: InefColors.primaryDark,
                foregroundColor: Colors.white,
                onPressed: () => context
                    .go('/pacientes/${widget.pacienteId}/hd/nuevo'),
              ),
            4 => FloatingActionButton.extended(
                heroTag: 'fab_vent',
                icon: const Icon(Icons.add),
                label: Text(l10n.ventNew),
                backgroundColor: InefColors.primaryDark,
                foregroundColor: Colors.white,
                onPressed: () => context.go(
                    '/pacientes/${widget.pacienteId}/ventilacion/nuevo'),
              ),
            _ => null,
          },
        );
      },
    );
  }
}

// ─── Tab: Datos del paciente ─────────────────────────────────────────────────

class _DatosTab extends StatelessWidget {
  final Paciente paciente;
  final AppLocalizations l10n;
  const _DatosTab({required this.paciente, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final age = _calcAge(paciente.fechaNacimiento);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionCard(
          title: 'Datos personales',
          children: [
            _InfoRow(l10n.fieldFullName, paciente.nombreCompleto),
            _InfoRow(l10n.fieldHc, paciente.numeroHc),
            if (paciente.cedula != null)
              _InfoRow(l10n.fieldCedula, paciente.cedula!),
            _InfoRow(l10n.fieldBirthDate, _fmtDate(paciente.fechaNacimiento)),
            _InfoRow('Edad', l10n.ageYears(age)),
            _InfoRow(
              l10n.fieldSex,
              paciente.sexo == 'M' ? l10n.sexMale : l10n.sexFemale,
            ),
            if (paciente.grupoSanguineo != null)
              _InfoRow(l10n.fieldBloodGroup, paciente.grupoSanguineo!),
            if (paciente.factorRh != null)
              _InfoRow(l10n.fieldRhFactor, paciente.factorRh!),
          ],
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: 'Medidas',
          children: [
            if (paciente.pesoSeco != null)
              _InfoRow(
                l10n.fieldDryWeight,
                '${paciente.pesoSeco!.toStringAsFixed(1)} kg',
              ),
            if (paciente.pesoActual != null)
              _InfoRow(
                l10n.fieldCurrentWeight,
                '${paciente.pesoActual!.toStringAsFixed(1)} kg',
              ),
            if (paciente.talla != null)
              _InfoRow(
                l10n.fieldHeight,
                '${paciente.talla!.toStringAsFixed(0)} cm',
              ),
            if (paciente.pesoActual != null && paciente.talla != null)
              _InfoRow('IMC', _calcImc(paciente.pesoActual!, paciente.talla!)),
          ],
        ),
        const SizedBox(height: 12),
        _SectionCard(
          title: 'Admisión',
          children: [
            if (paciente.servicioActual != null)
              _InfoRow(l10n.fieldService, paciente.servicioActual!),
            if (paciente.fechaIngreso != null)
              _InfoRow(
                l10n.fieldAdmissionDate,
                _fmtDate(paciente.fechaIngreso!),
              ),
            if (paciente.motivoIngreso != null &&
                paciente.motivoIngreso!.isNotEmpty)
              _InfoRow(l10n.fieldAdmissionReason, paciente.motivoIngreso!),
            _InfoRow(l10n.filterStatus, _estadoLabel(paciente.estado, l10n)),
          ],
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          icon: const Icon(Icons.article_outlined),
          label: Text(l10n.historiaEdit),
          style: OutlinedButton.styleFrom(
            foregroundColor: InefColors.primaryDark,
            side: const BorderSide(color: InefColors.primaryDark),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () =>
              context.push('/pacientes/${paciente.id}/historia'),
        ),
      ],
    );
  }

  int _calcAge(DateTime dob) {
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  String _calcImc(double peso, double tallaCm) {
    final tallaM = tallaCm / 100;
    return (peso / (tallaM * tallaM)).toStringAsFixed(1);
  }

  String _fmtDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';

  String _estadoLabel(String estado, AppLocalizations l10n) {
    switch (estado) {
      case 'egresado':
        return l10n.statusDischarged;
      case 'fallecido':
        return l10n.statusDeceased;
      default:
        return l10n.statusActive;
    }
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final nonEmpty = children.isNotEmpty;
    if (!nonEmpty) return const SizedBox.shrink();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: InefColors.primaryDark,
              ),
            ),
            const Divider(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Tab: Laboratorio ────────────────────────────────────────────────────────

class _LabsTab extends ConsumerWidget {
  final int pacienteId;
  final AppLocalizations l10n;
  const _LabsTab({required this.pacienteId, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labsAsync = ref.watch(laboratoriosStreamProvider(pacienteId));
    final parametrosAsync = ref.watch(parametrosClinicosProvider);
    final parametros = parametrosAsync.value ?? [];

    return labsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
      data: (labs) {
        if (labs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.biotech_outlined,
                  size: 64,
                  color: InefColors.primaryLight,
                ),
                const SizedBox(height: 16),
                Text(l10n.noLabs,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
          itemCount: labs.length,
          itemBuilder: (context, i) =>
              _LabCard(lab: labs[i], parametros: parametros),
        );
      },
    );
  }
}

class _LabCard extends StatelessWidget {
  final Laboratorio lab;
  final List<ParametrosClinico> parametros;
  const _LabCard({required this.lab, required this.parametros});

  @override
  Widget build(BuildContext context) {
    final param = parametros
        .where((p) => p.codigo == lab.parametroCodigo)
        .firstOrNull;
    final isOutOfRange = param != null &&
        ((param.rangoMin != null && lab.valorCanonicoMgDl < param.rangoMin!) ||
            (param.rangoMax != null &&
                lab.valorCanonicoMgDl > param.rangoMax!));

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isOutOfRange
              ? InefColors.critical.withValues(alpha: 0.12)
              : InefColors.primaryDark.withValues(alpha: 0.10),
          child: Icon(
            Icons.science_outlined,
            size: 20,
            color:
                isOutOfRange ? InefColors.critical : InefColors.primaryDark,
          ),
        ),
        title: Text(
          param?.nombreEs ?? lab.parametroCodigo,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          _fmtDt(lab.fechaHora),
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${lab.valorOriginal.toStringAsFixed(param?.decimales ?? 2)} ${lab.unidadOriginal}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: isOutOfRange ? InefColors.critical : null,
              ),
            ),
            if (isOutOfRange)
              const Icon(
                Icons.warning_amber_rounded,
                size: 14,
                color: InefColors.critical,
              ),
          ],
        ),
      ),
    );
  }

  String _fmtDt(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}

// ─── Tab: Signos Vitales ─────────────────────────────────────────────────────

class _VitalesTab extends ConsumerWidget {
  final int pacienteId;
  final AppLocalizations l10n;
  const _VitalesTab({required this.pacienteId, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vitalesAsync = ref.watch(signosVitalesStreamProvider(pacienteId));

    return vitalesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
      data: (vitales) {
        if (vitales.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.monitor_heart_outlined,
                  size: 64,
                  color: InefColors.primaryLight,
                ),
                const SizedBox(height: 16),
                Text(l10n.noVitals,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
          itemCount: vitales.length,
          itemBuilder: (context, i) => _VitalesCard(sv: vitales[i]),
        );
      },
    );
  }
}

class _VitalesCard extends StatelessWidget {
  final SignosVitale sv;
  const _VitalesCard({required this.sv});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fmtDt(sv.timestamp),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: InefColors.primaryMedium,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                if (sv.frecuenciaCardiaca != null)
                  _Chip(
                    'FC',
                    '${sv.frecuenciaCardiaca!.toStringAsFixed(0)} lpm',
                  ),
                if (sv.presionSistolica != null && sv.presionDiastolica != null)
                  _Chip(
                    'PA',
                    '${sv.presionSistolica!.toStringAsFixed(0)}'
                        '/${sv.presionDiastolica!.toStringAsFixed(0)} mmHg',
                  ),
                if (sv.presionMedia != null)
                  _Chip('PAM', '${sv.presionMedia!.toStringAsFixed(0)} mmHg'),
                if (sv.frecuenciaRespiratoria != null)
                  _Chip(
                    'FR',
                    '${sv.frecuenciaRespiratoria!.toStringAsFixed(0)} rpm',
                  ),
                if (sv.temperatura != null)
                  _Chip(
                    'T°',
                    '${sv.temperatura!.toStringAsFixed(1)} °C',
                    alert: sv.temperatura! > 38.5 || sv.temperatura! < 35.0,
                  ),
                if (sv.saturacionO2 != null)
                  _Chip(
                    'SpO₂',
                    '${sv.saturacionO2!.toStringAsFixed(0)}%',
                    alert: sv.saturacionO2! < 90,
                  ),
                if (sv.diuresis != null)
                  _Chip(
                    'Diuresis',
                    '${sv.diuresis!.toStringAsFixed(0)} mL/h',
                  ),
              ],
            ),
            if (sv.notas != null && sv.notas!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                sv.notas!,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _fmtDt(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}

// ─── Tab: Hemodiálisis ───────────────────────────────────────────────────────

class _HdTab extends ConsumerWidget {
  final int pacienteId;
  final AppLocalizations l10n;
  const _HdTab({required this.pacienteId, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(sesionesHdStreamProvider(pacienteId));
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
      data: (sessions) {
        if (sessions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.water_drop_outlined,
                    size: 64, color: InefColors.primaryLight),
                const SizedBox(height: 16),
                Text(l10n.noHdSessions,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
          itemCount: sessions.length,
          itemBuilder: (context, i) => _HdCard(s: sessions[i], l10n: l10n),
        );
      },
    );
  }
}

class _HdCard extends StatelessWidget {
  final SesionesHdData s;
  final AppLocalizations l10n;
  const _HdCard({required this.s, required this.l10n});

  String _fmtDt(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final dur = s.duracionRealMin ?? s.duracionProgramadaMin;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fmtDt(s.fechaHoraInicio),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: InefColors.primaryMedium,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _Chip(l10n.fieldVascularAccess, s.tipoAcceso),
                _Chip(l10n.fieldPlannedDuration.split(' ').first, '$dur min'),
                _Chip('Qb', '${s.qb.toStringAsFixed(0)} mL/min'),
                _Chip(l10n.fieldUfPlanned,
                    '${s.ufTotalProgramadaMl.toStringAsFixed(0)} mL'),
                if (s.tasaUfMlKgH != null)
                  _Chip(
                    l10n.fieldUfRate,
                    '${s.tasaUfMlKgH!.toStringAsFixed(2)} mL/kg/h',
                    alert: s.tasaUfMlKgH! > 13.0,
                  ),
                if (s.ktvCalculado != null)
                  _Chip(
                    'Kt/V',
                    s.ktvCalculado!.toStringAsFixed(2),
                    alert: s.ktvCalculado! < 1.2,
                  ),
              ],
            ),
            if (s.eventosDurante != null && s.eventosDurante!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                s.eventosDurante!,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Tab: Ventilación ────────────────────────────────────────────────────────

class _VentTab extends ConsumerWidget {
  final int pacienteId;
  final AppLocalizations l10n;
  const _VentTab({required this.pacienteId, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(ventilacionStreamProvider(pacienteId));
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
      data: (records) {
        if (records.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.air_outlined,
                    size: 64, color: InefColors.primaryLight),
                const SizedBox(height: 16),
                Text(l10n.noVentRecords,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 88),
          itemCount: records.length,
          itemBuilder: (context, i) =>
              _VentCard(v: records[i], l10n: l10n),
        );
      },
    );
  }
}

class _VentCard extends StatelessWidget {
  final VentilacionSavinaData v;
  final AppLocalizations l10n;
  const _VentCard({required this.v, required this.l10n});

  String _fmtDt(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

  Color _ardsColor(String? ards) {
    switch (ards) {
      case 'leve': return InefColors.warning;
      case 'moderado': return Colors.orange.shade800;
      case 'grave': return InefColors.critical;
      default: return InefColors.success;
    }
  }

  String _ardsLabel(String? ards, AppLocalizations l10n) {
    switch (ards) {
      case 'leve': return l10n.ardsMild;
      case 'moderado': return l10n.ardsModerate;
      case 'grave': return l10n.ardsSevere;
      default: return l10n.ardsNone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fmtDt(v.timestamp),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: InefColors.primaryMedium,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              v.modo,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: InefColors.primaryDark,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                if (v.fio2 != null)
                  _Chip('FiO₂',
                      '${(v.fio2! * 100).toStringAsFixed(0)}%'),
                if (v.peep != null)
                  _Chip('PEEP', '${v.peep!.toStringAsFixed(0)} cmH₂O'),
                if (v.volumenTidal != null)
                  _Chip('VT', '${v.volumenTidal!.toStringAsFixed(0)} mL'),
                if (v.pControl != null)
                  _Chip('PC', '${v.pControl!.toStringAsFixed(0)} cmH₂O'),
                if (v.pPico != null)
                  _Chip('Ppico',
                      '${v.pPico!.toStringAsFixed(0)} cmH₂O',
                      alert: v.pPico! > 35),
                if (v.drivingPressure != null)
                  _Chip('DP',
                      '${v.drivingPressure!.toStringAsFixed(0)} cmH₂O',
                      alert: v.drivingPressure! > 15),
                if (v.pfRatio != null)
                  _Chip('P/F', v.pfRatio!.toStringAsFixed(0),
                      alert: v.pfRatio! < 300),
                if (v.ardsBerlin != null && v.ardsBerlin != 'no')
                  _Chip(
                    'ARDS',
                    _ardsLabel(v.ardsBerlin, l10n),
                    color: _ardsColor(v.ardsBerlin),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final String value;
  final bool alert;
  final Color? color;
  const _Chip(this.label, this.value, {this.alert = false, this.color});

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? (alert ? InefColors.critical : InefColors.primaryDark);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: color,
                fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
