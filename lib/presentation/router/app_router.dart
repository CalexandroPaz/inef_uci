import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inef_uci/presentation/providers/app_providers.dart';
import 'package:inef_uci/presentation/screens/auditoria/audit_log_screen.dart';
import 'package:inef_uci/presentation/screens/auth/pin_entry_screen.dart';
import 'package:inef_uci/presentation/screens/auth/setup_pin_screen.dart';
import 'package:inef_uci/presentation/screens/calculadoras/ktv/ktv_screen.dart';
import 'package:inef_uci/presentation/screens/configuracion/settings_screen.dart';
import 'package:inef_uci/presentation/screens/hd/hd_session_form_screen.dart';
import 'package:inef_uci/presentation/screens/historia/historia_clinica_form_screen.dart';
import 'package:inef_uci/presentation/screens/laboratorios/lab_form_screen.dart';
import 'package:inef_uci/presentation/screens/pacientes/paciente_detail_screen.dart';
import 'package:inef_uci/presentation/screens/pacientes/paciente_form_screen.dart';
import 'package:inef_uci/presentation/screens/pacientes/pacientes_list_screen.dart';
import 'package:inef_uci/presentation/screens/signos_vitales/vitals_form_screen.dart';
import 'package:inef_uci/presentation/screens/ventilacion/ventilation_form_screen.dart';
import 'package:inef_uci/presentation/screens/splash/splash_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final lockService = ref.read(appLockServiceProvider);

  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: lockService,
    redirect: (context, state) {
      final path = state.uri.path;
      const publicPaths = ['/', '/auth', '/setup-pin'];
      if (lockService.isLocked && !publicPaths.contains(path)) {
        return '/auth';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/setup-pin',
        builder: (context, state) => const SetupPinScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const PinEntryScreen(),
      ),
      GoRoute(
        path: '/pacientes',
        builder: (context, state) => const PacientesListScreen(),
        routes: [
          GoRoute(
            path: 'nuevo',
            builder: (context, state) => const PacienteFormScreen(),
          ),
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return PacienteDetailScreen(pacienteId: id);
            },
            routes: [
              GoRoute(
                path: 'editar',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return PacienteFormScreen(pacienteId: id);
                },
              ),
              GoRoute(
                path: 'ktv',
                builder: (context, state) {
                  final db = ref.read(appDatabaseProvider);
                  if (db == null) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final id = int.parse(state.pathParameters['id']!);
                  final extra = state.extra as Map<String, dynamic>?;
                  return KtvScreen(
                    db: db,
                    pacienteId: id,
                    nombrePaciente: extra?['nombre'] as String? ?? '—',
                    numeroHc: extra?['hc'] as String? ?? '—',
                  );
                },
              ),
              GoRoute(
                path: 'labs/nuevo',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return LabFormScreen(pacienteId: id);
                },
              ),
              GoRoute(
                path: 'vitales/nuevo',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return VitalsFormScreen(pacienteId: id);
                },
              ),
              GoRoute(
                path: 'hd/nuevo',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return HdSessionFormScreen(pacienteId: id);
                },
              ),
              GoRoute(
                path: 'ventilacion/nuevo',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return VentilationFormScreen(pacienteId: id);
                },
              ),
              GoRoute(
                path: 'historia',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return HistoriaClinicaFormScreen(pacienteId: id);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/configuracion',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/auditoria',
        builder: (context, state) => const AuditLogScreen(),
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
});
