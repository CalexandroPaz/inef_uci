import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/data/database/app_database.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class PacientesListScreen extends ConsumerWidget {
  const PacientesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final query = ref.watch(searchQueryProvider);
    final pacientesAsync = ref.watch(pacientesStreamProvider(query));
    final lockService = ref.read(appLockServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.patientsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline),
            tooltip: l10n.lockApp,
            onPressed: () => lockService.lockManually(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: InefColors.primaryDark),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.local_hospital,
                      color: Colors.white, size: 40),
                  const SizedBox(height: 8),
                  const Text('INEF UCI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text(l10n.institutionName,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 11),
                      maxLines: 2),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: Text(l10n.patientsTitle),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text(l10n.auditLogTitle),
              onTap: () {
                Navigator.pop(context);
                context.push('/auditoria');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: Text(l10n.settingsTitle),
              onTap: () {
                Navigator.pop(context);
                context.push('/configuracion');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: SearchBar(
              hintText: l10n.searchPatients,
              leading: const Icon(Icons.search),
              trailing: [
                if (query.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(searchQueryProvider.notifier).state = '',
                  ),
              ],
              onChanged: (v) =>
                  ref.read(searchQueryProvider.notifier).state = v,
            ),
          ),
          Expanded(
            child: pacientesAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Text('${l10n.error}: $e',
                    style: const TextStyle(color: InefColors.critical)),
              ),
              data: (pacientes) {
                if (pacientes.isEmpty) {
                  return _EmptyState(
                      query: query, l10n: l10n);
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  itemCount: pacientes.length,
                  itemBuilder: (context, i) =>
                      _PacienteCard(paciente: pacientes[i]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/pacientes/nuevo'),
        icon: const Icon(Icons.add),
        label: Text(l10n.newPatient),
        backgroundColor: InefColors.primaryDark,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.query, required this.l10n});
  final String query;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            query.isNotEmpty ? Icons.search_off : Icons.people_outline,
            size: 64,
            color: InefColors.primaryLight,
          ),
          const SizedBox(height: 16),
          Text(
            query.isNotEmpty
                ? l10n.noSearchResults(query)
                : l10n.noPatients,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _PacienteCard extends StatelessWidget {
  const _PacienteCard({required this.paciente});
  final Paciente paciente;

  Color _estadoColor(String estado) {
    switch (estado) {
      case 'egresado':
        return InefColors.warning;
      case 'fallecido':
        return InefColors.critical;
      default:
        return InefColors.success;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final estadoColor = _estadoColor(paciente.estado);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.go('/pacientes/${paciente.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor:
                    InefColors.primaryDark.withValues(alpha: 0.12),
                child: Text(
                  paciente.nombreCompleto.isNotEmpty
                      ? paciente.nombreCompleto[0].toUpperCase()
                      : '?',
                  style: const TextStyle(
                      color: InefColors.primaryDark,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paciente.nombreCompleto,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'HC: ${paciente.numeroHc}',
                      style: const TextStyle(
                          color: InefColors.primaryMedium, fontSize: 13),
                    ),
                    if (paciente.servicioActual != null)
                      Text(
                        paciente.servicioActual!,
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: 12),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: estadoColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: estadoColor.withValues(alpha: 0.4)),
                    ),
                    child: Text(
                      _estadoLabel(paciente.estado, l10n),
                      style: TextStyle(
                          color: estadoColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 4),
                  IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.calculate_outlined,
                        color: InefColors.primaryMedium),
                    tooltip: 'Kt/V',
                    onPressed: () => context.go(
                      '/pacientes/${paciente.id}/ktv',
                      extra: {
                        'nombre': paciente.nombreCompleto,
                        'hc': paciente.numeroHc,
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
