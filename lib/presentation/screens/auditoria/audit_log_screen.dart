import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inef_uci/l10n/app_localizations.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/theme/inef_colors.dart';

class AuditLogScreen extends ConsumerWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final async = ref.watch(auditLogStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.auditLogTitle)),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.history, size: 64,
                      color: InefColors.primaryLight),
                  const SizedBox(height: 16),
                  Text(l10n.noAuditRecords),
                ],
              ),
            );
          }
          return ListView.separated(
            itemCount: entries.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, indent: 16, endIndent: 16),
            itemBuilder: (context, i) {
              final e = entries[i];
              final dt = e.timestamp;
              final fmtDt =
                  '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year} '
                  '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

              return ListTile(
                dense: true,
                leading: _ActionIcon(e.accion),
                title: Text(
                  _actionLabel(e.accion, l10n),
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                subtitle: Text(
                  [
                    if (e.entidad != null) e.entidad!,
                    if (e.pacienteId != null) 'Pac. #${e.pacienteId}',
                    fmtDt,
                  ].join(' · '),
                  style: const TextStyle(fontSize: 11),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _actionLabel(String accion, AppLocalizations l10n) {
    switch (accion) {
      case 'create': return l10n.auditAction_create;
      case 'update': return l10n.auditAction_update;
      case 'invalidate': return l10n.auditAction_invalidate;
      case 'read': return l10n.auditAction_read;
      case 'export': return l10n.auditAction_export;
      case 'login': return l10n.auditAction_login;
      case 'logout': return l10n.auditAction_logout;
      case 'calc': return l10n.auditAction_calc;
      case 'pdf': return l10n.auditAction_pdf;
      default: return accion;
    }
  }
}

class _ActionIcon extends StatelessWidget {
  final String accion;
  const _ActionIcon(this.accion);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    switch (accion) {
      case 'create':
        icon = Icons.add_circle_outline;
        color = InefColors.success;
      case 'update':
        icon = Icons.edit_outlined;
        color = InefColors.primaryMedium;
      case 'invalidate':
        icon = Icons.remove_circle_outline;
        color = InefColors.critical;
      case 'login':
        icon = Icons.login;
        color = InefColors.primaryDark;
      case 'logout':
        icon = Icons.logout;
        color = Colors.grey;
      case 'calc':
        icon = Icons.calculate_outlined;
        color = InefColors.warning;
      case 'pdf':
        icon = Icons.picture_as_pdf_outlined;
        color = Colors.deepOrange;
      default:
        icon = Icons.history;
        color = InefColors.primaryLight;
    }
    return CircleAvatar(
      radius: 16,
      backgroundColor: color.withValues(alpha: 0.12),
      child: Icon(icon, size: 16, color: color),
    );
  }
}
