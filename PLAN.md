# PLAN.md — INEF UCI
## Fuente de verdad del plan de implementación

---

## Chain of Thought (Razonamiento Requerido)

### (a) Autopoblado vía última medición por variable

El esquema relacional habilita el autopoblado de calculadoras con una única consulta eficiente:

```
laboratorios
  WHERE paciente_id = ? AND parametro_codigo = ?
  ORDER BY fecha_hora DESC
  LIMIT 1
```

La tabla `laboratorios` usa un modelo EAV híbrido: columna `parametro_codigo` (FK → `parametros_clinicos.codigo`) como clave semántica, `valor_canonico` ya convertido en inserción, `fecha_hora` indexada. Cada calculadora declara su lista de variables requeridas (`KtvDaugirdasInputs`) y el use case lanza N consultas paralelas (una por variable). El resultado incluye el `fecha_hora` para mostrarlo en el badge "Auto: Lab del DD/MM/YYYY HH:mm". Si no hay registro, el campo llega `null` y la UI lo marca como "Sin dato". El usuario puede sobreescribir manualmente (el valor original de la HC nunca se modifica — auditoría inmutable).

### (b) Consultas epidemiológicas eficientes

Los índices cubren los accesos típicos:
- `idx_labs_paciente_param_fecha` → `(paciente_id, parametro_codigo, fecha_hora DESC)` para obtener el último valor de cualquier parámetro.
- `idx_labs_param_fecha` → `(parametro_codigo, fecha_hora)` para consultas poblacionales (ej. "Kt/V promedio últimos 6 meses").
- `idx_pacientes_servicio_estado` → filtros de servicio y estado activo/egresado/fallecido.
- `idx_calculos_tipo_fecha` → `(tipo_calculo, fecha_hora)` para reportes epidemiológicos de calculadoras.
- `idx_diagnosticos_cie_episodio` → `(codigo_cie, episodio_id)` para prevalencias.

Las consultas predefinidas del módulo epidemiológico (v1.0) operan directamente sobre estos índices sin joins N:M no optimizados. Para 500 k registros en 5 años, la latencia queda por debajo de 2 s en SQLite con índices.

### (c) Cifrado DMK en KeyStore y bloqueo automático

**Flujo de primer arranque:**
1. La app genera una `DMK` (AES-256, 32 bytes aleatorios vía `Random.secure()`).
2. `flutter_secure_storage` almacena la DMK en Android KeyStore, bajo la clave `inef_dmk_v1`, con `keychainAccessibility: KeychainAccessibility.first_unlock` y protegida por la autenticación del dispositivo.
3. SQLCipher abre la BD con `PRAGMA key = '<hex(DMK)>'` — la clave no pasa por el PIN nunca.
4. El PIN (6 dígitos) solo autoriza el `flutter_secure_storage` para leer la DMK. Si biometría disponible, `local_auth` autentifica antes de leer el KeyStore.
5. Al bloqueo (5 min inactividad o manual): la referencia en memoria a la DMK se sobreescribe con ceros (`List.filled(32, 0)`) y la conexión SQLCipher se cierra. La BD sigue cifrada en disco.
6. Fuerza bruta offline: el atacante solo puede bruteforcear el KeyStore de Android, que tiene límites de intentos por hardware (StrongBox/TEE). La DMK de 256 bits hace inviable el ataque directo a la BD.

**Por qué la DMK NO se deriva del PIN:** Si la clave de la BD derivara del PIN (PBKDF2(PIN, salt)), con 10⁶ combinaciones (000000–999999) un atacante offline con copia del archivo `.db` podría probarlo todo en segundos. El modelo DMK separa la llave en el KeyStore protegido por hardware.

### (d) Modelo unificado UCI + Nefrología sin redundancia

El modelo unifica en:
- `pacientes` → un registro por paciente, independiente del servicio.
- `episodios` → cada hospitalización o ingreso HD es un episodio vinculado al paciente. Campo `tipo_episodio` enum: `'uci' | 'hd_aguda' | 'hd_ambulatoria' | 'sala_general'`.
- `historias_clinicas` → vinculada al paciente (no al episodio), acumula datos permanentes (APP, APF, alergias).
- `sesiones_hd` → vinculadas al episodio HD (FK `episodio_id`).
- `ventilacion_savina` → vinculadas al episodio UCI (FK `episodio_id`).
- `laboratorios` → vinculados al paciente + episodio, con timestamp. Un nefrólogo y un intensivista ven los mismos labs del mismo paciente sin duplicación.
- `calculos_realizados` → vinculados al paciente + episodio + tipo. Un paciente con SDRA y LRA tiene cálculos de ambos dominios en la misma tabla.

No hay tablas separadas "paciente_uci" vs "paciente_hd": el `tipo_episodio` discrimina el flujo sin duplicar estructura.

### (e) i18n sin romper cifrado/login

La internacionalización ocurre en la capa de presentación, completamente desacoplada de la capa de datos y seguridad:

- El `LocaleService` persiste la preferencia en `SharedPreferences` (no cifrado, no sensible).
- La app lee el locale ANTES de intentar abrir la BD cifrada: la pantalla de login ya está localizada.
- El `AppLockService` (bloqueo automático, PIN, biometría) opera en la capa de servicios sin depender del locale.
- El `KeyVaultService` opera puramente en binario (DMK, KeyStore): no hay strings localizados en la capa de seguridad.
- Los ARB y `gen-l10n` generan código estático; no hay evaluación en runtime que pueda interferir con el cifrado.
- El único punto de contacto: el disclaimer localizado en SplashScreen se renderiza DESPUÉS de que el widget tree tiene el `Locale` activo (via `LocalizationsDelegate`), sin tocar la capa de seguridad.

---

## Árbol de Carpetas Objetivo

```
inef_uci/
├── PLAN.md
├── pubspec.yaml
├── l10n.yaml
├── analysis_options.yaml
├── android/
│   └── app/
│       ├── build.gradle
│       └── src/main/AndroidManifest.xml
├── assets/
│   ├── branding/
│   │   ├── inef_isotipo.svg
│   │   └── inef_isotipo_mono.svg
│   └── data/
│       └── parametros_clinicos.json
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_constants.dart
│   │   ├── extensions/
│   │   │   ├── string_extensions.dart
│   │   │   └── num_extensions.dart
│   │   └── utils/
│   │       ├── validators.dart
│   │       └── number_format_helper.dart
│   ├── data/
│   │   ├── database/
│   │   │   ├── app_database.dart
│   │   │   ├── app_database.g.dart          (generado)
│   │   │   ├── migration_strategy.dart
│   │   │   └── tables/
│   │   │       ├── usuarios_locales_table.dart
│   │   │       ├── pacientes_table.dart
│   │   │       ├── historias_clinicas_table.dart
│   │   │       ├── episodios_table.dart
│   │   │       ├── diagnosticos_table.dart
│   │   │       ├── signos_vitales_table.dart
│   │   │       ├── parametros_clinicos_table.dart
│   │   │       ├── catalogo_meta_table.dart
│   │   │       ├── unidades_medida_table.dart
│   │   │       ├── laboratorios_table.dart
│   │   │       ├── imagenes_table.dart
│   │   │       ├── ekg_table.dart
│   │   │       ├── ventilacion_savina_table.dart
│   │   │       ├── sesiones_hd_table.dart
│   │   │       ├── calculos_realizados_table.dart
│   │   │       └── audit_log_table.dart
│   │   ├── repositories/
│   │   │   ├── paciente_repository.dart
│   │   │   ├── laboratorio_repository.dart
│   │   │   └── calculo_repository.dart
│   │   └── datasources/
│   │       └── local/
│   │           └── catalog_seed_datasource.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── paciente_entity.dart
│   │   │   └── laboratorio_entity.dart
│   │   └── usecases/
│   │       └── calculadoras/
│   │           └── ktv_daugirdas_usecase.dart
│   ├── presentation/
│   │   ├── router/
│   │   │   └── app_router.dart
│   │   ├── screens/
│   │   │   ├── splash/
│   │   │   │   └── splash_screen.dart
│   │   │   ├── auth/
│   │   │   │   ├── pin_entry_screen.dart
│   │   │   │   └── setup_pin_screen.dart
│   │   │   ├── pacientes/
│   │   │   │   ├── pacientes_list_screen.dart
│   │   │   │   └── paciente_detail_screen.dart
│   │   │   └── calculadoras/
│   │   │       └── ktv/
│   │   │           └── ktv_screen.dart
│   │   ├── widgets/
│   │   │   ├── auto_filled_field.dart
│   │   │   ├── origin_badge.dart
│   │   │   └── inef_logo.dart
│   │   └── providers/
│   │       └── locale_provider.dart
│   ├── services/
│   │   ├── key_vault_service.dart
│   │   ├── app_lock_service.dart
│   │   ├── audit_logger.dart
│   │   ├── pdf_export_service.dart
│   │   ├── biometric_auth_service.dart
│   │   └── locale_service.dart
│   └── theme/
│       ├── inef_colors.dart
│       └── app_theme.dart
├── lib/l10n/
│   ├── app_es.arb
│   ├── app_en.arb
│   └── app_fr.arb
└── test/
    ├── calculadoras/
    │   └── ktv_daugirdas_test.dart
    └── data/
        └── catalog_conversions_test.dart
```

---

## Lista Ordenada de Módulos con Criterio de "Hecho"

| # | Módulo | Criterio de hecho |
|---|--------|-------------------|
| 1 | Scaffold + pubspec.yaml | `flutter pub get` OK, árbol de carpetas creado |
| 2 | Núcleo de seguridad (KeyVaultService, AppLockService) | `flutter analyze` sin errores; DMK generada, envuelta en KeyStore, BD abre con SQLCipher |
| 3 | Esquema Drift (16 tablas) + MigrationStrategy + seed | `build_runner` sin errores; 16 tablas en `app_database.dart`; seed del catálogo desde JSON |
| 4 | Branding (colores, tema, SVG, splash) | Splash renderiza con isotipo + disclaimer + aviso institucional en idioma activo |
| 5 | i18n (l10n.yaml, ARBs, providers, app.dart) | `flutter gen-l10n` OK; cambio de idioma en runtime; persistencia en SharedPreferences |
| 6 | AuditLogger + PdfExportService | Logs inmutables en `audit_log`; PDF con header INEF + disclaimer al pie |
| 7 | Módulo Kt/V Daugirdas II completo | Motor puro; autopoblado desde labs; UI con AutoFilledField + badges; guardado + export PDF; test unitario en verde |
| 8 | Tests mínimos | `flutter test` verde: motor Kt/V (casos conocidos) + conversiones canónicas |
| 9 | Verificación final | `flutter analyze` 0 errores; `flutter build apk` reportado |

---

## Matriz de 16 Tablas y Relaciones

### Tablas

| # | Tabla | Descripción | PKs / FKs clave |
|---|-------|-------------|-----------------|
| 1 | `usuarios_locales` | Usuario local único (v1.0 single-user) | `id` PK |
| 2 | `pacientes` | Datos demográficos del paciente | `id` PK; `numero_hc` UNIQUE; `cedula` UNIQUE nullable |
| 3 | `historias_clinicas` | Datos permanentes de la HC (APP, APF, alergias) | `id` PK; `paciente_id` FK→pacientes UNIQUE |
| 4 | `episodios` | Admisiones o episodios (UCI, HD aguda, HD ambulatoria) | `id` PK; `paciente_id` FK→pacientes; `tipo_episodio` enum |
| 5 | `diagnosticos` | Diagnósticos por episodio (ICD-10) | `id` PK; `episodio_id` FK→episodios |
| 6 | `signos_vitales` | Mediciones de signos vitales con timestamp | `id` PK; `episodio_id` FK→episodios; `paciente_id` FK→pacientes |
| 7 | `parametros_clinicos` | Catálogo de parámetros (creatinina, BUN, Na, etc.) | `codigo` PK (texto); `categoria`, `unidad_canonica` |
| 8 | `catalogo_meta` | Versión del catálogo para re-seed | `id` PK; `version` INT; `seeded_at` |
| 9 | `unidades_medida` | Conversiones por parámetro (EAV del catálogo) | `id` PK; `parametro_codigo` FK→parametros_clinicos; `unidad`, `factor`, `offset` |
| 10 | `laboratorios` | Resultados de laboratorio EAV híbrido | `id` PK; `paciente_id` FK→pacientes; `episodio_id` FK→episodios nullable; `parametro_codigo` FK→parametros_clinicos; `valor_original`, `unidad_original`, `valor_canonico`, `fecha_hora`, `fuente`, `invalidado` |
| 11 | `imagenes` | Adjuntos de imagen (Rx, TAC, USG) | `id` PK; `episodio_id` FK→episodios; `tipo`, `bytes` BLOB, `descripcion`, `fecha_hora` |
| 12 | `ekg` | Hallazgos EKG | `id` PK; `episodio_id` FK→episodios; `hallazgos` texto estructurado, `adjunto` BLOB nullable |
| 13 | `ventilacion_savina` | Parámetros ventilador SAVINA por sesión | `id` PK; `episodio_id` FK→episodios; modo, parámetros programados/medidos/derivados, `timestamp` |
| 14 | `sesiones_hd` | Sesiones de hemodiálisis | `id` PK; `episodio_id` FK→episodios; acceso, tiempos, Qb, Qd, dializador, baño, anticoagulación, pesos, UF, eventos |
| 15 | `calculos_realizados` | Resultados de calculadoras guardados | `id` PK; `paciente_id` FK→pacientes; `episodio_id` FK→episodios nullable; `tipo_calculo`, `inputs_json`, `resultado_json`, `fecha_hora` |
| 16 | `audit_log` | Log de auditoría inmutable | `id` PK; `accion`, `entidad`, `entidad_id`, `paciente_id` nullable, `usuario_id` FK→usuarios_locales, `timestamp`, `detalle_json`; NO DELETE |

### Diagrama de Relaciones

```
usuarios_locales (1)
     └─audit_log (N)  [usuario_id]

pacientes (1)
     ├─historias_clinicas (1:1)   [paciente_id UNIQUE]
     ├─episodios (N)              [paciente_id]
     │    ├─diagnosticos (N)      [episodio_id]
     │    ├─signos_vitales (N)    [episodio_id]
     │    ├─laboratorios (N)      [episodio_id]  (también directo a paciente)
     │    ├─imagenes (N)          [episodio_id]
     │    ├─ekg (N)               [episodio_id]
     │    ├─ventilacion_savina (N)[episodio_id]  (tipo_episodio='uci')
     │    └─sesiones_hd (N)       [episodio_id]  (tipo_episodio='hd_*')
     ├─laboratorios (N)           [paciente_id]
     └─calculos_realizados (N)    [paciente_id]

parametros_clinicos (1)
     ├─unidades_medida (N)        [parametro_codigo]
     └─laboratorios (N)           [parametro_codigo]

catalogo_meta (1) — standalone, versión del seed
```

---

## Índices Críticos

```sql
-- Búsqueda pacientes <200ms
CREATE INDEX idx_pac_nombre ON pacientes(nombre_normalizado);
CREATE INDEX idx_pac_hc ON pacientes(numero_hc);
CREATE INDEX idx_pac_cedula ON pacientes(cedula);
CREATE INDEX idx_pac_servicio_estado ON pacientes(servicio_actual, estado);

-- Laboratorios (autopoblado calculadoras <150ms)
CREATE INDEX idx_lab_pac_param_fecha ON laboratorios(paciente_id, parametro_codigo, fecha_hora DESC);
CREATE INDEX idx_lab_param_fecha ON laboratorios(parametro_codigo, fecha_hora DESC);

-- Epidemiología
CREATE INDEX idx_calc_tipo_fecha ON calculos_realizados(tipo_calculo, fecha_hora DESC);
CREATE INDEX idx_diag_cie ON diagnosticos(codigo_cie, episodio_id);

-- Auditoría
CREATE INDEX idx_audit_timestamp ON audit_log(timestamp DESC);
CREATE INDEX idx_audit_paciente ON audit_log(paciente_id, timestamp DESC);
```

---

## Estado del Plan

- [x] PLAN.md creado
- [ ] Scaffold + pubspec.yaml
- [ ] Núcleo de seguridad
- [ ] Esquema Drift (16 tablas)
- [ ] Branding
- [ ] i18n
- [ ] AuditLogger + PdfExportService
- [ ] Módulo Kt/V Daugirdas II
- [ ] Tests
- [ ] Verificación final
