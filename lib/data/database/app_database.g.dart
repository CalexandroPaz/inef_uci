// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsuariosLocalesTable extends UsuariosLocales
    with TableInfo<$UsuariosLocalesTable, UsuariosLocale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosLocalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _especialidadMeta = const VerificationMeta(
    'especialidad',
  );
  @override
  late final GeneratedColumn<String> especialidad = GeneratedColumn<String>(
    'especialidad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creadoEnMeta = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _ultimoAccesoMeta = const VerificationMeta(
    'ultimoAcceso',
  );
  @override
  late final GeneratedColumn<DateTime> ultimoAcceso = GeneratedColumn<DateTime>(
    'ultimo_acceso',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _autoLockSegundosMeta = const VerificationMeta(
    'autoLockSegundos',
  );
  @override
  late final GeneratedColumn<int> autoLockSegundos = GeneratedColumn<int>(
    'auto_lock_segundos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(300),
  );
  static const VerificationMeta _biometriaHabilitadaMeta =
      const VerificationMeta('biometriaHabilitada');
  @override
  late final GeneratedColumn<bool> biometriaHabilitada = GeneratedColumn<bool>(
    'biometria_habilitada',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("biometria_habilitada" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    especialidad,
    creadoEn,
    ultimoAcceso,
    autoLockSegundos,
    biometriaHabilitada,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios_locales';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsuariosLocale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('especialidad')) {
      context.handle(
        _especialidadMeta,
        especialidad.isAcceptableOrUnknown(
          data['especialidad']!,
          _especialidadMeta,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _creadoEnMeta,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta),
      );
    }
    if (data.containsKey('ultimo_acceso')) {
      context.handle(
        _ultimoAccesoMeta,
        ultimoAcceso.isAcceptableOrUnknown(
          data['ultimo_acceso']!,
          _ultimoAccesoMeta,
        ),
      );
    }
    if (data.containsKey('auto_lock_segundos')) {
      context.handle(
        _autoLockSegundosMeta,
        autoLockSegundos.isAcceptableOrUnknown(
          data['auto_lock_segundos']!,
          _autoLockSegundosMeta,
        ),
      );
    }
    if (data.containsKey('biometria_habilitada')) {
      context.handle(
        _biometriaHabilitadaMeta,
        biometriaHabilitada.isAcceptableOrUnknown(
          data['biometria_habilitada']!,
          _biometriaHabilitadaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsuariosLocale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuariosLocale(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      especialidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}especialidad'],
      ),
      creadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
      ultimoAcceso: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ultimo_acceso'],
      ),
      autoLockSegundos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}auto_lock_segundos'],
      )!,
      biometriaHabilitada: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}biometria_habilitada'],
      )!,
    );
  }

  @override
  $UsuariosLocalesTable createAlias(String alias) {
    return $UsuariosLocalesTable(attachedDatabase, alias);
  }
}

class UsuariosLocale extends DataClass implements Insertable<UsuariosLocale> {
  final int id;
  final String nombre;
  final String? especialidad;
  final DateTime creadoEn;
  final DateTime? ultimoAcceso;
  final int autoLockSegundos;
  final bool biometriaHabilitada;
  const UsuariosLocale({
    required this.id,
    required this.nombre,
    this.especialidad,
    required this.creadoEn,
    this.ultimoAcceso,
    required this.autoLockSegundos,
    required this.biometriaHabilitada,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    if (!nullToAbsent || especialidad != null) {
      map['especialidad'] = Variable<String>(especialidad);
    }
    map['creado_en'] = Variable<DateTime>(creadoEn);
    if (!nullToAbsent || ultimoAcceso != null) {
      map['ultimo_acceso'] = Variable<DateTime>(ultimoAcceso);
    }
    map['auto_lock_segundos'] = Variable<int>(autoLockSegundos);
    map['biometria_habilitada'] = Variable<bool>(biometriaHabilitada);
    return map;
  }

  UsuariosLocalesCompanion toCompanion(bool nullToAbsent) {
    return UsuariosLocalesCompanion(
      id: Value(id),
      nombre: Value(nombre),
      especialidad: especialidad == null && nullToAbsent
          ? const Value.absent()
          : Value(especialidad),
      creadoEn: Value(creadoEn),
      ultimoAcceso: ultimoAcceso == null && nullToAbsent
          ? const Value.absent()
          : Value(ultimoAcceso),
      autoLockSegundos: Value(autoLockSegundos),
      biometriaHabilitada: Value(biometriaHabilitada),
    );
  }

  factory UsuariosLocale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuariosLocale(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      especialidad: serializer.fromJson<String?>(json['especialidad']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
      ultimoAcceso: serializer.fromJson<DateTime?>(json['ultimoAcceso']),
      autoLockSegundos: serializer.fromJson<int>(json['autoLockSegundos']),
      biometriaHabilitada: serializer.fromJson<bool>(
        json['biometriaHabilitada'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'especialidad': serializer.toJson<String?>(especialidad),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
      'ultimoAcceso': serializer.toJson<DateTime?>(ultimoAcceso),
      'autoLockSegundos': serializer.toJson<int>(autoLockSegundos),
      'biometriaHabilitada': serializer.toJson<bool>(biometriaHabilitada),
    };
  }

  UsuariosLocale copyWith({
    int? id,
    String? nombre,
    Value<String?> especialidad = const Value.absent(),
    DateTime? creadoEn,
    Value<DateTime?> ultimoAcceso = const Value.absent(),
    int? autoLockSegundos,
    bool? biometriaHabilitada,
  }) => UsuariosLocale(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    especialidad: especialidad.present ? especialidad.value : this.especialidad,
    creadoEn: creadoEn ?? this.creadoEn,
    ultimoAcceso: ultimoAcceso.present ? ultimoAcceso.value : this.ultimoAcceso,
    autoLockSegundos: autoLockSegundos ?? this.autoLockSegundos,
    biometriaHabilitada: biometriaHabilitada ?? this.biometriaHabilitada,
  );
  UsuariosLocale copyWithCompanion(UsuariosLocalesCompanion data) {
    return UsuariosLocale(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      especialidad: data.especialidad.present
          ? data.especialidad.value
          : this.especialidad,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
      ultimoAcceso: data.ultimoAcceso.present
          ? data.ultimoAcceso.value
          : this.ultimoAcceso,
      autoLockSegundos: data.autoLockSegundos.present
          ? data.autoLockSegundos.value
          : this.autoLockSegundos,
      biometriaHabilitada: data.biometriaHabilitada.present
          ? data.biometriaHabilitada.value
          : this.biometriaHabilitada,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosLocale(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('especialidad: $especialidad, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('ultimoAcceso: $ultimoAcceso, ')
          ..write('autoLockSegundos: $autoLockSegundos, ')
          ..write('biometriaHabilitada: $biometriaHabilitada')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nombre,
    especialidad,
    creadoEn,
    ultimoAcceso,
    autoLockSegundos,
    biometriaHabilitada,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuariosLocale &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.especialidad == this.especialidad &&
          other.creadoEn == this.creadoEn &&
          other.ultimoAcceso == this.ultimoAcceso &&
          other.autoLockSegundos == this.autoLockSegundos &&
          other.biometriaHabilitada == this.biometriaHabilitada);
}

class UsuariosLocalesCompanion extends UpdateCompanion<UsuariosLocale> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String?> especialidad;
  final Value<DateTime> creadoEn;
  final Value<DateTime?> ultimoAcceso;
  final Value<int> autoLockSegundos;
  final Value<bool> biometriaHabilitada;
  const UsuariosLocalesCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.especialidad = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.ultimoAcceso = const Value.absent(),
    this.autoLockSegundos = const Value.absent(),
    this.biometriaHabilitada = const Value.absent(),
  });
  UsuariosLocalesCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    this.especialidad = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.ultimoAcceso = const Value.absent(),
    this.autoLockSegundos = const Value.absent(),
    this.biometriaHabilitada = const Value.absent(),
  }) : nombre = Value(nombre);
  static Insertable<UsuariosLocale> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? especialidad,
    Expression<DateTime>? creadoEn,
    Expression<DateTime>? ultimoAcceso,
    Expression<int>? autoLockSegundos,
    Expression<bool>? biometriaHabilitada,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (especialidad != null) 'especialidad': especialidad,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (ultimoAcceso != null) 'ultimo_acceso': ultimoAcceso,
      if (autoLockSegundos != null) 'auto_lock_segundos': autoLockSegundos,
      if (biometriaHabilitada != null)
        'biometria_habilitada': biometriaHabilitada,
    });
  }

  UsuariosLocalesCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String?>? especialidad,
    Value<DateTime>? creadoEn,
    Value<DateTime?>? ultimoAcceso,
    Value<int>? autoLockSegundos,
    Value<bool>? biometriaHabilitada,
  }) {
    return UsuariosLocalesCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      especialidad: especialidad ?? this.especialidad,
      creadoEn: creadoEn ?? this.creadoEn,
      ultimoAcceso: ultimoAcceso ?? this.ultimoAcceso,
      autoLockSegundos: autoLockSegundos ?? this.autoLockSegundos,
      biometriaHabilitada: biometriaHabilitada ?? this.biometriaHabilitada,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (especialidad.present) {
      map['especialidad'] = Variable<String>(especialidad.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    if (ultimoAcceso.present) {
      map['ultimo_acceso'] = Variable<DateTime>(ultimoAcceso.value);
    }
    if (autoLockSegundos.present) {
      map['auto_lock_segundos'] = Variable<int>(autoLockSegundos.value);
    }
    if (biometriaHabilitada.present) {
      map['biometria_habilitada'] = Variable<bool>(biometriaHabilitada.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosLocalesCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('especialidad: $especialidad, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('ultimoAcceso: $ultimoAcceso, ')
          ..write('autoLockSegundos: $autoLockSegundos, ')
          ..write('biometriaHabilitada: $biometriaHabilitada')
          ..write(')'))
        .toString();
  }
}

class $PacientesTable extends Pacientes
    with TableInfo<$PacientesTable, Paciente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PacientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _numeroHcMeta = const VerificationMeta(
    'numeroHc',
  );
  @override
  late final GeneratedColumn<String> numeroHc = GeneratedColumn<String>(
    'numero_hc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nombreCompletoMeta = const VerificationMeta(
    'nombreCompleto',
  );
  @override
  late final GeneratedColumn<String> nombreCompleto = GeneratedColumn<String>(
    'nombre_completo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreNormalizadoMeta = const VerificationMeta(
    'nombreNormalizado',
  );
  @override
  late final GeneratedColumn<String> nombreNormalizado =
      GeneratedColumn<String>(
        'nombre_normalizado',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 200,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _cedulaMeta = const VerificationMeta('cedula');
  @override
  late final GeneratedColumn<String> cedula = GeneratedColumn<String>(
    'cedula',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaNacimientoMeta = const VerificationMeta(
    'fechaNacimiento',
  );
  @override
  late final GeneratedColumn<DateTime> fechaNacimiento =
      GeneratedColumn<DateTime>(
        'fecha_nacimiento',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _sexoMeta = const VerificationMeta('sexo');
  @override
  late final GeneratedColumn<String> sexo = GeneratedColumn<String>(
    'sexo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 1,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _grupoSanguineoMeta = const VerificationMeta(
    'grupoSanguineo',
  );
  @override
  late final GeneratedColumn<String> grupoSanguineo = GeneratedColumn<String>(
    'grupo_sanguineo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _factorRhMeta = const VerificationMeta(
    'factorRh',
  );
  @override
  late final GeneratedColumn<String> factorRh = GeneratedColumn<String>(
    'factor_rh',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pesoSecoMeta = const VerificationMeta(
    'pesoSeco',
  );
  @override
  late final GeneratedColumn<double> pesoSeco = GeneratedColumn<double>(
    'peso_seco',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pesoActualMeta = const VerificationMeta(
    'pesoActual',
  );
  @override
  late final GeneratedColumn<double> pesoActual = GeneratedColumn<double>(
    'peso_actual',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tallaMeta = const VerificationMeta('talla');
  @override
  late final GeneratedColumn<double> talla = GeneratedColumn<double>(
    'talla',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servicioActualMeta = const VerificationMeta(
    'servicioActual',
  );
  @override
  late final GeneratedColumn<String> servicioActual = GeneratedColumn<String>(
    'servicio_actual',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('activo'),
  );
  static const VerificationMeta _fechaIngresoMeta = const VerificationMeta(
    'fechaIngreso',
  );
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
    'fecha_ingreso',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaEgresoMeta = const VerificationMeta(
    'fechaEgreso',
  );
  @override
  late final GeneratedColumn<DateTime> fechaEgreso = GeneratedColumn<DateTime>(
    'fecha_egreso',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motivoIngresoMeta = const VerificationMeta(
    'motivoIngreso',
  );
  @override
  late final GeneratedColumn<String> motivoIngreso = GeneratedColumn<String>(
    'motivo_ingreso',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creadoEnMeta = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _actualizadoEnMeta = const VerificationMeta(
    'actualizadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> actualizadoEn =
      GeneratedColumn<DateTime>(
        'actualizado_en',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    numeroHc,
    nombreCompleto,
    nombreNormalizado,
    cedula,
    fechaNacimiento,
    sexo,
    grupoSanguineo,
    factorRh,
    pesoSeco,
    pesoActual,
    talla,
    servicioActual,
    estado,
    fechaIngreso,
    fechaEgreso,
    motivoIngreso,
    creadoEn,
    actualizadoEn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pacientes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Paciente> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero_hc')) {
      context.handle(
        _numeroHcMeta,
        numeroHc.isAcceptableOrUnknown(data['numero_hc']!, _numeroHcMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroHcMeta);
    }
    if (data.containsKey('nombre_completo')) {
      context.handle(
        _nombreCompletoMeta,
        nombreCompleto.isAcceptableOrUnknown(
          data['nombre_completo']!,
          _nombreCompletoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nombreCompletoMeta);
    }
    if (data.containsKey('nombre_normalizado')) {
      context.handle(
        _nombreNormalizadoMeta,
        nombreNormalizado.isAcceptableOrUnknown(
          data['nombre_normalizado']!,
          _nombreNormalizadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nombreNormalizadoMeta);
    }
    if (data.containsKey('cedula')) {
      context.handle(
        _cedulaMeta,
        cedula.isAcceptableOrUnknown(data['cedula']!, _cedulaMeta),
      );
    }
    if (data.containsKey('fecha_nacimiento')) {
      context.handle(
        _fechaNacimientoMeta,
        fechaNacimiento.isAcceptableOrUnknown(
          data['fecha_nacimiento']!,
          _fechaNacimientoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaNacimientoMeta);
    }
    if (data.containsKey('sexo')) {
      context.handle(
        _sexoMeta,
        sexo.isAcceptableOrUnknown(data['sexo']!, _sexoMeta),
      );
    } else if (isInserting) {
      context.missing(_sexoMeta);
    }
    if (data.containsKey('grupo_sanguineo')) {
      context.handle(
        _grupoSanguineoMeta,
        grupoSanguineo.isAcceptableOrUnknown(
          data['grupo_sanguineo']!,
          _grupoSanguineoMeta,
        ),
      );
    }
    if (data.containsKey('factor_rh')) {
      context.handle(
        _factorRhMeta,
        factorRh.isAcceptableOrUnknown(data['factor_rh']!, _factorRhMeta),
      );
    }
    if (data.containsKey('peso_seco')) {
      context.handle(
        _pesoSecoMeta,
        pesoSeco.isAcceptableOrUnknown(data['peso_seco']!, _pesoSecoMeta),
      );
    }
    if (data.containsKey('peso_actual')) {
      context.handle(
        _pesoActualMeta,
        pesoActual.isAcceptableOrUnknown(data['peso_actual']!, _pesoActualMeta),
      );
    }
    if (data.containsKey('talla')) {
      context.handle(
        _tallaMeta,
        talla.isAcceptableOrUnknown(data['talla']!, _tallaMeta),
      );
    }
    if (data.containsKey('servicio_actual')) {
      context.handle(
        _servicioActualMeta,
        servicioActual.isAcceptableOrUnknown(
          data['servicio_actual']!,
          _servicioActualMeta,
        ),
      );
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
        _fechaIngresoMeta,
        fechaIngreso.isAcceptableOrUnknown(
          data['fecha_ingreso']!,
          _fechaIngresoMeta,
        ),
      );
    }
    if (data.containsKey('fecha_egreso')) {
      context.handle(
        _fechaEgresoMeta,
        fechaEgreso.isAcceptableOrUnknown(
          data['fecha_egreso']!,
          _fechaEgresoMeta,
        ),
      );
    }
    if (data.containsKey('motivo_ingreso')) {
      context.handle(
        _motivoIngresoMeta,
        motivoIngreso.isAcceptableOrUnknown(
          data['motivo_ingreso']!,
          _motivoIngresoMeta,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _creadoEnMeta,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta),
      );
    }
    if (data.containsKey('actualizado_en')) {
      context.handle(
        _actualizadoEnMeta,
        actualizadoEn.isAcceptableOrUnknown(
          data['actualizado_en']!,
          _actualizadoEnMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Paciente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Paciente(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      numeroHc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_hc'],
      )!,
      nombreCompleto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_completo'],
      )!,
      nombreNormalizado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_normalizado'],
      )!,
      cedula: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cedula'],
      ),
      fechaNacimiento: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_nacimiento'],
      )!,
      sexo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sexo'],
      )!,
      grupoSanguineo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grupo_sanguineo'],
      ),
      factorRh: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}factor_rh'],
      ),
      pesoSeco: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peso_seco'],
      ),
      pesoActual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peso_actual'],
      ),
      talla: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}talla'],
      ),
      servicioActual: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}servicio_actual'],
      ),
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      fechaIngreso: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_ingreso'],
      ),
      fechaEgreso: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_egreso'],
      ),
      motivoIngreso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}motivo_ingreso'],
      ),
      creadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
      actualizadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actualizado_en'],
      )!,
    );
  }

  @override
  $PacientesTable createAlias(String alias) {
    return $PacientesTable(attachedDatabase, alias);
  }
}

class Paciente extends DataClass implements Insertable<Paciente> {
  final int id;
  final String numeroHc;
  final String nombreCompleto;
  final String nombreNormalizado;
  final String? cedula;
  final DateTime fechaNacimiento;
  final String sexo;
  final String? grupoSanguineo;
  final String? factorRh;
  final double? pesoSeco;
  final double? pesoActual;
  final double? talla;
  final String? servicioActual;
  final String estado;
  final DateTime? fechaIngreso;
  final DateTime? fechaEgreso;
  final String? motivoIngreso;
  final DateTime creadoEn;
  final DateTime actualizadoEn;
  const Paciente({
    required this.id,
    required this.numeroHc,
    required this.nombreCompleto,
    required this.nombreNormalizado,
    this.cedula,
    required this.fechaNacimiento,
    required this.sexo,
    this.grupoSanguineo,
    this.factorRh,
    this.pesoSeco,
    this.pesoActual,
    this.talla,
    this.servicioActual,
    required this.estado,
    this.fechaIngreso,
    this.fechaEgreso,
    this.motivoIngreso,
    required this.creadoEn,
    required this.actualizadoEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['numero_hc'] = Variable<String>(numeroHc);
    map['nombre_completo'] = Variable<String>(nombreCompleto);
    map['nombre_normalizado'] = Variable<String>(nombreNormalizado);
    if (!nullToAbsent || cedula != null) {
      map['cedula'] = Variable<String>(cedula);
    }
    map['fecha_nacimiento'] = Variable<DateTime>(fechaNacimiento);
    map['sexo'] = Variable<String>(sexo);
    if (!nullToAbsent || grupoSanguineo != null) {
      map['grupo_sanguineo'] = Variable<String>(grupoSanguineo);
    }
    if (!nullToAbsent || factorRh != null) {
      map['factor_rh'] = Variable<String>(factorRh);
    }
    if (!nullToAbsent || pesoSeco != null) {
      map['peso_seco'] = Variable<double>(pesoSeco);
    }
    if (!nullToAbsent || pesoActual != null) {
      map['peso_actual'] = Variable<double>(pesoActual);
    }
    if (!nullToAbsent || talla != null) {
      map['talla'] = Variable<double>(talla);
    }
    if (!nullToAbsent || servicioActual != null) {
      map['servicio_actual'] = Variable<String>(servicioActual);
    }
    map['estado'] = Variable<String>(estado);
    if (!nullToAbsent || fechaIngreso != null) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    }
    if (!nullToAbsent || fechaEgreso != null) {
      map['fecha_egreso'] = Variable<DateTime>(fechaEgreso);
    }
    if (!nullToAbsent || motivoIngreso != null) {
      map['motivo_ingreso'] = Variable<String>(motivoIngreso);
    }
    map['creado_en'] = Variable<DateTime>(creadoEn);
    map['actualizado_en'] = Variable<DateTime>(actualizadoEn);
    return map;
  }

  PacientesCompanion toCompanion(bool nullToAbsent) {
    return PacientesCompanion(
      id: Value(id),
      numeroHc: Value(numeroHc),
      nombreCompleto: Value(nombreCompleto),
      nombreNormalizado: Value(nombreNormalizado),
      cedula: cedula == null && nullToAbsent
          ? const Value.absent()
          : Value(cedula),
      fechaNacimiento: Value(fechaNacimiento),
      sexo: Value(sexo),
      grupoSanguineo: grupoSanguineo == null && nullToAbsent
          ? const Value.absent()
          : Value(grupoSanguineo),
      factorRh: factorRh == null && nullToAbsent
          ? const Value.absent()
          : Value(factorRh),
      pesoSeco: pesoSeco == null && nullToAbsent
          ? const Value.absent()
          : Value(pesoSeco),
      pesoActual: pesoActual == null && nullToAbsent
          ? const Value.absent()
          : Value(pesoActual),
      talla: talla == null && nullToAbsent
          ? const Value.absent()
          : Value(talla),
      servicioActual: servicioActual == null && nullToAbsent
          ? const Value.absent()
          : Value(servicioActual),
      estado: Value(estado),
      fechaIngreso: fechaIngreso == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaIngreso),
      fechaEgreso: fechaEgreso == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaEgreso),
      motivoIngreso: motivoIngreso == null && nullToAbsent
          ? const Value.absent()
          : Value(motivoIngreso),
      creadoEn: Value(creadoEn),
      actualizadoEn: Value(actualizadoEn),
    );
  }

  factory Paciente.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Paciente(
      id: serializer.fromJson<int>(json['id']),
      numeroHc: serializer.fromJson<String>(json['numeroHc']),
      nombreCompleto: serializer.fromJson<String>(json['nombreCompleto']),
      nombreNormalizado: serializer.fromJson<String>(json['nombreNormalizado']),
      cedula: serializer.fromJson<String?>(json['cedula']),
      fechaNacimiento: serializer.fromJson<DateTime>(json['fechaNacimiento']),
      sexo: serializer.fromJson<String>(json['sexo']),
      grupoSanguineo: serializer.fromJson<String?>(json['grupoSanguineo']),
      factorRh: serializer.fromJson<String?>(json['factorRh']),
      pesoSeco: serializer.fromJson<double?>(json['pesoSeco']),
      pesoActual: serializer.fromJson<double?>(json['pesoActual']),
      talla: serializer.fromJson<double?>(json['talla']),
      servicioActual: serializer.fromJson<String?>(json['servicioActual']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaIngreso: serializer.fromJson<DateTime?>(json['fechaIngreso']),
      fechaEgreso: serializer.fromJson<DateTime?>(json['fechaEgreso']),
      motivoIngreso: serializer.fromJson<String?>(json['motivoIngreso']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
      actualizadoEn: serializer.fromJson<DateTime>(json['actualizadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'numeroHc': serializer.toJson<String>(numeroHc),
      'nombreCompleto': serializer.toJson<String>(nombreCompleto),
      'nombreNormalizado': serializer.toJson<String>(nombreNormalizado),
      'cedula': serializer.toJson<String?>(cedula),
      'fechaNacimiento': serializer.toJson<DateTime>(fechaNacimiento),
      'sexo': serializer.toJson<String>(sexo),
      'grupoSanguineo': serializer.toJson<String?>(grupoSanguineo),
      'factorRh': serializer.toJson<String?>(factorRh),
      'pesoSeco': serializer.toJson<double?>(pesoSeco),
      'pesoActual': serializer.toJson<double?>(pesoActual),
      'talla': serializer.toJson<double?>(talla),
      'servicioActual': serializer.toJson<String?>(servicioActual),
      'estado': serializer.toJson<String>(estado),
      'fechaIngreso': serializer.toJson<DateTime?>(fechaIngreso),
      'fechaEgreso': serializer.toJson<DateTime?>(fechaEgreso),
      'motivoIngreso': serializer.toJson<String?>(motivoIngreso),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
      'actualizadoEn': serializer.toJson<DateTime>(actualizadoEn),
    };
  }

  Paciente copyWith({
    int? id,
    String? numeroHc,
    String? nombreCompleto,
    String? nombreNormalizado,
    Value<String?> cedula = const Value.absent(),
    DateTime? fechaNacimiento,
    String? sexo,
    Value<String?> grupoSanguineo = const Value.absent(),
    Value<String?> factorRh = const Value.absent(),
    Value<double?> pesoSeco = const Value.absent(),
    Value<double?> pesoActual = const Value.absent(),
    Value<double?> talla = const Value.absent(),
    Value<String?> servicioActual = const Value.absent(),
    String? estado,
    Value<DateTime?> fechaIngreso = const Value.absent(),
    Value<DateTime?> fechaEgreso = const Value.absent(),
    Value<String?> motivoIngreso = const Value.absent(),
    DateTime? creadoEn,
    DateTime? actualizadoEn,
  }) => Paciente(
    id: id ?? this.id,
    numeroHc: numeroHc ?? this.numeroHc,
    nombreCompleto: nombreCompleto ?? this.nombreCompleto,
    nombreNormalizado: nombreNormalizado ?? this.nombreNormalizado,
    cedula: cedula.present ? cedula.value : this.cedula,
    fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
    sexo: sexo ?? this.sexo,
    grupoSanguineo: grupoSanguineo.present
        ? grupoSanguineo.value
        : this.grupoSanguineo,
    factorRh: factorRh.present ? factorRh.value : this.factorRh,
    pesoSeco: pesoSeco.present ? pesoSeco.value : this.pesoSeco,
    pesoActual: pesoActual.present ? pesoActual.value : this.pesoActual,
    talla: talla.present ? talla.value : this.talla,
    servicioActual: servicioActual.present
        ? servicioActual.value
        : this.servicioActual,
    estado: estado ?? this.estado,
    fechaIngreso: fechaIngreso.present ? fechaIngreso.value : this.fechaIngreso,
    fechaEgreso: fechaEgreso.present ? fechaEgreso.value : this.fechaEgreso,
    motivoIngreso: motivoIngreso.present
        ? motivoIngreso.value
        : this.motivoIngreso,
    creadoEn: creadoEn ?? this.creadoEn,
    actualizadoEn: actualizadoEn ?? this.actualizadoEn,
  );
  Paciente copyWithCompanion(PacientesCompanion data) {
    return Paciente(
      id: data.id.present ? data.id.value : this.id,
      numeroHc: data.numeroHc.present ? data.numeroHc.value : this.numeroHc,
      nombreCompleto: data.nombreCompleto.present
          ? data.nombreCompleto.value
          : this.nombreCompleto,
      nombreNormalizado: data.nombreNormalizado.present
          ? data.nombreNormalizado.value
          : this.nombreNormalizado,
      cedula: data.cedula.present ? data.cedula.value : this.cedula,
      fechaNacimiento: data.fechaNacimiento.present
          ? data.fechaNacimiento.value
          : this.fechaNacimiento,
      sexo: data.sexo.present ? data.sexo.value : this.sexo,
      grupoSanguineo: data.grupoSanguineo.present
          ? data.grupoSanguineo.value
          : this.grupoSanguineo,
      factorRh: data.factorRh.present ? data.factorRh.value : this.factorRh,
      pesoSeco: data.pesoSeco.present ? data.pesoSeco.value : this.pesoSeco,
      pesoActual: data.pesoActual.present
          ? data.pesoActual.value
          : this.pesoActual,
      talla: data.talla.present ? data.talla.value : this.talla,
      servicioActual: data.servicioActual.present
          ? data.servicioActual.value
          : this.servicioActual,
      estado: data.estado.present ? data.estado.value : this.estado,
      fechaIngreso: data.fechaIngreso.present
          ? data.fechaIngreso.value
          : this.fechaIngreso,
      fechaEgreso: data.fechaEgreso.present
          ? data.fechaEgreso.value
          : this.fechaEgreso,
      motivoIngreso: data.motivoIngreso.present
          ? data.motivoIngreso.value
          : this.motivoIngreso,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
      actualizadoEn: data.actualizadoEn.present
          ? data.actualizadoEn.value
          : this.actualizadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Paciente(')
          ..write('id: $id, ')
          ..write('numeroHc: $numeroHc, ')
          ..write('nombreCompleto: $nombreCompleto, ')
          ..write('nombreNormalizado: $nombreNormalizado, ')
          ..write('cedula: $cedula, ')
          ..write('fechaNacimiento: $fechaNacimiento, ')
          ..write('sexo: $sexo, ')
          ..write('grupoSanguineo: $grupoSanguineo, ')
          ..write('factorRh: $factorRh, ')
          ..write('pesoSeco: $pesoSeco, ')
          ..write('pesoActual: $pesoActual, ')
          ..write('talla: $talla, ')
          ..write('servicioActual: $servicioActual, ')
          ..write('estado: $estado, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaEgreso: $fechaEgreso, ')
          ..write('motivoIngreso: $motivoIngreso, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('actualizadoEn: $actualizadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    numeroHc,
    nombreCompleto,
    nombreNormalizado,
    cedula,
    fechaNacimiento,
    sexo,
    grupoSanguineo,
    factorRh,
    pesoSeco,
    pesoActual,
    talla,
    servicioActual,
    estado,
    fechaIngreso,
    fechaEgreso,
    motivoIngreso,
    creadoEn,
    actualizadoEn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Paciente &&
          other.id == this.id &&
          other.numeroHc == this.numeroHc &&
          other.nombreCompleto == this.nombreCompleto &&
          other.nombreNormalizado == this.nombreNormalizado &&
          other.cedula == this.cedula &&
          other.fechaNacimiento == this.fechaNacimiento &&
          other.sexo == this.sexo &&
          other.grupoSanguineo == this.grupoSanguineo &&
          other.factorRh == this.factorRh &&
          other.pesoSeco == this.pesoSeco &&
          other.pesoActual == this.pesoActual &&
          other.talla == this.talla &&
          other.servicioActual == this.servicioActual &&
          other.estado == this.estado &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaEgreso == this.fechaEgreso &&
          other.motivoIngreso == this.motivoIngreso &&
          other.creadoEn == this.creadoEn &&
          other.actualizadoEn == this.actualizadoEn);
}

class PacientesCompanion extends UpdateCompanion<Paciente> {
  final Value<int> id;
  final Value<String> numeroHc;
  final Value<String> nombreCompleto;
  final Value<String> nombreNormalizado;
  final Value<String?> cedula;
  final Value<DateTime> fechaNacimiento;
  final Value<String> sexo;
  final Value<String?> grupoSanguineo;
  final Value<String?> factorRh;
  final Value<double?> pesoSeco;
  final Value<double?> pesoActual;
  final Value<double?> talla;
  final Value<String?> servicioActual;
  final Value<String> estado;
  final Value<DateTime?> fechaIngreso;
  final Value<DateTime?> fechaEgreso;
  final Value<String?> motivoIngreso;
  final Value<DateTime> creadoEn;
  final Value<DateTime> actualizadoEn;
  const PacientesCompanion({
    this.id = const Value.absent(),
    this.numeroHc = const Value.absent(),
    this.nombreCompleto = const Value.absent(),
    this.nombreNormalizado = const Value.absent(),
    this.cedula = const Value.absent(),
    this.fechaNacimiento = const Value.absent(),
    this.sexo = const Value.absent(),
    this.grupoSanguineo = const Value.absent(),
    this.factorRh = const Value.absent(),
    this.pesoSeco = const Value.absent(),
    this.pesoActual = const Value.absent(),
    this.talla = const Value.absent(),
    this.servicioActual = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaEgreso = const Value.absent(),
    this.motivoIngreso = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.actualizadoEn = const Value.absent(),
  });
  PacientesCompanion.insert({
    this.id = const Value.absent(),
    required String numeroHc,
    required String nombreCompleto,
    required String nombreNormalizado,
    this.cedula = const Value.absent(),
    required DateTime fechaNacimiento,
    required String sexo,
    this.grupoSanguineo = const Value.absent(),
    this.factorRh = const Value.absent(),
    this.pesoSeco = const Value.absent(),
    this.pesoActual = const Value.absent(),
    this.talla = const Value.absent(),
    this.servicioActual = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaEgreso = const Value.absent(),
    this.motivoIngreso = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.actualizadoEn = const Value.absent(),
  }) : numeroHc = Value(numeroHc),
       nombreCompleto = Value(nombreCompleto),
       nombreNormalizado = Value(nombreNormalizado),
       fechaNacimiento = Value(fechaNacimiento),
       sexo = Value(sexo);
  static Insertable<Paciente> custom({
    Expression<int>? id,
    Expression<String>? numeroHc,
    Expression<String>? nombreCompleto,
    Expression<String>? nombreNormalizado,
    Expression<String>? cedula,
    Expression<DateTime>? fechaNacimiento,
    Expression<String>? sexo,
    Expression<String>? grupoSanguineo,
    Expression<String>? factorRh,
    Expression<double>? pesoSeco,
    Expression<double>? pesoActual,
    Expression<double>? talla,
    Expression<String>? servicioActual,
    Expression<String>? estado,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaEgreso,
    Expression<String>? motivoIngreso,
    Expression<DateTime>? creadoEn,
    Expression<DateTime>? actualizadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numeroHc != null) 'numero_hc': numeroHc,
      if (nombreCompleto != null) 'nombre_completo': nombreCompleto,
      if (nombreNormalizado != null) 'nombre_normalizado': nombreNormalizado,
      if (cedula != null) 'cedula': cedula,
      if (fechaNacimiento != null) 'fecha_nacimiento': fechaNacimiento,
      if (sexo != null) 'sexo': sexo,
      if (grupoSanguineo != null) 'grupo_sanguineo': grupoSanguineo,
      if (factorRh != null) 'factor_rh': factorRh,
      if (pesoSeco != null) 'peso_seco': pesoSeco,
      if (pesoActual != null) 'peso_actual': pesoActual,
      if (talla != null) 'talla': talla,
      if (servicioActual != null) 'servicio_actual': servicioActual,
      if (estado != null) 'estado': estado,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaEgreso != null) 'fecha_egreso': fechaEgreso,
      if (motivoIngreso != null) 'motivo_ingreso': motivoIngreso,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (actualizadoEn != null) 'actualizado_en': actualizadoEn,
    });
  }

  PacientesCompanion copyWith({
    Value<int>? id,
    Value<String>? numeroHc,
    Value<String>? nombreCompleto,
    Value<String>? nombreNormalizado,
    Value<String?>? cedula,
    Value<DateTime>? fechaNacimiento,
    Value<String>? sexo,
    Value<String?>? grupoSanguineo,
    Value<String?>? factorRh,
    Value<double?>? pesoSeco,
    Value<double?>? pesoActual,
    Value<double?>? talla,
    Value<String?>? servicioActual,
    Value<String>? estado,
    Value<DateTime?>? fechaIngreso,
    Value<DateTime?>? fechaEgreso,
    Value<String?>? motivoIngreso,
    Value<DateTime>? creadoEn,
    Value<DateTime>? actualizadoEn,
  }) {
    return PacientesCompanion(
      id: id ?? this.id,
      numeroHc: numeroHc ?? this.numeroHc,
      nombreCompleto: nombreCompleto ?? this.nombreCompleto,
      nombreNormalizado: nombreNormalizado ?? this.nombreNormalizado,
      cedula: cedula ?? this.cedula,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
      sexo: sexo ?? this.sexo,
      grupoSanguineo: grupoSanguineo ?? this.grupoSanguineo,
      factorRh: factorRh ?? this.factorRh,
      pesoSeco: pesoSeco ?? this.pesoSeco,
      pesoActual: pesoActual ?? this.pesoActual,
      talla: talla ?? this.talla,
      servicioActual: servicioActual ?? this.servicioActual,
      estado: estado ?? this.estado,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaEgreso: fechaEgreso ?? this.fechaEgreso,
      motivoIngreso: motivoIngreso ?? this.motivoIngreso,
      creadoEn: creadoEn ?? this.creadoEn,
      actualizadoEn: actualizadoEn ?? this.actualizadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (numeroHc.present) {
      map['numero_hc'] = Variable<String>(numeroHc.value);
    }
    if (nombreCompleto.present) {
      map['nombre_completo'] = Variable<String>(nombreCompleto.value);
    }
    if (nombreNormalizado.present) {
      map['nombre_normalizado'] = Variable<String>(nombreNormalizado.value);
    }
    if (cedula.present) {
      map['cedula'] = Variable<String>(cedula.value);
    }
    if (fechaNacimiento.present) {
      map['fecha_nacimiento'] = Variable<DateTime>(fechaNacimiento.value);
    }
    if (sexo.present) {
      map['sexo'] = Variable<String>(sexo.value);
    }
    if (grupoSanguineo.present) {
      map['grupo_sanguineo'] = Variable<String>(grupoSanguineo.value);
    }
    if (factorRh.present) {
      map['factor_rh'] = Variable<String>(factorRh.value);
    }
    if (pesoSeco.present) {
      map['peso_seco'] = Variable<double>(pesoSeco.value);
    }
    if (pesoActual.present) {
      map['peso_actual'] = Variable<double>(pesoActual.value);
    }
    if (talla.present) {
      map['talla'] = Variable<double>(talla.value);
    }
    if (servicioActual.present) {
      map['servicio_actual'] = Variable<String>(servicioActual.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaEgreso.present) {
      map['fecha_egreso'] = Variable<DateTime>(fechaEgreso.value);
    }
    if (motivoIngreso.present) {
      map['motivo_ingreso'] = Variable<String>(motivoIngreso.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    if (actualizadoEn.present) {
      map['actualizado_en'] = Variable<DateTime>(actualizadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PacientesCompanion(')
          ..write('id: $id, ')
          ..write('numeroHc: $numeroHc, ')
          ..write('nombreCompleto: $nombreCompleto, ')
          ..write('nombreNormalizado: $nombreNormalizado, ')
          ..write('cedula: $cedula, ')
          ..write('fechaNacimiento: $fechaNacimiento, ')
          ..write('sexo: $sexo, ')
          ..write('grupoSanguineo: $grupoSanguineo, ')
          ..write('factorRh: $factorRh, ')
          ..write('pesoSeco: $pesoSeco, ')
          ..write('pesoActual: $pesoActual, ')
          ..write('talla: $talla, ')
          ..write('servicioActual: $servicioActual, ')
          ..write('estado: $estado, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaEgreso: $fechaEgreso, ')
          ..write('motivoIngreso: $motivoIngreso, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('actualizadoEn: $actualizadoEn')
          ..write(')'))
        .toString();
  }
}

class $HistoriasClinicasTable extends HistoriasClinicas
    with TableInfo<$HistoriasClinicasTable, HistoriasClinica> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoriasClinicasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _heaMeta = const VerificationMeta('hea');
  @override
  late final GeneratedColumn<String> hea = GeneratedColumn<String>(
    'hea',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _appMeta = const VerificationMeta('app');
  @override
  late final GeneratedColumn<String> app = GeneratedColumn<String>(
    'app',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _apfMeta = const VerificationMeta('apf');
  @override
  late final GeneratedColumn<String> apf = GeneratedColumn<String>(
    'apf',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alergiasMeta = const VerificationMeta(
    'alergias',
  );
  @override
  late final GeneratedColumn<String> alergias = GeneratedColumn<String>(
    'alergias',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operacionesPreviasMeta =
      const VerificationMeta('operacionesPrevias');
  @override
  late final GeneratedColumn<String> operacionesPrevias =
      GeneratedColumn<String>(
        'operaciones_previas',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _datosPositivosInterrogatorioMeta =
      const VerificationMeta('datosPositivosInterrogatorio');
  @override
  late final GeneratedColumn<String> datosPositivosInterrogatorio =
      GeneratedColumn<String>(
        'datos_positivos_interrogatorio',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _examenFisicoMeta = const VerificationMeta(
    'examenFisico',
  );
  @override
  late final GeneratedColumn<String> examenFisico = GeneratedColumn<String>(
    'examen_fisico',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creadoEnMeta = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _actualizadoEnMeta = const VerificationMeta(
    'actualizadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> actualizadoEn =
      GeneratedColumn<DateTime>(
        'actualizado_en',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    hea,
    app,
    apf,
    alergias,
    operacionesPrevias,
    datosPositivosInterrogatorio,
    examenFisico,
    creadoEn,
    actualizadoEn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historias_clinicas';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoriasClinica> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('hea')) {
      context.handle(
        _heaMeta,
        hea.isAcceptableOrUnknown(data['hea']!, _heaMeta),
      );
    }
    if (data.containsKey('app')) {
      context.handle(
        _appMeta,
        app.isAcceptableOrUnknown(data['app']!, _appMeta),
      );
    }
    if (data.containsKey('apf')) {
      context.handle(
        _apfMeta,
        apf.isAcceptableOrUnknown(data['apf']!, _apfMeta),
      );
    }
    if (data.containsKey('alergias')) {
      context.handle(
        _alergiasMeta,
        alergias.isAcceptableOrUnknown(data['alergias']!, _alergiasMeta),
      );
    }
    if (data.containsKey('operaciones_previas')) {
      context.handle(
        _operacionesPreviasMeta,
        operacionesPrevias.isAcceptableOrUnknown(
          data['operaciones_previas']!,
          _operacionesPreviasMeta,
        ),
      );
    }
    if (data.containsKey('datos_positivos_interrogatorio')) {
      context.handle(
        _datosPositivosInterrogatorioMeta,
        datosPositivosInterrogatorio.isAcceptableOrUnknown(
          data['datos_positivos_interrogatorio']!,
          _datosPositivosInterrogatorioMeta,
        ),
      );
    }
    if (data.containsKey('examen_fisico')) {
      context.handle(
        _examenFisicoMeta,
        examenFisico.isAcceptableOrUnknown(
          data['examen_fisico']!,
          _examenFisicoMeta,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _creadoEnMeta,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta),
      );
    }
    if (data.containsKey('actualizado_en')) {
      context.handle(
        _actualizadoEnMeta,
        actualizadoEn.isAcceptableOrUnknown(
          data['actualizado_en']!,
          _actualizadoEnMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoriasClinica map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoriasClinica(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      hea: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hea'],
      ),
      app: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}app'],
      ),
      apf: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}apf'],
      ),
      alergias: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alergias'],
      ),
      operacionesPrevias: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operaciones_previas'],
      ),
      datosPositivosInterrogatorio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}datos_positivos_interrogatorio'],
      ),
      examenFisico: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}examen_fisico'],
      ),
      creadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
      actualizadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actualizado_en'],
      )!,
    );
  }

  @override
  $HistoriasClinicasTable createAlias(String alias) {
    return $HistoriasClinicasTable(attachedDatabase, alias);
  }
}

class HistoriasClinica extends DataClass
    implements Insertable<HistoriasClinica> {
  final int id;
  final int pacienteId;
  final String? hea;
  final String? app;
  final String? apf;
  final String? alergias;
  final String? operacionesPrevias;
  final String? datosPositivosInterrogatorio;
  final String? examenFisico;
  final DateTime creadoEn;
  final DateTime actualizadoEn;
  const HistoriasClinica({
    required this.id,
    required this.pacienteId,
    this.hea,
    this.app,
    this.apf,
    this.alergias,
    this.operacionesPrevias,
    this.datosPositivosInterrogatorio,
    this.examenFisico,
    required this.creadoEn,
    required this.actualizadoEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || hea != null) {
      map['hea'] = Variable<String>(hea);
    }
    if (!nullToAbsent || app != null) {
      map['app'] = Variable<String>(app);
    }
    if (!nullToAbsent || apf != null) {
      map['apf'] = Variable<String>(apf);
    }
    if (!nullToAbsent || alergias != null) {
      map['alergias'] = Variable<String>(alergias);
    }
    if (!nullToAbsent || operacionesPrevias != null) {
      map['operaciones_previas'] = Variable<String>(operacionesPrevias);
    }
    if (!nullToAbsent || datosPositivosInterrogatorio != null) {
      map['datos_positivos_interrogatorio'] = Variable<String>(
        datosPositivosInterrogatorio,
      );
    }
    if (!nullToAbsent || examenFisico != null) {
      map['examen_fisico'] = Variable<String>(examenFisico);
    }
    map['creado_en'] = Variable<DateTime>(creadoEn);
    map['actualizado_en'] = Variable<DateTime>(actualizadoEn);
    return map;
  }

  HistoriasClinicasCompanion toCompanion(bool nullToAbsent) {
    return HistoriasClinicasCompanion(
      id: Value(id),
      pacienteId: Value(pacienteId),
      hea: hea == null && nullToAbsent ? const Value.absent() : Value(hea),
      app: app == null && nullToAbsent ? const Value.absent() : Value(app),
      apf: apf == null && nullToAbsent ? const Value.absent() : Value(apf),
      alergias: alergias == null && nullToAbsent
          ? const Value.absent()
          : Value(alergias),
      operacionesPrevias: operacionesPrevias == null && nullToAbsent
          ? const Value.absent()
          : Value(operacionesPrevias),
      datosPositivosInterrogatorio:
          datosPositivosInterrogatorio == null && nullToAbsent
          ? const Value.absent()
          : Value(datosPositivosInterrogatorio),
      examenFisico: examenFisico == null && nullToAbsent
          ? const Value.absent()
          : Value(examenFisico),
      creadoEn: Value(creadoEn),
      actualizadoEn: Value(actualizadoEn),
    );
  }

  factory HistoriasClinica.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoriasClinica(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      hea: serializer.fromJson<String?>(json['hea']),
      app: serializer.fromJson<String?>(json['app']),
      apf: serializer.fromJson<String?>(json['apf']),
      alergias: serializer.fromJson<String?>(json['alergias']),
      operacionesPrevias: serializer.fromJson<String?>(
        json['operacionesPrevias'],
      ),
      datosPositivosInterrogatorio: serializer.fromJson<String?>(
        json['datosPositivosInterrogatorio'],
      ),
      examenFisico: serializer.fromJson<String?>(json['examenFisico']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
      actualizadoEn: serializer.fromJson<DateTime>(json['actualizadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'hea': serializer.toJson<String?>(hea),
      'app': serializer.toJson<String?>(app),
      'apf': serializer.toJson<String?>(apf),
      'alergias': serializer.toJson<String?>(alergias),
      'operacionesPrevias': serializer.toJson<String?>(operacionesPrevias),
      'datosPositivosInterrogatorio': serializer.toJson<String?>(
        datosPositivosInterrogatorio,
      ),
      'examenFisico': serializer.toJson<String?>(examenFisico),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
      'actualizadoEn': serializer.toJson<DateTime>(actualizadoEn),
    };
  }

  HistoriasClinica copyWith({
    int? id,
    int? pacienteId,
    Value<String?> hea = const Value.absent(),
    Value<String?> app = const Value.absent(),
    Value<String?> apf = const Value.absent(),
    Value<String?> alergias = const Value.absent(),
    Value<String?> operacionesPrevias = const Value.absent(),
    Value<String?> datosPositivosInterrogatorio = const Value.absent(),
    Value<String?> examenFisico = const Value.absent(),
    DateTime? creadoEn,
    DateTime? actualizadoEn,
  }) => HistoriasClinica(
    id: id ?? this.id,
    pacienteId: pacienteId ?? this.pacienteId,
    hea: hea.present ? hea.value : this.hea,
    app: app.present ? app.value : this.app,
    apf: apf.present ? apf.value : this.apf,
    alergias: alergias.present ? alergias.value : this.alergias,
    operacionesPrevias: operacionesPrevias.present
        ? operacionesPrevias.value
        : this.operacionesPrevias,
    datosPositivosInterrogatorio: datosPositivosInterrogatorio.present
        ? datosPositivosInterrogatorio.value
        : this.datosPositivosInterrogatorio,
    examenFisico: examenFisico.present ? examenFisico.value : this.examenFisico,
    creadoEn: creadoEn ?? this.creadoEn,
    actualizadoEn: actualizadoEn ?? this.actualizadoEn,
  );
  HistoriasClinica copyWithCompanion(HistoriasClinicasCompanion data) {
    return HistoriasClinica(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      hea: data.hea.present ? data.hea.value : this.hea,
      app: data.app.present ? data.app.value : this.app,
      apf: data.apf.present ? data.apf.value : this.apf,
      alergias: data.alergias.present ? data.alergias.value : this.alergias,
      operacionesPrevias: data.operacionesPrevias.present
          ? data.operacionesPrevias.value
          : this.operacionesPrevias,
      datosPositivosInterrogatorio: data.datosPositivosInterrogatorio.present
          ? data.datosPositivosInterrogatorio.value
          : this.datosPositivosInterrogatorio,
      examenFisico: data.examenFisico.present
          ? data.examenFisico.value
          : this.examenFisico,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
      actualizadoEn: data.actualizadoEn.present
          ? data.actualizadoEn.value
          : this.actualizadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoriasClinica(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('hea: $hea, ')
          ..write('app: $app, ')
          ..write('apf: $apf, ')
          ..write('alergias: $alergias, ')
          ..write('operacionesPrevias: $operacionesPrevias, ')
          ..write(
            'datosPositivosInterrogatorio: $datosPositivosInterrogatorio, ',
          )
          ..write('examenFisico: $examenFisico, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('actualizadoEn: $actualizadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pacienteId,
    hea,
    app,
    apf,
    alergias,
    operacionesPrevias,
    datosPositivosInterrogatorio,
    examenFisico,
    creadoEn,
    actualizadoEn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoriasClinica &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.hea == this.hea &&
          other.app == this.app &&
          other.apf == this.apf &&
          other.alergias == this.alergias &&
          other.operacionesPrevias == this.operacionesPrevias &&
          other.datosPositivosInterrogatorio ==
              this.datosPositivosInterrogatorio &&
          other.examenFisico == this.examenFisico &&
          other.creadoEn == this.creadoEn &&
          other.actualizadoEn == this.actualizadoEn);
}

class HistoriasClinicasCompanion extends UpdateCompanion<HistoriasClinica> {
  final Value<int> id;
  final Value<int> pacienteId;
  final Value<String?> hea;
  final Value<String?> app;
  final Value<String?> apf;
  final Value<String?> alergias;
  final Value<String?> operacionesPrevias;
  final Value<String?> datosPositivosInterrogatorio;
  final Value<String?> examenFisico;
  final Value<DateTime> creadoEn;
  final Value<DateTime> actualizadoEn;
  const HistoriasClinicasCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.hea = const Value.absent(),
    this.app = const Value.absent(),
    this.apf = const Value.absent(),
    this.alergias = const Value.absent(),
    this.operacionesPrevias = const Value.absent(),
    this.datosPositivosInterrogatorio = const Value.absent(),
    this.examenFisico = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.actualizadoEn = const Value.absent(),
  });
  HistoriasClinicasCompanion.insert({
    this.id = const Value.absent(),
    required int pacienteId,
    this.hea = const Value.absent(),
    this.app = const Value.absent(),
    this.apf = const Value.absent(),
    this.alergias = const Value.absent(),
    this.operacionesPrevias = const Value.absent(),
    this.datosPositivosInterrogatorio = const Value.absent(),
    this.examenFisico = const Value.absent(),
    this.creadoEn = const Value.absent(),
    this.actualizadoEn = const Value.absent(),
  }) : pacienteId = Value(pacienteId);
  static Insertable<HistoriasClinica> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<String>? hea,
    Expression<String>? app,
    Expression<String>? apf,
    Expression<String>? alergias,
    Expression<String>? operacionesPrevias,
    Expression<String>? datosPositivosInterrogatorio,
    Expression<String>? examenFisico,
    Expression<DateTime>? creadoEn,
    Expression<DateTime>? actualizadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (hea != null) 'hea': hea,
      if (app != null) 'app': app,
      if (apf != null) 'apf': apf,
      if (alergias != null) 'alergias': alergias,
      if (operacionesPrevias != null) 'operaciones_previas': operacionesPrevias,
      if (datosPositivosInterrogatorio != null)
        'datos_positivos_interrogatorio': datosPositivosInterrogatorio,
      if (examenFisico != null) 'examen_fisico': examenFisico,
      if (creadoEn != null) 'creado_en': creadoEn,
      if (actualizadoEn != null) 'actualizado_en': actualizadoEn,
    });
  }

  HistoriasClinicasCompanion copyWith({
    Value<int>? id,
    Value<int>? pacienteId,
    Value<String?>? hea,
    Value<String?>? app,
    Value<String?>? apf,
    Value<String?>? alergias,
    Value<String?>? operacionesPrevias,
    Value<String?>? datosPositivosInterrogatorio,
    Value<String?>? examenFisico,
    Value<DateTime>? creadoEn,
    Value<DateTime>? actualizadoEn,
  }) {
    return HistoriasClinicasCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      hea: hea ?? this.hea,
      app: app ?? this.app,
      apf: apf ?? this.apf,
      alergias: alergias ?? this.alergias,
      operacionesPrevias: operacionesPrevias ?? this.operacionesPrevias,
      datosPositivosInterrogatorio:
          datosPositivosInterrogatorio ?? this.datosPositivosInterrogatorio,
      examenFisico: examenFisico ?? this.examenFisico,
      creadoEn: creadoEn ?? this.creadoEn,
      actualizadoEn: actualizadoEn ?? this.actualizadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (hea.present) {
      map['hea'] = Variable<String>(hea.value);
    }
    if (app.present) {
      map['app'] = Variable<String>(app.value);
    }
    if (apf.present) {
      map['apf'] = Variable<String>(apf.value);
    }
    if (alergias.present) {
      map['alergias'] = Variable<String>(alergias.value);
    }
    if (operacionesPrevias.present) {
      map['operaciones_previas'] = Variable<String>(operacionesPrevias.value);
    }
    if (datosPositivosInterrogatorio.present) {
      map['datos_positivos_interrogatorio'] = Variable<String>(
        datosPositivosInterrogatorio.value,
      );
    }
    if (examenFisico.present) {
      map['examen_fisico'] = Variable<String>(examenFisico.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    if (actualizadoEn.present) {
      map['actualizado_en'] = Variable<DateTime>(actualizadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoriasClinicasCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('hea: $hea, ')
          ..write('app: $app, ')
          ..write('apf: $apf, ')
          ..write('alergias: $alergias, ')
          ..write('operacionesPrevias: $operacionesPrevias, ')
          ..write(
            'datosPositivosInterrogatorio: $datosPositivosInterrogatorio, ',
          )
          ..write('examenFisico: $examenFisico, ')
          ..write('creadoEn: $creadoEn, ')
          ..write('actualizadoEn: $actualizadoEn')
          ..write(')'))
        .toString();
  }
}

class $EpisodiosTable extends Episodios
    with TableInfo<$EpisodiosTable, Episodio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpisodiosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tipoEpisodioMeta = const VerificationMeta(
    'tipoEpisodio',
  );
  @override
  late final GeneratedColumn<String> tipoEpisodio = GeneratedColumn<String>(
    'tipo_episodio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaIngresoMeta = const VerificationMeta(
    'fechaIngreso',
  );
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
    'fecha_ingreso',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaEgresoMeta = const VerificationMeta(
    'fechaEgreso',
  );
  @override
  late final GeneratedColumn<DateTime> fechaEgreso = GeneratedColumn<DateTime>(
    'fecha_egreso',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _servicioOrigenMeta = const VerificationMeta(
    'servicioOrigen',
  );
  @override
  late final GeneratedColumn<String> servicioOrigen = GeneratedColumn<String>(
    'servicio_origen',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motivoIngresoMeta = const VerificationMeta(
    'motivoIngreso',
  );
  @override
  late final GeneratedColumn<String> motivoIngreso = GeneratedColumn<String>(
    'motivo_ingreso',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('activo'),
  );
  static const VerificationMeta _condicionEgresoMeta = const VerificationMeta(
    'condicionEgreso',
  );
  @override
  late final GeneratedColumn<String> condicionEgreso = GeneratedColumn<String>(
    'condicion_egreso',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _creadoEnMeta = const VerificationMeta(
    'creadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> creadoEn = GeneratedColumn<DateTime>(
    'creado_en',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    tipoEpisodio,
    fechaIngreso,
    fechaEgreso,
    servicioOrigen,
    motivoIngreso,
    estado,
    condicionEgreso,
    creadoEn,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episodios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Episodio> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('tipo_episodio')) {
      context.handle(
        _tipoEpisodioMeta,
        tipoEpisodio.isAcceptableOrUnknown(
          data['tipo_episodio']!,
          _tipoEpisodioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoEpisodioMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
        _fechaIngresoMeta,
        fechaIngreso.isAcceptableOrUnknown(
          data['fecha_ingreso']!,
          _fechaIngresoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaIngresoMeta);
    }
    if (data.containsKey('fecha_egreso')) {
      context.handle(
        _fechaEgresoMeta,
        fechaEgreso.isAcceptableOrUnknown(
          data['fecha_egreso']!,
          _fechaEgresoMeta,
        ),
      );
    }
    if (data.containsKey('servicio_origen')) {
      context.handle(
        _servicioOrigenMeta,
        servicioOrigen.isAcceptableOrUnknown(
          data['servicio_origen']!,
          _servicioOrigenMeta,
        ),
      );
    }
    if (data.containsKey('motivo_ingreso')) {
      context.handle(
        _motivoIngresoMeta,
        motivoIngreso.isAcceptableOrUnknown(
          data['motivo_ingreso']!,
          _motivoIngresoMeta,
        ),
      );
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    }
    if (data.containsKey('condicion_egreso')) {
      context.handle(
        _condicionEgresoMeta,
        condicionEgreso.isAcceptableOrUnknown(
          data['condicion_egreso']!,
          _condicionEgresoMeta,
        ),
      );
    }
    if (data.containsKey('creado_en')) {
      context.handle(
        _creadoEnMeta,
        creadoEn.isAcceptableOrUnknown(data['creado_en']!, _creadoEnMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Episodio map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Episodio(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      tipoEpisodio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_episodio'],
      )!,
      fechaIngreso: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_ingreso'],
      )!,
      fechaEgreso: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_egreso'],
      ),
      servicioOrigen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}servicio_origen'],
      ),
      motivoIngreso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}motivo_ingreso'],
      ),
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      condicionEgreso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condicion_egreso'],
      ),
      creadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}creado_en'],
      )!,
    );
  }

  @override
  $EpisodiosTable createAlias(String alias) {
    return $EpisodiosTable(attachedDatabase, alias);
  }
}

class Episodio extends DataClass implements Insertable<Episodio> {
  final int id;
  final int pacienteId;
  final String tipoEpisodio;
  final DateTime fechaIngreso;
  final DateTime? fechaEgreso;
  final String? servicioOrigen;
  final String? motivoIngreso;
  final String estado;
  final String? condicionEgreso;
  final DateTime creadoEn;
  const Episodio({
    required this.id,
    required this.pacienteId,
    required this.tipoEpisodio,
    required this.fechaIngreso,
    this.fechaEgreso,
    this.servicioOrigen,
    this.motivoIngreso,
    required this.estado,
    this.condicionEgreso,
    required this.creadoEn,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['paciente_id'] = Variable<int>(pacienteId);
    map['tipo_episodio'] = Variable<String>(tipoEpisodio);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || fechaEgreso != null) {
      map['fecha_egreso'] = Variable<DateTime>(fechaEgreso);
    }
    if (!nullToAbsent || servicioOrigen != null) {
      map['servicio_origen'] = Variable<String>(servicioOrigen);
    }
    if (!nullToAbsent || motivoIngreso != null) {
      map['motivo_ingreso'] = Variable<String>(motivoIngreso);
    }
    map['estado'] = Variable<String>(estado);
    if (!nullToAbsent || condicionEgreso != null) {
      map['condicion_egreso'] = Variable<String>(condicionEgreso);
    }
    map['creado_en'] = Variable<DateTime>(creadoEn);
    return map;
  }

  EpisodiosCompanion toCompanion(bool nullToAbsent) {
    return EpisodiosCompanion(
      id: Value(id),
      pacienteId: Value(pacienteId),
      tipoEpisodio: Value(tipoEpisodio),
      fechaIngreso: Value(fechaIngreso),
      fechaEgreso: fechaEgreso == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaEgreso),
      servicioOrigen: servicioOrigen == null && nullToAbsent
          ? const Value.absent()
          : Value(servicioOrigen),
      motivoIngreso: motivoIngreso == null && nullToAbsent
          ? const Value.absent()
          : Value(motivoIngreso),
      estado: Value(estado),
      condicionEgreso: condicionEgreso == null && nullToAbsent
          ? const Value.absent()
          : Value(condicionEgreso),
      creadoEn: Value(creadoEn),
    );
  }

  factory Episodio.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Episodio(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      tipoEpisodio: serializer.fromJson<String>(json['tipoEpisodio']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      fechaEgreso: serializer.fromJson<DateTime?>(json['fechaEgreso']),
      servicioOrigen: serializer.fromJson<String?>(json['servicioOrigen']),
      motivoIngreso: serializer.fromJson<String?>(json['motivoIngreso']),
      estado: serializer.fromJson<String>(json['estado']),
      condicionEgreso: serializer.fromJson<String?>(json['condicionEgreso']),
      creadoEn: serializer.fromJson<DateTime>(json['creadoEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'tipoEpisodio': serializer.toJson<String>(tipoEpisodio),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'fechaEgreso': serializer.toJson<DateTime?>(fechaEgreso),
      'servicioOrigen': serializer.toJson<String?>(servicioOrigen),
      'motivoIngreso': serializer.toJson<String?>(motivoIngreso),
      'estado': serializer.toJson<String>(estado),
      'condicionEgreso': serializer.toJson<String?>(condicionEgreso),
      'creadoEn': serializer.toJson<DateTime>(creadoEn),
    };
  }

  Episodio copyWith({
    int? id,
    int? pacienteId,
    String? tipoEpisodio,
    DateTime? fechaIngreso,
    Value<DateTime?> fechaEgreso = const Value.absent(),
    Value<String?> servicioOrigen = const Value.absent(),
    Value<String?> motivoIngreso = const Value.absent(),
    String? estado,
    Value<String?> condicionEgreso = const Value.absent(),
    DateTime? creadoEn,
  }) => Episodio(
    id: id ?? this.id,
    pacienteId: pacienteId ?? this.pacienteId,
    tipoEpisodio: tipoEpisodio ?? this.tipoEpisodio,
    fechaIngreso: fechaIngreso ?? this.fechaIngreso,
    fechaEgreso: fechaEgreso.present ? fechaEgreso.value : this.fechaEgreso,
    servicioOrigen: servicioOrigen.present
        ? servicioOrigen.value
        : this.servicioOrigen,
    motivoIngreso: motivoIngreso.present
        ? motivoIngreso.value
        : this.motivoIngreso,
    estado: estado ?? this.estado,
    condicionEgreso: condicionEgreso.present
        ? condicionEgreso.value
        : this.condicionEgreso,
    creadoEn: creadoEn ?? this.creadoEn,
  );
  Episodio copyWithCompanion(EpisodiosCompanion data) {
    return Episodio(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      tipoEpisodio: data.tipoEpisodio.present
          ? data.tipoEpisodio.value
          : this.tipoEpisodio,
      fechaIngreso: data.fechaIngreso.present
          ? data.fechaIngreso.value
          : this.fechaIngreso,
      fechaEgreso: data.fechaEgreso.present
          ? data.fechaEgreso.value
          : this.fechaEgreso,
      servicioOrigen: data.servicioOrigen.present
          ? data.servicioOrigen.value
          : this.servicioOrigen,
      motivoIngreso: data.motivoIngreso.present
          ? data.motivoIngreso.value
          : this.motivoIngreso,
      estado: data.estado.present ? data.estado.value : this.estado,
      condicionEgreso: data.condicionEgreso.present
          ? data.condicionEgreso.value
          : this.condicionEgreso,
      creadoEn: data.creadoEn.present ? data.creadoEn.value : this.creadoEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Episodio(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('tipoEpisodio: $tipoEpisodio, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaEgreso: $fechaEgreso, ')
          ..write('servicioOrigen: $servicioOrigen, ')
          ..write('motivoIngreso: $motivoIngreso, ')
          ..write('estado: $estado, ')
          ..write('condicionEgreso: $condicionEgreso, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pacienteId,
    tipoEpisodio,
    fechaIngreso,
    fechaEgreso,
    servicioOrigen,
    motivoIngreso,
    estado,
    condicionEgreso,
    creadoEn,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Episodio &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.tipoEpisodio == this.tipoEpisodio &&
          other.fechaIngreso == this.fechaIngreso &&
          other.fechaEgreso == this.fechaEgreso &&
          other.servicioOrigen == this.servicioOrigen &&
          other.motivoIngreso == this.motivoIngreso &&
          other.estado == this.estado &&
          other.condicionEgreso == this.condicionEgreso &&
          other.creadoEn == this.creadoEn);
}

class EpisodiosCompanion extends UpdateCompanion<Episodio> {
  final Value<int> id;
  final Value<int> pacienteId;
  final Value<String> tipoEpisodio;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> fechaEgreso;
  final Value<String?> servicioOrigen;
  final Value<String?> motivoIngreso;
  final Value<String> estado;
  final Value<String?> condicionEgreso;
  final Value<DateTime> creadoEn;
  const EpisodiosCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.tipoEpisodio = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.fechaEgreso = const Value.absent(),
    this.servicioOrigen = const Value.absent(),
    this.motivoIngreso = const Value.absent(),
    this.estado = const Value.absent(),
    this.condicionEgreso = const Value.absent(),
    this.creadoEn = const Value.absent(),
  });
  EpisodiosCompanion.insert({
    this.id = const Value.absent(),
    required int pacienteId,
    required String tipoEpisodio,
    required DateTime fechaIngreso,
    this.fechaEgreso = const Value.absent(),
    this.servicioOrigen = const Value.absent(),
    this.motivoIngreso = const Value.absent(),
    this.estado = const Value.absent(),
    this.condicionEgreso = const Value.absent(),
    this.creadoEn = const Value.absent(),
  }) : pacienteId = Value(pacienteId),
       tipoEpisodio = Value(tipoEpisodio),
       fechaIngreso = Value(fechaIngreso);
  static Insertable<Episodio> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<String>? tipoEpisodio,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime>? fechaEgreso,
    Expression<String>? servicioOrigen,
    Expression<String>? motivoIngreso,
    Expression<String>? estado,
    Expression<String>? condicionEgreso,
    Expression<DateTime>? creadoEn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (tipoEpisodio != null) 'tipo_episodio': tipoEpisodio,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (fechaEgreso != null) 'fecha_egreso': fechaEgreso,
      if (servicioOrigen != null) 'servicio_origen': servicioOrigen,
      if (motivoIngreso != null) 'motivo_ingreso': motivoIngreso,
      if (estado != null) 'estado': estado,
      if (condicionEgreso != null) 'condicion_egreso': condicionEgreso,
      if (creadoEn != null) 'creado_en': creadoEn,
    });
  }

  EpisodiosCompanion copyWith({
    Value<int>? id,
    Value<int>? pacienteId,
    Value<String>? tipoEpisodio,
    Value<DateTime>? fechaIngreso,
    Value<DateTime?>? fechaEgreso,
    Value<String?>? servicioOrigen,
    Value<String?>? motivoIngreso,
    Value<String>? estado,
    Value<String?>? condicionEgreso,
    Value<DateTime>? creadoEn,
  }) {
    return EpisodiosCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      tipoEpisodio: tipoEpisodio ?? this.tipoEpisodio,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      fechaEgreso: fechaEgreso ?? this.fechaEgreso,
      servicioOrigen: servicioOrigen ?? this.servicioOrigen,
      motivoIngreso: motivoIngreso ?? this.motivoIngreso,
      estado: estado ?? this.estado,
      condicionEgreso: condicionEgreso ?? this.condicionEgreso,
      creadoEn: creadoEn ?? this.creadoEn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (tipoEpisodio.present) {
      map['tipo_episodio'] = Variable<String>(tipoEpisodio.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (fechaEgreso.present) {
      map['fecha_egreso'] = Variable<DateTime>(fechaEgreso.value);
    }
    if (servicioOrigen.present) {
      map['servicio_origen'] = Variable<String>(servicioOrigen.value);
    }
    if (motivoIngreso.present) {
      map['motivo_ingreso'] = Variable<String>(motivoIngreso.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (condicionEgreso.present) {
      map['condicion_egreso'] = Variable<String>(condicionEgreso.value);
    }
    if (creadoEn.present) {
      map['creado_en'] = Variable<DateTime>(creadoEn.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodiosCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('tipoEpisodio: $tipoEpisodio, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('fechaEgreso: $fechaEgreso, ')
          ..write('servicioOrigen: $servicioOrigen, ')
          ..write('motivoIngreso: $motivoIngreso, ')
          ..write('estado: $estado, ')
          ..write('condicionEgreso: $condicionEgreso, ')
          ..write('creadoEn: $creadoEn')
          ..write(')'))
        .toString();
  }
}

class $DiagnosticosTable extends Diagnosticos
    with TableInfo<$DiagnosticosTable, Diagnostico> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosticosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _codigoCieMeta = const VerificationMeta(
    'codigoCie',
  );
  @override
  late final GeneratedColumn<String> codigoCie = GeneratedColumn<String>(
    'codigo_cie',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('principal'),
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    episodioId,
    codigoCie,
    descripcion,
    tipo,
    fecha,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diagnosticos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Diagnostico> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodioIdMeta);
    }
    if (data.containsKey('codigo_cie')) {
      context.handle(
        _codigoCieMeta,
        codigoCie.isAcceptableOrUnknown(data['codigo_cie']!, _codigoCieMeta),
      );
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Diagnostico map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Diagnostico(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      )!,
      codigoCie: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo_cie'],
      ),
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  $DiagnosticosTable createAlias(String alias) {
    return $DiagnosticosTable(attachedDatabase, alias);
  }
}

class Diagnostico extends DataClass implements Insertable<Diagnostico> {
  final int id;
  final int episodioId;
  final String? codigoCie;
  final String descripcion;
  final String tipo;
  final DateTime fecha;
  const Diagnostico({
    required this.id,
    required this.episodioId,
    this.codigoCie,
    required this.descripcion,
    required this.tipo,
    required this.fecha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['episodio_id'] = Variable<int>(episodioId);
    if (!nullToAbsent || codigoCie != null) {
      map['codigo_cie'] = Variable<String>(codigoCie);
    }
    map['descripcion'] = Variable<String>(descripcion);
    map['tipo'] = Variable<String>(tipo);
    map['fecha'] = Variable<DateTime>(fecha);
    return map;
  }

  DiagnosticosCompanion toCompanion(bool nullToAbsent) {
    return DiagnosticosCompanion(
      id: Value(id),
      episodioId: Value(episodioId),
      codigoCie: codigoCie == null && nullToAbsent
          ? const Value.absent()
          : Value(codigoCie),
      descripcion: Value(descripcion),
      tipo: Value(tipo),
      fecha: Value(fecha),
    );
  }

  factory Diagnostico.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Diagnostico(
      id: serializer.fromJson<int>(json['id']),
      episodioId: serializer.fromJson<int>(json['episodioId']),
      codigoCie: serializer.fromJson<String?>(json['codigoCie']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      tipo: serializer.fromJson<String>(json['tipo']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'episodioId': serializer.toJson<int>(episodioId),
      'codigoCie': serializer.toJson<String?>(codigoCie),
      'descripcion': serializer.toJson<String>(descripcion),
      'tipo': serializer.toJson<String>(tipo),
      'fecha': serializer.toJson<DateTime>(fecha),
    };
  }

  Diagnostico copyWith({
    int? id,
    int? episodioId,
    Value<String?> codigoCie = const Value.absent(),
    String? descripcion,
    String? tipo,
    DateTime? fecha,
  }) => Diagnostico(
    id: id ?? this.id,
    episodioId: episodioId ?? this.episodioId,
    codigoCie: codigoCie.present ? codigoCie.value : this.codigoCie,
    descripcion: descripcion ?? this.descripcion,
    tipo: tipo ?? this.tipo,
    fecha: fecha ?? this.fecha,
  );
  Diagnostico copyWithCompanion(DiagnosticosCompanion data) {
    return Diagnostico(
      id: data.id.present ? data.id.value : this.id,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      codigoCie: data.codigoCie.present ? data.codigoCie.value : this.codigoCie,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Diagnostico(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('codigoCie: $codigoCie, ')
          ..write('descripcion: $descripcion, ')
          ..write('tipo: $tipo, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, episodioId, codigoCie, descripcion, tipo, fecha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Diagnostico &&
          other.id == this.id &&
          other.episodioId == this.episodioId &&
          other.codigoCie == this.codigoCie &&
          other.descripcion == this.descripcion &&
          other.tipo == this.tipo &&
          other.fecha == this.fecha);
}

class DiagnosticosCompanion extends UpdateCompanion<Diagnostico> {
  final Value<int> id;
  final Value<int> episodioId;
  final Value<String?> codigoCie;
  final Value<String> descripcion;
  final Value<String> tipo;
  final Value<DateTime> fecha;
  const DiagnosticosCompanion({
    this.id = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.codigoCie = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.tipo = const Value.absent(),
    this.fecha = const Value.absent(),
  });
  DiagnosticosCompanion.insert({
    this.id = const Value.absent(),
    required int episodioId,
    this.codigoCie = const Value.absent(),
    required String descripcion,
    this.tipo = const Value.absent(),
    this.fecha = const Value.absent(),
  }) : episodioId = Value(episodioId),
       descripcion = Value(descripcion);
  static Insertable<Diagnostico> custom({
    Expression<int>? id,
    Expression<int>? episodioId,
    Expression<String>? codigoCie,
    Expression<String>? descripcion,
    Expression<String>? tipo,
    Expression<DateTime>? fecha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (episodioId != null) 'episodio_id': episodioId,
      if (codigoCie != null) 'codigo_cie': codigoCie,
      if (descripcion != null) 'descripcion': descripcion,
      if (tipo != null) 'tipo': tipo,
      if (fecha != null) 'fecha': fecha,
    });
  }

  DiagnosticosCompanion copyWith({
    Value<int>? id,
    Value<int>? episodioId,
    Value<String?>? codigoCie,
    Value<String>? descripcion,
    Value<String>? tipo,
    Value<DateTime>? fecha,
  }) {
    return DiagnosticosCompanion(
      id: id ?? this.id,
      episodioId: episodioId ?? this.episodioId,
      codigoCie: codigoCie ?? this.codigoCie,
      descripcion: descripcion ?? this.descripcion,
      tipo: tipo ?? this.tipo,
      fecha: fecha ?? this.fecha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (codigoCie.present) {
      map['codigo_cie'] = Variable<String>(codigoCie.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosticosCompanion(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('codigoCie: $codigoCie, ')
          ..write('descripcion: $descripcion, ')
          ..write('tipo: $tipo, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }
}

class $SignosVitalesTable extends SignosVitales
    with TableInfo<$SignosVitalesTable, SignosVitale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignosVitalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frecuenciaCardiacaMeta =
      const VerificationMeta('frecuenciaCardiaca');
  @override
  late final GeneratedColumn<double> frecuenciaCardiaca =
      GeneratedColumn<double>(
        'frecuencia_cardiaca',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _presionSistolicaMeta = const VerificationMeta(
    'presionSistolica',
  );
  @override
  late final GeneratedColumn<double> presionSistolica = GeneratedColumn<double>(
    'presion_sistolica',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _presionDiastolicaMeta = const VerificationMeta(
    'presionDiastolica',
  );
  @override
  late final GeneratedColumn<double> presionDiastolica =
      GeneratedColumn<double>(
        'presion_diastolica',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _presionMediaMeta = const VerificationMeta(
    'presionMedia',
  );
  @override
  late final GeneratedColumn<double> presionMedia = GeneratedColumn<double>(
    'presion_media',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frecuenciaRespiratoriaMeta =
      const VerificationMeta('frecuenciaRespiratoria');
  @override
  late final GeneratedColumn<double> frecuenciaRespiratoria =
      GeneratedColumn<double>(
        'frecuencia_respiratoria',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _temperaturaMeta = const VerificationMeta(
    'temperatura',
  );
  @override
  late final GeneratedColumn<double> temperatura = GeneratedColumn<double>(
    'temperatura',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _saturacionO2Meta = const VerificationMeta(
    'saturacionO2',
  );
  @override
  late final GeneratedColumn<double> saturacionO2 = GeneratedColumn<double>(
    'saturacion_o2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diuresisMeta = const VerificationMeta(
    'diuresis',
  );
  @override
  late final GeneratedColumn<double> diuresis = GeneratedColumn<double>(
    'diuresis',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
    'notas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    episodioId,
    timestamp,
    frecuenciaCardiaca,
    presionSistolica,
    presionDiastolica,
    presionMedia,
    frecuenciaRespiratoria,
    temperatura,
    saturacionO2,
    diuresis,
    notas,
    invalidado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'signos_vitales';
  @override
  VerificationContext validateIntegrity(
    Insertable<SignosVitale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('frecuencia_cardiaca')) {
      context.handle(
        _frecuenciaCardiacaMeta,
        frecuenciaCardiaca.isAcceptableOrUnknown(
          data['frecuencia_cardiaca']!,
          _frecuenciaCardiacaMeta,
        ),
      );
    }
    if (data.containsKey('presion_sistolica')) {
      context.handle(
        _presionSistolicaMeta,
        presionSistolica.isAcceptableOrUnknown(
          data['presion_sistolica']!,
          _presionSistolicaMeta,
        ),
      );
    }
    if (data.containsKey('presion_diastolica')) {
      context.handle(
        _presionDiastolicaMeta,
        presionDiastolica.isAcceptableOrUnknown(
          data['presion_diastolica']!,
          _presionDiastolicaMeta,
        ),
      );
    }
    if (data.containsKey('presion_media')) {
      context.handle(
        _presionMediaMeta,
        presionMedia.isAcceptableOrUnknown(
          data['presion_media']!,
          _presionMediaMeta,
        ),
      );
    }
    if (data.containsKey('frecuencia_respiratoria')) {
      context.handle(
        _frecuenciaRespiratoriaMeta,
        frecuenciaRespiratoria.isAcceptableOrUnknown(
          data['frecuencia_respiratoria']!,
          _frecuenciaRespiratoriaMeta,
        ),
      );
    }
    if (data.containsKey('temperatura')) {
      context.handle(
        _temperaturaMeta,
        temperatura.isAcceptableOrUnknown(
          data['temperatura']!,
          _temperaturaMeta,
        ),
      );
    }
    if (data.containsKey('saturacion_o2')) {
      context.handle(
        _saturacionO2Meta,
        saturacionO2.isAcceptableOrUnknown(
          data['saturacion_o2']!,
          _saturacionO2Meta,
        ),
      );
    }
    if (data.containsKey('diuresis')) {
      context.handle(
        _diuresisMeta,
        diuresis.isAcceptableOrUnknown(data['diuresis']!, _diuresisMeta),
      );
    }
    if (data.containsKey('notas')) {
      context.handle(
        _notasMeta,
        notas.isAcceptableOrUnknown(data['notas']!, _notasMeta),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SignosVitale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SignosVitale(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      frecuenciaCardiaca: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frecuencia_cardiaca'],
      ),
      presionSistolica: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}presion_sistolica'],
      ),
      presionDiastolica: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}presion_diastolica'],
      ),
      presionMedia: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}presion_media'],
      ),
      frecuenciaRespiratoria: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frecuencia_respiratoria'],
      ),
      temperatura: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperatura'],
      ),
      saturacionO2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}saturacion_o2'],
      ),
      diuresis: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diuresis'],
      ),
      notas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notas'],
      ),
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
    );
  }

  @override
  $SignosVitalesTable createAlias(String alias) {
    return $SignosVitalesTable(attachedDatabase, alias);
  }
}

class SignosVitale extends DataClass implements Insertable<SignosVitale> {
  final int id;
  final int pacienteId;
  final int? episodioId;
  final DateTime timestamp;
  final double? frecuenciaCardiaca;
  final double? presionSistolica;
  final double? presionDiastolica;
  final double? presionMedia;
  final double? frecuenciaRespiratoria;
  final double? temperatura;
  final double? saturacionO2;
  final double? diuresis;
  final String? notas;
  final bool invalidado;
  const SignosVitale({
    required this.id,
    required this.pacienteId,
    this.episodioId,
    required this.timestamp,
    this.frecuenciaCardiaca,
    this.presionSistolica,
    this.presionDiastolica,
    this.presionMedia,
    this.frecuenciaRespiratoria,
    this.temperatura,
    this.saturacionO2,
    this.diuresis,
    this.notas,
    required this.invalidado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || episodioId != null) {
      map['episodio_id'] = Variable<int>(episodioId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || frecuenciaCardiaca != null) {
      map['frecuencia_cardiaca'] = Variable<double>(frecuenciaCardiaca);
    }
    if (!nullToAbsent || presionSistolica != null) {
      map['presion_sistolica'] = Variable<double>(presionSistolica);
    }
    if (!nullToAbsent || presionDiastolica != null) {
      map['presion_diastolica'] = Variable<double>(presionDiastolica);
    }
    if (!nullToAbsent || presionMedia != null) {
      map['presion_media'] = Variable<double>(presionMedia);
    }
    if (!nullToAbsent || frecuenciaRespiratoria != null) {
      map['frecuencia_respiratoria'] = Variable<double>(frecuenciaRespiratoria);
    }
    if (!nullToAbsent || temperatura != null) {
      map['temperatura'] = Variable<double>(temperatura);
    }
    if (!nullToAbsent || saturacionO2 != null) {
      map['saturacion_o2'] = Variable<double>(saturacionO2);
    }
    if (!nullToAbsent || diuresis != null) {
      map['diuresis'] = Variable<double>(diuresis);
    }
    if (!nullToAbsent || notas != null) {
      map['notas'] = Variable<String>(notas);
    }
    map['invalidado'] = Variable<bool>(invalidado);
    return map;
  }

  SignosVitalesCompanion toCompanion(bool nullToAbsent) {
    return SignosVitalesCompanion(
      id: Value(id),
      pacienteId: Value(pacienteId),
      episodioId: episodioId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodioId),
      timestamp: Value(timestamp),
      frecuenciaCardiaca: frecuenciaCardiaca == null && nullToAbsent
          ? const Value.absent()
          : Value(frecuenciaCardiaca),
      presionSistolica: presionSistolica == null && nullToAbsent
          ? const Value.absent()
          : Value(presionSistolica),
      presionDiastolica: presionDiastolica == null && nullToAbsent
          ? const Value.absent()
          : Value(presionDiastolica),
      presionMedia: presionMedia == null && nullToAbsent
          ? const Value.absent()
          : Value(presionMedia),
      frecuenciaRespiratoria: frecuenciaRespiratoria == null && nullToAbsent
          ? const Value.absent()
          : Value(frecuenciaRespiratoria),
      temperatura: temperatura == null && nullToAbsent
          ? const Value.absent()
          : Value(temperatura),
      saturacionO2: saturacionO2 == null && nullToAbsent
          ? const Value.absent()
          : Value(saturacionO2),
      diuresis: diuresis == null && nullToAbsent
          ? const Value.absent()
          : Value(diuresis),
      notas: notas == null && nullToAbsent
          ? const Value.absent()
          : Value(notas),
      invalidado: Value(invalidado),
    );
  }

  factory SignosVitale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SignosVitale(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      episodioId: serializer.fromJson<int?>(json['episodioId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      frecuenciaCardiaca: serializer.fromJson<double?>(
        json['frecuenciaCardiaca'],
      ),
      presionSistolica: serializer.fromJson<double?>(json['presionSistolica']),
      presionDiastolica: serializer.fromJson<double?>(
        json['presionDiastolica'],
      ),
      presionMedia: serializer.fromJson<double?>(json['presionMedia']),
      frecuenciaRespiratoria: serializer.fromJson<double?>(
        json['frecuenciaRespiratoria'],
      ),
      temperatura: serializer.fromJson<double?>(json['temperatura']),
      saturacionO2: serializer.fromJson<double?>(json['saturacionO2']),
      diuresis: serializer.fromJson<double?>(json['diuresis']),
      notas: serializer.fromJson<String?>(json['notas']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'episodioId': serializer.toJson<int?>(episodioId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'frecuenciaCardiaca': serializer.toJson<double?>(frecuenciaCardiaca),
      'presionSistolica': serializer.toJson<double?>(presionSistolica),
      'presionDiastolica': serializer.toJson<double?>(presionDiastolica),
      'presionMedia': serializer.toJson<double?>(presionMedia),
      'frecuenciaRespiratoria': serializer.toJson<double?>(
        frecuenciaRespiratoria,
      ),
      'temperatura': serializer.toJson<double?>(temperatura),
      'saturacionO2': serializer.toJson<double?>(saturacionO2),
      'diuresis': serializer.toJson<double?>(diuresis),
      'notas': serializer.toJson<String?>(notas),
      'invalidado': serializer.toJson<bool>(invalidado),
    };
  }

  SignosVitale copyWith({
    int? id,
    int? pacienteId,
    Value<int?> episodioId = const Value.absent(),
    DateTime? timestamp,
    Value<double?> frecuenciaCardiaca = const Value.absent(),
    Value<double?> presionSistolica = const Value.absent(),
    Value<double?> presionDiastolica = const Value.absent(),
    Value<double?> presionMedia = const Value.absent(),
    Value<double?> frecuenciaRespiratoria = const Value.absent(),
    Value<double?> temperatura = const Value.absent(),
    Value<double?> saturacionO2 = const Value.absent(),
    Value<double?> diuresis = const Value.absent(),
    Value<String?> notas = const Value.absent(),
    bool? invalidado,
  }) => SignosVitale(
    id: id ?? this.id,
    pacienteId: pacienteId ?? this.pacienteId,
    episodioId: episodioId.present ? episodioId.value : this.episodioId,
    timestamp: timestamp ?? this.timestamp,
    frecuenciaCardiaca: frecuenciaCardiaca.present
        ? frecuenciaCardiaca.value
        : this.frecuenciaCardiaca,
    presionSistolica: presionSistolica.present
        ? presionSistolica.value
        : this.presionSistolica,
    presionDiastolica: presionDiastolica.present
        ? presionDiastolica.value
        : this.presionDiastolica,
    presionMedia: presionMedia.present ? presionMedia.value : this.presionMedia,
    frecuenciaRespiratoria: frecuenciaRespiratoria.present
        ? frecuenciaRespiratoria.value
        : this.frecuenciaRespiratoria,
    temperatura: temperatura.present ? temperatura.value : this.temperatura,
    saturacionO2: saturacionO2.present ? saturacionO2.value : this.saturacionO2,
    diuresis: diuresis.present ? diuresis.value : this.diuresis,
    notas: notas.present ? notas.value : this.notas,
    invalidado: invalidado ?? this.invalidado,
  );
  SignosVitale copyWithCompanion(SignosVitalesCompanion data) {
    return SignosVitale(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      frecuenciaCardiaca: data.frecuenciaCardiaca.present
          ? data.frecuenciaCardiaca.value
          : this.frecuenciaCardiaca,
      presionSistolica: data.presionSistolica.present
          ? data.presionSistolica.value
          : this.presionSistolica,
      presionDiastolica: data.presionDiastolica.present
          ? data.presionDiastolica.value
          : this.presionDiastolica,
      presionMedia: data.presionMedia.present
          ? data.presionMedia.value
          : this.presionMedia,
      frecuenciaRespiratoria: data.frecuenciaRespiratoria.present
          ? data.frecuenciaRespiratoria.value
          : this.frecuenciaRespiratoria,
      temperatura: data.temperatura.present
          ? data.temperatura.value
          : this.temperatura,
      saturacionO2: data.saturacionO2.present
          ? data.saturacionO2.value
          : this.saturacionO2,
      diuresis: data.diuresis.present ? data.diuresis.value : this.diuresis,
      notas: data.notas.present ? data.notas.value : this.notas,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SignosVitale(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('frecuenciaCardiaca: $frecuenciaCardiaca, ')
          ..write('presionSistolica: $presionSistolica, ')
          ..write('presionDiastolica: $presionDiastolica, ')
          ..write('presionMedia: $presionMedia, ')
          ..write('frecuenciaRespiratoria: $frecuenciaRespiratoria, ')
          ..write('temperatura: $temperatura, ')
          ..write('saturacionO2: $saturacionO2, ')
          ..write('diuresis: $diuresis, ')
          ..write('notas: $notas, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pacienteId,
    episodioId,
    timestamp,
    frecuenciaCardiaca,
    presionSistolica,
    presionDiastolica,
    presionMedia,
    frecuenciaRespiratoria,
    temperatura,
    saturacionO2,
    diuresis,
    notas,
    invalidado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignosVitale &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.episodioId == this.episodioId &&
          other.timestamp == this.timestamp &&
          other.frecuenciaCardiaca == this.frecuenciaCardiaca &&
          other.presionSistolica == this.presionSistolica &&
          other.presionDiastolica == this.presionDiastolica &&
          other.presionMedia == this.presionMedia &&
          other.frecuenciaRespiratoria == this.frecuenciaRespiratoria &&
          other.temperatura == this.temperatura &&
          other.saturacionO2 == this.saturacionO2 &&
          other.diuresis == this.diuresis &&
          other.notas == this.notas &&
          other.invalidado == this.invalidado);
}

class SignosVitalesCompanion extends UpdateCompanion<SignosVitale> {
  final Value<int> id;
  final Value<int> pacienteId;
  final Value<int?> episodioId;
  final Value<DateTime> timestamp;
  final Value<double?> frecuenciaCardiaca;
  final Value<double?> presionSistolica;
  final Value<double?> presionDiastolica;
  final Value<double?> presionMedia;
  final Value<double?> frecuenciaRespiratoria;
  final Value<double?> temperatura;
  final Value<double?> saturacionO2;
  final Value<double?> diuresis;
  final Value<String?> notas;
  final Value<bool> invalidado;
  const SignosVitalesCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.frecuenciaCardiaca = const Value.absent(),
    this.presionSistolica = const Value.absent(),
    this.presionDiastolica = const Value.absent(),
    this.presionMedia = const Value.absent(),
    this.frecuenciaRespiratoria = const Value.absent(),
    this.temperatura = const Value.absent(),
    this.saturacionO2 = const Value.absent(),
    this.diuresis = const Value.absent(),
    this.notas = const Value.absent(),
    this.invalidado = const Value.absent(),
  });
  SignosVitalesCompanion.insert({
    this.id = const Value.absent(),
    required int pacienteId,
    this.episodioId = const Value.absent(),
    required DateTime timestamp,
    this.frecuenciaCardiaca = const Value.absent(),
    this.presionSistolica = const Value.absent(),
    this.presionDiastolica = const Value.absent(),
    this.presionMedia = const Value.absent(),
    this.frecuenciaRespiratoria = const Value.absent(),
    this.temperatura = const Value.absent(),
    this.saturacionO2 = const Value.absent(),
    this.diuresis = const Value.absent(),
    this.notas = const Value.absent(),
    this.invalidado = const Value.absent(),
  }) : pacienteId = Value(pacienteId),
       timestamp = Value(timestamp);
  static Insertable<SignosVitale> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<int>? episodioId,
    Expression<DateTime>? timestamp,
    Expression<double>? frecuenciaCardiaca,
    Expression<double>? presionSistolica,
    Expression<double>? presionDiastolica,
    Expression<double>? presionMedia,
    Expression<double>? frecuenciaRespiratoria,
    Expression<double>? temperatura,
    Expression<double>? saturacionO2,
    Expression<double>? diuresis,
    Expression<String>? notas,
    Expression<bool>? invalidado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (episodioId != null) 'episodio_id': episodioId,
      if (timestamp != null) 'timestamp': timestamp,
      if (frecuenciaCardiaca != null) 'frecuencia_cardiaca': frecuenciaCardiaca,
      if (presionSistolica != null) 'presion_sistolica': presionSistolica,
      if (presionDiastolica != null) 'presion_diastolica': presionDiastolica,
      if (presionMedia != null) 'presion_media': presionMedia,
      if (frecuenciaRespiratoria != null)
        'frecuencia_respiratoria': frecuenciaRespiratoria,
      if (temperatura != null) 'temperatura': temperatura,
      if (saturacionO2 != null) 'saturacion_o2': saturacionO2,
      if (diuresis != null) 'diuresis': diuresis,
      if (notas != null) 'notas': notas,
      if (invalidado != null) 'invalidado': invalidado,
    });
  }

  SignosVitalesCompanion copyWith({
    Value<int>? id,
    Value<int>? pacienteId,
    Value<int?>? episodioId,
    Value<DateTime>? timestamp,
    Value<double?>? frecuenciaCardiaca,
    Value<double?>? presionSistolica,
    Value<double?>? presionDiastolica,
    Value<double?>? presionMedia,
    Value<double?>? frecuenciaRespiratoria,
    Value<double?>? temperatura,
    Value<double?>? saturacionO2,
    Value<double?>? diuresis,
    Value<String?>? notas,
    Value<bool>? invalidado,
  }) {
    return SignosVitalesCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      episodioId: episodioId ?? this.episodioId,
      timestamp: timestamp ?? this.timestamp,
      frecuenciaCardiaca: frecuenciaCardiaca ?? this.frecuenciaCardiaca,
      presionSistolica: presionSistolica ?? this.presionSistolica,
      presionDiastolica: presionDiastolica ?? this.presionDiastolica,
      presionMedia: presionMedia ?? this.presionMedia,
      frecuenciaRespiratoria:
          frecuenciaRespiratoria ?? this.frecuenciaRespiratoria,
      temperatura: temperatura ?? this.temperatura,
      saturacionO2: saturacionO2 ?? this.saturacionO2,
      diuresis: diuresis ?? this.diuresis,
      notas: notas ?? this.notas,
      invalidado: invalidado ?? this.invalidado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (frecuenciaCardiaca.present) {
      map['frecuencia_cardiaca'] = Variable<double>(frecuenciaCardiaca.value);
    }
    if (presionSistolica.present) {
      map['presion_sistolica'] = Variable<double>(presionSistolica.value);
    }
    if (presionDiastolica.present) {
      map['presion_diastolica'] = Variable<double>(presionDiastolica.value);
    }
    if (presionMedia.present) {
      map['presion_media'] = Variable<double>(presionMedia.value);
    }
    if (frecuenciaRespiratoria.present) {
      map['frecuencia_respiratoria'] = Variable<double>(
        frecuenciaRespiratoria.value,
      );
    }
    if (temperatura.present) {
      map['temperatura'] = Variable<double>(temperatura.value);
    }
    if (saturacionO2.present) {
      map['saturacion_o2'] = Variable<double>(saturacionO2.value);
    }
    if (diuresis.present) {
      map['diuresis'] = Variable<double>(diuresis.value);
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignosVitalesCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('frecuenciaCardiaca: $frecuenciaCardiaca, ')
          ..write('presionSistolica: $presionSistolica, ')
          ..write('presionDiastolica: $presionDiastolica, ')
          ..write('presionMedia: $presionMedia, ')
          ..write('frecuenciaRespiratoria: $frecuenciaRespiratoria, ')
          ..write('temperatura: $temperatura, ')
          ..write('saturacionO2: $saturacionO2, ')
          ..write('diuresis: $diuresis, ')
          ..write('notas: $notas, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }
}

class $ParametrosClinicosTable extends ParametrosClinicos
    with TableInfo<$ParametrosClinicosTable, ParametrosClinico> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParametrosClinicosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<String> codigo = GeneratedColumn<String>(
    'codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreEsMeta = const VerificationMeta(
    'nombreEs',
  );
  @override
  late final GeneratedColumn<String> nombreEs = GeneratedColumn<String>(
    'nombre_es',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreEnMeta = const VerificationMeta(
    'nombreEn',
  );
  @override
  late final GeneratedColumn<String> nombreEn = GeneratedColumn<String>(
    'nombre_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreFrMeta = const VerificationMeta(
    'nombreFr',
  );
  @override
  late final GeneratedColumn<String> nombreFr = GeneratedColumn<String>(
    'nombre_fr',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unidadCanonicaMeta = const VerificationMeta(
    'unidadCanonica',
  );
  @override
  late final GeneratedColumn<String> unidadCanonica = GeneratedColumn<String>(
    'unidad_canonica',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rangoMinMeta = const VerificationMeta(
    'rangoMin',
  );
  @override
  late final GeneratedColumn<double> rangoMin = GeneratedColumn<double>(
    'rango_min',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rangoMaxMeta = const VerificationMeta(
    'rangoMax',
  );
  @override
  late final GeneratedColumn<double> rangoMax = GeneratedColumn<double>(
    'rango_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _decimalesMeta = const VerificationMeta(
    'decimales',
  );
  @override
  late final GeneratedColumn<int> decimales = GeneratedColumn<int>(
    'decimales',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(2),
  );
  @override
  List<GeneratedColumn> get $columns => [
    codigo,
    nombreEs,
    nombreEn,
    nombreFr,
    categoria,
    unidadCanonica,
    rangoMin,
    rangoMax,
    decimales,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parametros_clinicos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParametrosClinico> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(
        _codigoMeta,
        codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta),
      );
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('nombre_es')) {
      context.handle(
        _nombreEsMeta,
        nombreEs.isAcceptableOrUnknown(data['nombre_es']!, _nombreEsMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreEsMeta);
    }
    if (data.containsKey('nombre_en')) {
      context.handle(
        _nombreEnMeta,
        nombreEn.isAcceptableOrUnknown(data['nombre_en']!, _nombreEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreEnMeta);
    }
    if (data.containsKey('nombre_fr')) {
      context.handle(
        _nombreFrMeta,
        nombreFr.isAcceptableOrUnknown(data['nombre_fr']!, _nombreFrMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreFrMeta);
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    if (data.containsKey('unidad_canonica')) {
      context.handle(
        _unidadCanonicaMeta,
        unidadCanonica.isAcceptableOrUnknown(
          data['unidad_canonica']!,
          _unidadCanonicaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unidadCanonicaMeta);
    }
    if (data.containsKey('rango_min')) {
      context.handle(
        _rangoMinMeta,
        rangoMin.isAcceptableOrUnknown(data['rango_min']!, _rangoMinMeta),
      );
    }
    if (data.containsKey('rango_max')) {
      context.handle(
        _rangoMaxMeta,
        rangoMax.isAcceptableOrUnknown(data['rango_max']!, _rangoMaxMeta),
      );
    }
    if (data.containsKey('decimales')) {
      context.handle(
        _decimalesMeta,
        decimales.isAcceptableOrUnknown(data['decimales']!, _decimalesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  ParametrosClinico map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParametrosClinico(
      codigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codigo'],
      )!,
      nombreEs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_es'],
      )!,
      nombreEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_en'],
      )!,
      nombreFr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_fr'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      unidadCanonica: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unidad_canonica'],
      )!,
      rangoMin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rango_min'],
      ),
      rangoMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rango_max'],
      ),
      decimales: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}decimales'],
      )!,
    );
  }

  @override
  $ParametrosClinicosTable createAlias(String alias) {
    return $ParametrosClinicosTable(attachedDatabase, alias);
  }
}

class ParametrosClinico extends DataClass
    implements Insertable<ParametrosClinico> {
  final String codigo;
  final String nombreEs;
  final String nombreEn;
  final String nombreFr;
  final String categoria;
  final String unidadCanonica;
  final double? rangoMin;
  final double? rangoMax;
  final int decimales;
  const ParametrosClinico({
    required this.codigo,
    required this.nombreEs,
    required this.nombreEn,
    required this.nombreFr,
    required this.categoria,
    required this.unidadCanonica,
    this.rangoMin,
    this.rangoMax,
    required this.decimales,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<String>(codigo);
    map['nombre_es'] = Variable<String>(nombreEs);
    map['nombre_en'] = Variable<String>(nombreEn);
    map['nombre_fr'] = Variable<String>(nombreFr);
    map['categoria'] = Variable<String>(categoria);
    map['unidad_canonica'] = Variable<String>(unidadCanonica);
    if (!nullToAbsent || rangoMin != null) {
      map['rango_min'] = Variable<double>(rangoMin);
    }
    if (!nullToAbsent || rangoMax != null) {
      map['rango_max'] = Variable<double>(rangoMax);
    }
    map['decimales'] = Variable<int>(decimales);
    return map;
  }

  ParametrosClinicosCompanion toCompanion(bool nullToAbsent) {
    return ParametrosClinicosCompanion(
      codigo: Value(codigo),
      nombreEs: Value(nombreEs),
      nombreEn: Value(nombreEn),
      nombreFr: Value(nombreFr),
      categoria: Value(categoria),
      unidadCanonica: Value(unidadCanonica),
      rangoMin: rangoMin == null && nullToAbsent
          ? const Value.absent()
          : Value(rangoMin),
      rangoMax: rangoMax == null && nullToAbsent
          ? const Value.absent()
          : Value(rangoMax),
      decimales: Value(decimales),
    );
  }

  factory ParametrosClinico.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParametrosClinico(
      codigo: serializer.fromJson<String>(json['codigo']),
      nombreEs: serializer.fromJson<String>(json['nombreEs']),
      nombreEn: serializer.fromJson<String>(json['nombreEn']),
      nombreFr: serializer.fromJson<String>(json['nombreFr']),
      categoria: serializer.fromJson<String>(json['categoria']),
      unidadCanonica: serializer.fromJson<String>(json['unidadCanonica']),
      rangoMin: serializer.fromJson<double?>(json['rangoMin']),
      rangoMax: serializer.fromJson<double?>(json['rangoMax']),
      decimales: serializer.fromJson<int>(json['decimales']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<String>(codigo),
      'nombreEs': serializer.toJson<String>(nombreEs),
      'nombreEn': serializer.toJson<String>(nombreEn),
      'nombreFr': serializer.toJson<String>(nombreFr),
      'categoria': serializer.toJson<String>(categoria),
      'unidadCanonica': serializer.toJson<String>(unidadCanonica),
      'rangoMin': serializer.toJson<double?>(rangoMin),
      'rangoMax': serializer.toJson<double?>(rangoMax),
      'decimales': serializer.toJson<int>(decimales),
    };
  }

  ParametrosClinico copyWith({
    String? codigo,
    String? nombreEs,
    String? nombreEn,
    String? nombreFr,
    String? categoria,
    String? unidadCanonica,
    Value<double?> rangoMin = const Value.absent(),
    Value<double?> rangoMax = const Value.absent(),
    int? decimales,
  }) => ParametrosClinico(
    codigo: codigo ?? this.codigo,
    nombreEs: nombreEs ?? this.nombreEs,
    nombreEn: nombreEn ?? this.nombreEn,
    nombreFr: nombreFr ?? this.nombreFr,
    categoria: categoria ?? this.categoria,
    unidadCanonica: unidadCanonica ?? this.unidadCanonica,
    rangoMin: rangoMin.present ? rangoMin.value : this.rangoMin,
    rangoMax: rangoMax.present ? rangoMax.value : this.rangoMax,
    decimales: decimales ?? this.decimales,
  );
  ParametrosClinico copyWithCompanion(ParametrosClinicosCompanion data) {
    return ParametrosClinico(
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      nombreEs: data.nombreEs.present ? data.nombreEs.value : this.nombreEs,
      nombreEn: data.nombreEn.present ? data.nombreEn.value : this.nombreEn,
      nombreFr: data.nombreFr.present ? data.nombreFr.value : this.nombreFr,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      unidadCanonica: data.unidadCanonica.present
          ? data.unidadCanonica.value
          : this.unidadCanonica,
      rangoMin: data.rangoMin.present ? data.rangoMin.value : this.rangoMin,
      rangoMax: data.rangoMax.present ? data.rangoMax.value : this.rangoMax,
      decimales: data.decimales.present ? data.decimales.value : this.decimales,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParametrosClinico(')
          ..write('codigo: $codigo, ')
          ..write('nombreEs: $nombreEs, ')
          ..write('nombreEn: $nombreEn, ')
          ..write('nombreFr: $nombreFr, ')
          ..write('categoria: $categoria, ')
          ..write('unidadCanonica: $unidadCanonica, ')
          ..write('rangoMin: $rangoMin, ')
          ..write('rangoMax: $rangoMax, ')
          ..write('decimales: $decimales')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    codigo,
    nombreEs,
    nombreEn,
    nombreFr,
    categoria,
    unidadCanonica,
    rangoMin,
    rangoMax,
    decimales,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParametrosClinico &&
          other.codigo == this.codigo &&
          other.nombreEs == this.nombreEs &&
          other.nombreEn == this.nombreEn &&
          other.nombreFr == this.nombreFr &&
          other.categoria == this.categoria &&
          other.unidadCanonica == this.unidadCanonica &&
          other.rangoMin == this.rangoMin &&
          other.rangoMax == this.rangoMax &&
          other.decimales == this.decimales);
}

class ParametrosClinicosCompanion extends UpdateCompanion<ParametrosClinico> {
  final Value<String> codigo;
  final Value<String> nombreEs;
  final Value<String> nombreEn;
  final Value<String> nombreFr;
  final Value<String> categoria;
  final Value<String> unidadCanonica;
  final Value<double?> rangoMin;
  final Value<double?> rangoMax;
  final Value<int> decimales;
  final Value<int> rowid;
  const ParametrosClinicosCompanion({
    this.codigo = const Value.absent(),
    this.nombreEs = const Value.absent(),
    this.nombreEn = const Value.absent(),
    this.nombreFr = const Value.absent(),
    this.categoria = const Value.absent(),
    this.unidadCanonica = const Value.absent(),
    this.rangoMin = const Value.absent(),
    this.rangoMax = const Value.absent(),
    this.decimales = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParametrosClinicosCompanion.insert({
    required String codigo,
    required String nombreEs,
    required String nombreEn,
    required String nombreFr,
    required String categoria,
    required String unidadCanonica,
    this.rangoMin = const Value.absent(),
    this.rangoMax = const Value.absent(),
    this.decimales = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : codigo = Value(codigo),
       nombreEs = Value(nombreEs),
       nombreEn = Value(nombreEn),
       nombreFr = Value(nombreFr),
       categoria = Value(categoria),
       unidadCanonica = Value(unidadCanonica);
  static Insertable<ParametrosClinico> custom({
    Expression<String>? codigo,
    Expression<String>? nombreEs,
    Expression<String>? nombreEn,
    Expression<String>? nombreFr,
    Expression<String>? categoria,
    Expression<String>? unidadCanonica,
    Expression<double>? rangoMin,
    Expression<double>? rangoMax,
    Expression<int>? decimales,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nombreEs != null) 'nombre_es': nombreEs,
      if (nombreEn != null) 'nombre_en': nombreEn,
      if (nombreFr != null) 'nombre_fr': nombreFr,
      if (categoria != null) 'categoria': categoria,
      if (unidadCanonica != null) 'unidad_canonica': unidadCanonica,
      if (rangoMin != null) 'rango_min': rangoMin,
      if (rangoMax != null) 'rango_max': rangoMax,
      if (decimales != null) 'decimales': decimales,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParametrosClinicosCompanion copyWith({
    Value<String>? codigo,
    Value<String>? nombreEs,
    Value<String>? nombreEn,
    Value<String>? nombreFr,
    Value<String>? categoria,
    Value<String>? unidadCanonica,
    Value<double?>? rangoMin,
    Value<double?>? rangoMax,
    Value<int>? decimales,
    Value<int>? rowid,
  }) {
    return ParametrosClinicosCompanion(
      codigo: codigo ?? this.codigo,
      nombreEs: nombreEs ?? this.nombreEs,
      nombreEn: nombreEn ?? this.nombreEn,
      nombreFr: nombreFr ?? this.nombreFr,
      categoria: categoria ?? this.categoria,
      unidadCanonica: unidadCanonica ?? this.unidadCanonica,
      rangoMin: rangoMin ?? this.rangoMin,
      rangoMax: rangoMax ?? this.rangoMax,
      decimales: decimales ?? this.decimales,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (nombreEs.present) {
      map['nombre_es'] = Variable<String>(nombreEs.value);
    }
    if (nombreEn.present) {
      map['nombre_en'] = Variable<String>(nombreEn.value);
    }
    if (nombreFr.present) {
      map['nombre_fr'] = Variable<String>(nombreFr.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (unidadCanonica.present) {
      map['unidad_canonica'] = Variable<String>(unidadCanonica.value);
    }
    if (rangoMin.present) {
      map['rango_min'] = Variable<double>(rangoMin.value);
    }
    if (rangoMax.present) {
      map['rango_max'] = Variable<double>(rangoMax.value);
    }
    if (decimales.present) {
      map['decimales'] = Variable<int>(decimales.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametrosClinicosCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nombreEs: $nombreEs, ')
          ..write('nombreEn: $nombreEn, ')
          ..write('nombreFr: $nombreFr, ')
          ..write('categoria: $categoria, ')
          ..write('unidadCanonica: $unidadCanonica, ')
          ..write('rangoMin: $rangoMin, ')
          ..write('rangoMax: $rangoMax, ')
          ..write('decimales: $decimales, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CatalogoMetaTable extends CatalogoMeta
    with TableInfo<$CatalogoMetaTable, CatalogoMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatalogoMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seededAtMeta = const VerificationMeta(
    'seededAt',
  );
  @override
  late final GeneratedColumn<DateTime> seededAt = GeneratedColumn<DateTime>(
    'seeded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, version, seededAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catalogo_meta';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatalogoMetaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('seeded_at')) {
      context.handle(
        _seededAtMeta,
        seededAt.isAcceptableOrUnknown(data['seeded_at']!, _seededAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatalogoMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatalogoMetaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      seededAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}seeded_at'],
      )!,
    );
  }

  @override
  $CatalogoMetaTable createAlias(String alias) {
    return $CatalogoMetaTable(attachedDatabase, alias);
  }
}

class CatalogoMetaData extends DataClass
    implements Insertable<CatalogoMetaData> {
  final int id;
  final int version;
  final DateTime seededAt;
  const CatalogoMetaData({
    required this.id,
    required this.version,
    required this.seededAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<int>(version);
    map['seeded_at'] = Variable<DateTime>(seededAt);
    return map;
  }

  CatalogoMetaCompanion toCompanion(bool nullToAbsent) {
    return CatalogoMetaCompanion(
      id: Value(id),
      version: Value(version),
      seededAt: Value(seededAt),
    );
  }

  factory CatalogoMetaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatalogoMetaData(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<int>(json['version']),
      seededAt: serializer.fromJson<DateTime>(json['seededAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<int>(version),
      'seededAt': serializer.toJson<DateTime>(seededAt),
    };
  }

  CatalogoMetaData copyWith({int? id, int? version, DateTime? seededAt}) =>
      CatalogoMetaData(
        id: id ?? this.id,
        version: version ?? this.version,
        seededAt: seededAt ?? this.seededAt,
      );
  CatalogoMetaData copyWithCompanion(CatalogoMetaCompanion data) {
    return CatalogoMetaData(
      id: data.id.present ? data.id.value : this.id,
      version: data.version.present ? data.version.value : this.version,
      seededAt: data.seededAt.present ? data.seededAt.value : this.seededAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatalogoMetaData(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('seededAt: $seededAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version, seededAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatalogoMetaData &&
          other.id == this.id &&
          other.version == this.version &&
          other.seededAt == this.seededAt);
}

class CatalogoMetaCompanion extends UpdateCompanion<CatalogoMetaData> {
  final Value<int> id;
  final Value<int> version;
  final Value<DateTime> seededAt;
  const CatalogoMetaCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
    this.seededAt = const Value.absent(),
  });
  CatalogoMetaCompanion.insert({
    this.id = const Value.absent(),
    required int version,
    this.seededAt = const Value.absent(),
  }) : version = Value(version);
  static Insertable<CatalogoMetaData> custom({
    Expression<int>? id,
    Expression<int>? version,
    Expression<DateTime>? seededAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
      if (seededAt != null) 'seeded_at': seededAt,
    });
  }

  CatalogoMetaCompanion copyWith({
    Value<int>? id,
    Value<int>? version,
    Value<DateTime>? seededAt,
  }) {
    return CatalogoMetaCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
      seededAt: seededAt ?? this.seededAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (seededAt.present) {
      map['seeded_at'] = Variable<DateTime>(seededAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatalogoMetaCompanion(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('seededAt: $seededAt')
          ..write(')'))
        .toString();
  }
}

class $UnidadesMedidaTable extends UnidadesMedida
    with TableInfo<$UnidadesMedidaTable, UnidadesMedidaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnidadesMedidaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _parametroCodigoMeta = const VerificationMeta(
    'parametroCodigo',
  );
  @override
  late final GeneratedColumn<String> parametroCodigo = GeneratedColumn<String>(
    'parametro_codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parametros_clinicos (codigo) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _unidadMeta = const VerificationMeta('unidad');
  @override
  late final GeneratedColumn<String> unidad = GeneratedColumn<String>(
    'unidad',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factorACanonicaMeta = const VerificationMeta(
    'factorACanonica',
  );
  @override
  late final GeneratedColumn<double> factorACanonica = GeneratedColumn<double>(
    'factor_a_canonica',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _offsetMeta = const VerificationMeta('offset');
  @override
  late final GeneratedColumn<double> offset = GeneratedColumn<double>(
    'offset',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parametroCodigo,
    unidad,
    factorACanonica,
    offset,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unidades_medida';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnidadesMedidaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parametro_codigo')) {
      context.handle(
        _parametroCodigoMeta,
        parametroCodigo.isAcceptableOrUnknown(
          data['parametro_codigo']!,
          _parametroCodigoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parametroCodigoMeta);
    }
    if (data.containsKey('unidad')) {
      context.handle(
        _unidadMeta,
        unidad.isAcceptableOrUnknown(data['unidad']!, _unidadMeta),
      );
    } else if (isInserting) {
      context.missing(_unidadMeta);
    }
    if (data.containsKey('factor_a_canonica')) {
      context.handle(
        _factorACanonicaMeta,
        factorACanonica.isAcceptableOrUnknown(
          data['factor_a_canonica']!,
          _factorACanonicaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_factorACanonicaMeta);
    }
    if (data.containsKey('offset')) {
      context.handle(
        _offsetMeta,
        offset.isAcceptableOrUnknown(data['offset']!, _offsetMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnidadesMedidaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnidadesMedidaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parametroCodigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parametro_codigo'],
      )!,
      unidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unidad'],
      )!,
      factorACanonica: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}factor_a_canonica'],
      )!,
      offset: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}offset'],
      )!,
    );
  }

  @override
  $UnidadesMedidaTable createAlias(String alias) {
    return $UnidadesMedidaTable(attachedDatabase, alias);
  }
}

class UnidadesMedidaData extends DataClass
    implements Insertable<UnidadesMedidaData> {
  final int id;
  final String parametroCodigo;
  final String unidad;
  final double factorACanonica;
  final double offset;
  const UnidadesMedidaData({
    required this.id,
    required this.parametroCodigo,
    required this.unidad,
    required this.factorACanonica,
    required this.offset,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['parametro_codigo'] = Variable<String>(parametroCodigo);
    map['unidad'] = Variable<String>(unidad);
    map['factor_a_canonica'] = Variable<double>(factorACanonica);
    map['offset'] = Variable<double>(offset);
    return map;
  }

  UnidadesMedidaCompanion toCompanion(bool nullToAbsent) {
    return UnidadesMedidaCompanion(
      id: Value(id),
      parametroCodigo: Value(parametroCodigo),
      unidad: Value(unidad),
      factorACanonica: Value(factorACanonica),
      offset: Value(offset),
    );
  }

  factory UnidadesMedidaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnidadesMedidaData(
      id: serializer.fromJson<int>(json['id']),
      parametroCodigo: serializer.fromJson<String>(json['parametroCodigo']),
      unidad: serializer.fromJson<String>(json['unidad']),
      factorACanonica: serializer.fromJson<double>(json['factorACanonica']),
      offset: serializer.fromJson<double>(json['offset']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parametroCodigo': serializer.toJson<String>(parametroCodigo),
      'unidad': serializer.toJson<String>(unidad),
      'factorACanonica': serializer.toJson<double>(factorACanonica),
      'offset': serializer.toJson<double>(offset),
    };
  }

  UnidadesMedidaData copyWith({
    int? id,
    String? parametroCodigo,
    String? unidad,
    double? factorACanonica,
    double? offset,
  }) => UnidadesMedidaData(
    id: id ?? this.id,
    parametroCodigo: parametroCodigo ?? this.parametroCodigo,
    unidad: unidad ?? this.unidad,
    factorACanonica: factorACanonica ?? this.factorACanonica,
    offset: offset ?? this.offset,
  );
  UnidadesMedidaData copyWithCompanion(UnidadesMedidaCompanion data) {
    return UnidadesMedidaData(
      id: data.id.present ? data.id.value : this.id,
      parametroCodigo: data.parametroCodigo.present
          ? data.parametroCodigo.value
          : this.parametroCodigo,
      unidad: data.unidad.present ? data.unidad.value : this.unidad,
      factorACanonica: data.factorACanonica.present
          ? data.factorACanonica.value
          : this.factorACanonica,
      offset: data.offset.present ? data.offset.value : this.offset,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnidadesMedidaData(')
          ..write('id: $id, ')
          ..write('parametroCodigo: $parametroCodigo, ')
          ..write('unidad: $unidad, ')
          ..write('factorACanonica: $factorACanonica, ')
          ..write('offset: $offset')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, parametroCodigo, unidad, factorACanonica, offset);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnidadesMedidaData &&
          other.id == this.id &&
          other.parametroCodigo == this.parametroCodigo &&
          other.unidad == this.unidad &&
          other.factorACanonica == this.factorACanonica &&
          other.offset == this.offset);
}

class UnidadesMedidaCompanion extends UpdateCompanion<UnidadesMedidaData> {
  final Value<int> id;
  final Value<String> parametroCodigo;
  final Value<String> unidad;
  final Value<double> factorACanonica;
  final Value<double> offset;
  const UnidadesMedidaCompanion({
    this.id = const Value.absent(),
    this.parametroCodigo = const Value.absent(),
    this.unidad = const Value.absent(),
    this.factorACanonica = const Value.absent(),
    this.offset = const Value.absent(),
  });
  UnidadesMedidaCompanion.insert({
    this.id = const Value.absent(),
    required String parametroCodigo,
    required String unidad,
    required double factorACanonica,
    this.offset = const Value.absent(),
  }) : parametroCodigo = Value(parametroCodigo),
       unidad = Value(unidad),
       factorACanonica = Value(factorACanonica);
  static Insertable<UnidadesMedidaData> custom({
    Expression<int>? id,
    Expression<String>? parametroCodigo,
    Expression<String>? unidad,
    Expression<double>? factorACanonica,
    Expression<double>? offset,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parametroCodigo != null) 'parametro_codigo': parametroCodigo,
      if (unidad != null) 'unidad': unidad,
      if (factorACanonica != null) 'factor_a_canonica': factorACanonica,
      if (offset != null) 'offset': offset,
    });
  }

  UnidadesMedidaCompanion copyWith({
    Value<int>? id,
    Value<String>? parametroCodigo,
    Value<String>? unidad,
    Value<double>? factorACanonica,
    Value<double>? offset,
  }) {
    return UnidadesMedidaCompanion(
      id: id ?? this.id,
      parametroCodigo: parametroCodigo ?? this.parametroCodigo,
      unidad: unidad ?? this.unidad,
      factorACanonica: factorACanonica ?? this.factorACanonica,
      offset: offset ?? this.offset,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parametroCodigo.present) {
      map['parametro_codigo'] = Variable<String>(parametroCodigo.value);
    }
    if (unidad.present) {
      map['unidad'] = Variable<String>(unidad.value);
    }
    if (factorACanonica.present) {
      map['factor_a_canonica'] = Variable<double>(factorACanonica.value);
    }
    if (offset.present) {
      map['offset'] = Variable<double>(offset.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnidadesMedidaCompanion(')
          ..write('id: $id, ')
          ..write('parametroCodigo: $parametroCodigo, ')
          ..write('unidad: $unidad, ')
          ..write('factorACanonica: $factorACanonica, ')
          ..write('offset: $offset')
          ..write(')'))
        .toString();
  }
}

class $LaboratoriosTable extends Laboratorios
    with TableInfo<$LaboratoriosTable, Laboratorio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LaboratoriosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _parametroCodigoMeta = const VerificationMeta(
    'parametroCodigo',
  );
  @override
  late final GeneratedColumn<String> parametroCodigo = GeneratedColumn<String>(
    'parametro_codigo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parametros_clinicos (codigo)',
    ),
  );
  static const VerificationMeta _valorOriginalMeta = const VerificationMeta(
    'valorOriginal',
  );
  @override
  late final GeneratedColumn<double> valorOriginal = GeneratedColumn<double>(
    'valor_original',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unidadOriginalMeta = const VerificationMeta(
    'unidadOriginal',
  );
  @override
  late final GeneratedColumn<String> unidadOriginal = GeneratedColumn<String>(
    'unidad_original',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorCanonicoMgDlMeta = const VerificationMeta(
    'valorCanonicoMgDl',
  );
  @override
  late final GeneratedColumn<double> valorCanonicoMgDl =
      GeneratedColumn<double>(
        'valor_canonico_mg_dl',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fechaHoraMeta = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fuenteMeta = const VerificationMeta('fuente');
  @override
  late final GeneratedColumn<String> fuente = GeneratedColumn<String>(
    'fuente',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
    'notas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    episodioId,
    parametroCodigo,
    valorOriginal,
    unidadOriginal,
    valorCanonicoMgDl,
    fechaHora,
    fuente,
    invalidado,
    notas,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'laboratorios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Laboratorio> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    }
    if (data.containsKey('parametro_codigo')) {
      context.handle(
        _parametroCodigoMeta,
        parametroCodigo.isAcceptableOrUnknown(
          data['parametro_codigo']!,
          _parametroCodigoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parametroCodigoMeta);
    }
    if (data.containsKey('valor_original')) {
      context.handle(
        _valorOriginalMeta,
        valorOriginal.isAcceptableOrUnknown(
          data['valor_original']!,
          _valorOriginalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorOriginalMeta);
    }
    if (data.containsKey('unidad_original')) {
      context.handle(
        _unidadOriginalMeta,
        unidadOriginal.isAcceptableOrUnknown(
          data['unidad_original']!,
          _unidadOriginalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unidadOriginalMeta);
    }
    if (data.containsKey('valor_canonico_mg_dl')) {
      context.handle(
        _valorCanonicoMgDlMeta,
        valorCanonicoMgDl.isAcceptableOrUnknown(
          data['valor_canonico_mg_dl']!,
          _valorCanonicoMgDlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_valorCanonicoMgDlMeta);
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _fechaHoraMeta,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _fechaHoraMeta),
      );
    } else if (isInserting) {
      context.missing(_fechaHoraMeta);
    }
    if (data.containsKey('fuente')) {
      context.handle(
        _fuenteMeta,
        fuente.isAcceptableOrUnknown(data['fuente']!, _fuenteMeta),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    if (data.containsKey('notas')) {
      context.handle(
        _notasMeta,
        notas.isAcceptableOrUnknown(data['notas']!, _notasMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Laboratorio map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Laboratorio(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      ),
      parametroCodigo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parametro_codigo'],
      )!,
      valorOriginal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_original'],
      )!,
      unidadOriginal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unidad_original'],
      )!,
      valorCanonicoMgDl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}valor_canonico_mg_dl'],
      )!,
      fechaHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
      fuente: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fuente'],
      )!,
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
      notas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notas'],
      ),
    );
  }

  @override
  $LaboratoriosTable createAlias(String alias) {
    return $LaboratoriosTable(attachedDatabase, alias);
  }
}

class Laboratorio extends DataClass implements Insertable<Laboratorio> {
  final int id;
  final int pacienteId;
  final int? episodioId;
  final String parametroCodigo;
  final double valorOriginal;
  final String unidadOriginal;
  final double valorCanonicoMgDl;
  final DateTime fechaHora;
  final String fuente;
  final bool invalidado;
  final String? notas;
  const Laboratorio({
    required this.id,
    required this.pacienteId,
    this.episodioId,
    required this.parametroCodigo,
    required this.valorOriginal,
    required this.unidadOriginal,
    required this.valorCanonicoMgDl,
    required this.fechaHora,
    required this.fuente,
    required this.invalidado,
    this.notas,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || episodioId != null) {
      map['episodio_id'] = Variable<int>(episodioId);
    }
    map['parametro_codigo'] = Variable<String>(parametroCodigo);
    map['valor_original'] = Variable<double>(valorOriginal);
    map['unidad_original'] = Variable<String>(unidadOriginal);
    map['valor_canonico_mg_dl'] = Variable<double>(valorCanonicoMgDl);
    map['fecha_hora'] = Variable<DateTime>(fechaHora);
    map['fuente'] = Variable<String>(fuente);
    map['invalidado'] = Variable<bool>(invalidado);
    if (!nullToAbsent || notas != null) {
      map['notas'] = Variable<String>(notas);
    }
    return map;
  }

  LaboratoriosCompanion toCompanion(bool nullToAbsent) {
    return LaboratoriosCompanion(
      id: Value(id),
      pacienteId: Value(pacienteId),
      episodioId: episodioId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodioId),
      parametroCodigo: Value(parametroCodigo),
      valorOriginal: Value(valorOriginal),
      unidadOriginal: Value(unidadOriginal),
      valorCanonicoMgDl: Value(valorCanonicoMgDl),
      fechaHora: Value(fechaHora),
      fuente: Value(fuente),
      invalidado: Value(invalidado),
      notas: notas == null && nullToAbsent
          ? const Value.absent()
          : Value(notas),
    );
  }

  factory Laboratorio.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Laboratorio(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      episodioId: serializer.fromJson<int?>(json['episodioId']),
      parametroCodigo: serializer.fromJson<String>(json['parametroCodigo']),
      valorOriginal: serializer.fromJson<double>(json['valorOriginal']),
      unidadOriginal: serializer.fromJson<String>(json['unidadOriginal']),
      valorCanonicoMgDl: serializer.fromJson<double>(json['valorCanonicoMgDl']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
      fuente: serializer.fromJson<String>(json['fuente']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
      notas: serializer.fromJson<String?>(json['notas']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'episodioId': serializer.toJson<int?>(episodioId),
      'parametroCodigo': serializer.toJson<String>(parametroCodigo),
      'valorOriginal': serializer.toJson<double>(valorOriginal),
      'unidadOriginal': serializer.toJson<String>(unidadOriginal),
      'valorCanonicoMgDl': serializer.toJson<double>(valorCanonicoMgDl),
      'fechaHora': serializer.toJson<DateTime>(fechaHora),
      'fuente': serializer.toJson<String>(fuente),
      'invalidado': serializer.toJson<bool>(invalidado),
      'notas': serializer.toJson<String?>(notas),
    };
  }

  Laboratorio copyWith({
    int? id,
    int? pacienteId,
    Value<int?> episodioId = const Value.absent(),
    String? parametroCodigo,
    double? valorOriginal,
    String? unidadOriginal,
    double? valorCanonicoMgDl,
    DateTime? fechaHora,
    String? fuente,
    bool? invalidado,
    Value<String?> notas = const Value.absent(),
  }) => Laboratorio(
    id: id ?? this.id,
    pacienteId: pacienteId ?? this.pacienteId,
    episodioId: episodioId.present ? episodioId.value : this.episodioId,
    parametroCodigo: parametroCodigo ?? this.parametroCodigo,
    valorOriginal: valorOriginal ?? this.valorOriginal,
    unidadOriginal: unidadOriginal ?? this.unidadOriginal,
    valorCanonicoMgDl: valorCanonicoMgDl ?? this.valorCanonicoMgDl,
    fechaHora: fechaHora ?? this.fechaHora,
    fuente: fuente ?? this.fuente,
    invalidado: invalidado ?? this.invalidado,
    notas: notas.present ? notas.value : this.notas,
  );
  Laboratorio copyWithCompanion(LaboratoriosCompanion data) {
    return Laboratorio(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      parametroCodigo: data.parametroCodigo.present
          ? data.parametroCodigo.value
          : this.parametroCodigo,
      valorOriginal: data.valorOriginal.present
          ? data.valorOriginal.value
          : this.valorOriginal,
      unidadOriginal: data.unidadOriginal.present
          ? data.unidadOriginal.value
          : this.unidadOriginal,
      valorCanonicoMgDl: data.valorCanonicoMgDl.present
          ? data.valorCanonicoMgDl.value
          : this.valorCanonicoMgDl,
      fechaHora: data.fechaHora.present ? data.fechaHora.value : this.fechaHora,
      fuente: data.fuente.present ? data.fuente.value : this.fuente,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
      notas: data.notas.present ? data.notas.value : this.notas,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Laboratorio(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('parametroCodigo: $parametroCodigo, ')
          ..write('valorOriginal: $valorOriginal, ')
          ..write('unidadOriginal: $unidadOriginal, ')
          ..write('valorCanonicoMgDl: $valorCanonicoMgDl, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('fuente: $fuente, ')
          ..write('invalidado: $invalidado, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pacienteId,
    episodioId,
    parametroCodigo,
    valorOriginal,
    unidadOriginal,
    valorCanonicoMgDl,
    fechaHora,
    fuente,
    invalidado,
    notas,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Laboratorio &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.episodioId == this.episodioId &&
          other.parametroCodigo == this.parametroCodigo &&
          other.valorOriginal == this.valorOriginal &&
          other.unidadOriginal == this.unidadOriginal &&
          other.valorCanonicoMgDl == this.valorCanonicoMgDl &&
          other.fechaHora == this.fechaHora &&
          other.fuente == this.fuente &&
          other.invalidado == this.invalidado &&
          other.notas == this.notas);
}

class LaboratoriosCompanion extends UpdateCompanion<Laboratorio> {
  final Value<int> id;
  final Value<int> pacienteId;
  final Value<int?> episodioId;
  final Value<String> parametroCodigo;
  final Value<double> valorOriginal;
  final Value<String> unidadOriginal;
  final Value<double> valorCanonicoMgDl;
  final Value<DateTime> fechaHora;
  final Value<String> fuente;
  final Value<bool> invalidado;
  final Value<String?> notas;
  const LaboratoriosCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.parametroCodigo = const Value.absent(),
    this.valorOriginal = const Value.absent(),
    this.unidadOriginal = const Value.absent(),
    this.valorCanonicoMgDl = const Value.absent(),
    this.fechaHora = const Value.absent(),
    this.fuente = const Value.absent(),
    this.invalidado = const Value.absent(),
    this.notas = const Value.absent(),
  });
  LaboratoriosCompanion.insert({
    this.id = const Value.absent(),
    required int pacienteId,
    this.episodioId = const Value.absent(),
    required String parametroCodigo,
    required double valorOriginal,
    required String unidadOriginal,
    required double valorCanonicoMgDl,
    required DateTime fechaHora,
    this.fuente = const Value.absent(),
    this.invalidado = const Value.absent(),
    this.notas = const Value.absent(),
  }) : pacienteId = Value(pacienteId),
       parametroCodigo = Value(parametroCodigo),
       valorOriginal = Value(valorOriginal),
       unidadOriginal = Value(unidadOriginal),
       valorCanonicoMgDl = Value(valorCanonicoMgDl),
       fechaHora = Value(fechaHora);
  static Insertable<Laboratorio> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<int>? episodioId,
    Expression<String>? parametroCodigo,
    Expression<double>? valorOriginal,
    Expression<String>? unidadOriginal,
    Expression<double>? valorCanonicoMgDl,
    Expression<DateTime>? fechaHora,
    Expression<String>? fuente,
    Expression<bool>? invalidado,
    Expression<String>? notas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (episodioId != null) 'episodio_id': episodioId,
      if (parametroCodigo != null) 'parametro_codigo': parametroCodigo,
      if (valorOriginal != null) 'valor_original': valorOriginal,
      if (unidadOriginal != null) 'unidad_original': unidadOriginal,
      if (valorCanonicoMgDl != null) 'valor_canonico_mg_dl': valorCanonicoMgDl,
      if (fechaHora != null) 'fecha_hora': fechaHora,
      if (fuente != null) 'fuente': fuente,
      if (invalidado != null) 'invalidado': invalidado,
      if (notas != null) 'notas': notas,
    });
  }

  LaboratoriosCompanion copyWith({
    Value<int>? id,
    Value<int>? pacienteId,
    Value<int?>? episodioId,
    Value<String>? parametroCodigo,
    Value<double>? valorOriginal,
    Value<String>? unidadOriginal,
    Value<double>? valorCanonicoMgDl,
    Value<DateTime>? fechaHora,
    Value<String>? fuente,
    Value<bool>? invalidado,
    Value<String?>? notas,
  }) {
    return LaboratoriosCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      episodioId: episodioId ?? this.episodioId,
      parametroCodigo: parametroCodigo ?? this.parametroCodigo,
      valorOriginal: valorOriginal ?? this.valorOriginal,
      unidadOriginal: unidadOriginal ?? this.unidadOriginal,
      valorCanonicoMgDl: valorCanonicoMgDl ?? this.valorCanonicoMgDl,
      fechaHora: fechaHora ?? this.fechaHora,
      fuente: fuente ?? this.fuente,
      invalidado: invalidado ?? this.invalidado,
      notas: notas ?? this.notas,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (parametroCodigo.present) {
      map['parametro_codigo'] = Variable<String>(parametroCodigo.value);
    }
    if (valorOriginal.present) {
      map['valor_original'] = Variable<double>(valorOriginal.value);
    }
    if (unidadOriginal.present) {
      map['unidad_original'] = Variable<String>(unidadOriginal.value);
    }
    if (valorCanonicoMgDl.present) {
      map['valor_canonico_mg_dl'] = Variable<double>(valorCanonicoMgDl.value);
    }
    if (fechaHora.present) {
      map['fecha_hora'] = Variable<DateTime>(fechaHora.value);
    }
    if (fuente.present) {
      map['fuente'] = Variable<String>(fuente.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LaboratoriosCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('parametroCodigo: $parametroCodigo, ')
          ..write('valorOriginal: $valorOriginal, ')
          ..write('unidadOriginal: $unidadOriginal, ')
          ..write('valorCanonicoMgDl: $valorCanonicoMgDl, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('fuente: $fuente, ')
          ..write('invalidado: $invalidado, ')
          ..write('notas: $notas')
          ..write(')'))
        .toString();
  }
}

class $ImagenesTable extends Imagenes with TableInfo<$ImagenesTable, Imagene> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagenesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  @override
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
    'bytes',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaHoraMeta = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    episodioId,
    tipo,
    bytes,
    descripcion,
    fechaHora,
    invalidado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'imagenes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Imagene> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodioIdMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(
        _bytesMeta,
        bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta),
      );
    } else if (isInserting) {
      context.missing(_bytesMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _fechaHoraMeta,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _fechaHoraMeta),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Imagene map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Imagene(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      bytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}bytes'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      ),
      fechaHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
    );
  }

  @override
  $ImagenesTable createAlias(String alias) {
    return $ImagenesTable(attachedDatabase, alias);
  }
}

class Imagene extends DataClass implements Insertable<Imagene> {
  final int id;
  final int episodioId;
  final String tipo;
  final Uint8List bytes;
  final String? descripcion;
  final DateTime fechaHora;
  final bool invalidado;
  const Imagene({
    required this.id,
    required this.episodioId,
    required this.tipo,
    required this.bytes,
    this.descripcion,
    required this.fechaHora,
    required this.invalidado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['episodio_id'] = Variable<int>(episodioId);
    map['tipo'] = Variable<String>(tipo);
    map['bytes'] = Variable<Uint8List>(bytes);
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    map['fecha_hora'] = Variable<DateTime>(fechaHora);
    map['invalidado'] = Variable<bool>(invalidado);
    return map;
  }

  ImagenesCompanion toCompanion(bool nullToAbsent) {
    return ImagenesCompanion(
      id: Value(id),
      episodioId: Value(episodioId),
      tipo: Value(tipo),
      bytes: Value(bytes),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      fechaHora: Value(fechaHora),
      invalidado: Value(invalidado),
    );
  }

  factory Imagene.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Imagene(
      id: serializer.fromJson<int>(json['id']),
      episodioId: serializer.fromJson<int>(json['episodioId']),
      tipo: serializer.fromJson<String>(json['tipo']),
      bytes: serializer.fromJson<Uint8List>(json['bytes']),
      descripcion: serializer.fromJson<String?>(json['descripcion']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'episodioId': serializer.toJson<int>(episodioId),
      'tipo': serializer.toJson<String>(tipo),
      'bytes': serializer.toJson<Uint8List>(bytes),
      'descripcion': serializer.toJson<String?>(descripcion),
      'fechaHora': serializer.toJson<DateTime>(fechaHora),
      'invalidado': serializer.toJson<bool>(invalidado),
    };
  }

  Imagene copyWith({
    int? id,
    int? episodioId,
    String? tipo,
    Uint8List? bytes,
    Value<String?> descripcion = const Value.absent(),
    DateTime? fechaHora,
    bool? invalidado,
  }) => Imagene(
    id: id ?? this.id,
    episodioId: episodioId ?? this.episodioId,
    tipo: tipo ?? this.tipo,
    bytes: bytes ?? this.bytes,
    descripcion: descripcion.present ? descripcion.value : this.descripcion,
    fechaHora: fechaHora ?? this.fechaHora,
    invalidado: invalidado ?? this.invalidado,
  );
  Imagene copyWithCompanion(ImagenesCompanion data) {
    return Imagene(
      id: data.id.present ? data.id.value : this.id,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      fechaHora: data.fechaHora.present ? data.fechaHora.value : this.fechaHora,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Imagene(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('tipo: $tipo, ')
          ..write('bytes: $bytes, ')
          ..write('descripcion: $descripcion, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    episodioId,
    tipo,
    $driftBlobEquality.hash(bytes),
    descripcion,
    fechaHora,
    invalidado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Imagene &&
          other.id == this.id &&
          other.episodioId == this.episodioId &&
          other.tipo == this.tipo &&
          $driftBlobEquality.equals(other.bytes, this.bytes) &&
          other.descripcion == this.descripcion &&
          other.fechaHora == this.fechaHora &&
          other.invalidado == this.invalidado);
}

class ImagenesCompanion extends UpdateCompanion<Imagene> {
  final Value<int> id;
  final Value<int> episodioId;
  final Value<String> tipo;
  final Value<Uint8List> bytes;
  final Value<String?> descripcion;
  final Value<DateTime> fechaHora;
  final Value<bool> invalidado;
  const ImagenesCompanion({
    this.id = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.bytes = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.fechaHora = const Value.absent(),
    this.invalidado = const Value.absent(),
  });
  ImagenesCompanion.insert({
    this.id = const Value.absent(),
    required int episodioId,
    required String tipo,
    required Uint8List bytes,
    this.descripcion = const Value.absent(),
    this.fechaHora = const Value.absent(),
    this.invalidado = const Value.absent(),
  }) : episodioId = Value(episodioId),
       tipo = Value(tipo),
       bytes = Value(bytes);
  static Insertable<Imagene> custom({
    Expression<int>? id,
    Expression<int>? episodioId,
    Expression<String>? tipo,
    Expression<Uint8List>? bytes,
    Expression<String>? descripcion,
    Expression<DateTime>? fechaHora,
    Expression<bool>? invalidado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (episodioId != null) 'episodio_id': episodioId,
      if (tipo != null) 'tipo': tipo,
      if (bytes != null) 'bytes': bytes,
      if (descripcion != null) 'descripcion': descripcion,
      if (fechaHora != null) 'fecha_hora': fechaHora,
      if (invalidado != null) 'invalidado': invalidado,
    });
  }

  ImagenesCompanion copyWith({
    Value<int>? id,
    Value<int>? episodioId,
    Value<String>? tipo,
    Value<Uint8List>? bytes,
    Value<String?>? descripcion,
    Value<DateTime>? fechaHora,
    Value<bool>? invalidado,
  }) {
    return ImagenesCompanion(
      id: id ?? this.id,
      episodioId: episodioId ?? this.episodioId,
      tipo: tipo ?? this.tipo,
      bytes: bytes ?? this.bytes,
      descripcion: descripcion ?? this.descripcion,
      fechaHora: fechaHora ?? this.fechaHora,
      invalidado: invalidado ?? this.invalidado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (fechaHora.present) {
      map['fecha_hora'] = Variable<DateTime>(fechaHora.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagenesCompanion(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('tipo: $tipo, ')
          ..write('bytes: $bytes, ')
          ..write('descripcion: $descripcion, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }
}

class $EkgTable extends Ekg with TableInfo<$EkgTable, EkgData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EkgTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _ritmoMeta = const VerificationMeta('ritmo');
  @override
  late final GeneratedColumn<String> ritmo = GeneratedColumn<String>(
    'ritmo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frecuenciaMeta = const VerificationMeta(
    'frecuencia',
  );
  @override
  late final GeneratedColumn<String> frecuencia = GeneratedColumn<String>(
    'frecuencia',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ejeMeta = const VerificationMeta('eje');
  @override
  late final GeneratedColumn<String> eje = GeneratedColumn<String>(
    'eje',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hallazgosMeta = const VerificationMeta(
    'hallazgos',
  );
  @override
  late final GeneratedColumn<String> hallazgos = GeneratedColumn<String>(
    'hallazgos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adjuntoMeta = const VerificationMeta(
    'adjunto',
  );
  @override
  late final GeneratedColumn<Uint8List> adjunto = GeneratedColumn<Uint8List>(
    'adjunto',
    aliasedName,
    true,
    type: DriftSqlType.blob,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaHoraMeta = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    episodioId,
    ritmo,
    frecuencia,
    eje,
    hallazgos,
    adjunto,
    fechaHora,
    invalidado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ekg';
  @override
  VerificationContext validateIntegrity(
    Insertable<EkgData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodioIdMeta);
    }
    if (data.containsKey('ritmo')) {
      context.handle(
        _ritmoMeta,
        ritmo.isAcceptableOrUnknown(data['ritmo']!, _ritmoMeta),
      );
    }
    if (data.containsKey('frecuencia')) {
      context.handle(
        _frecuenciaMeta,
        frecuencia.isAcceptableOrUnknown(data['frecuencia']!, _frecuenciaMeta),
      );
    }
    if (data.containsKey('eje')) {
      context.handle(
        _ejeMeta,
        eje.isAcceptableOrUnknown(data['eje']!, _ejeMeta),
      );
    }
    if (data.containsKey('hallazgos')) {
      context.handle(
        _hallazgosMeta,
        hallazgos.isAcceptableOrUnknown(data['hallazgos']!, _hallazgosMeta),
      );
    } else if (isInserting) {
      context.missing(_hallazgosMeta);
    }
    if (data.containsKey('adjunto')) {
      context.handle(
        _adjuntoMeta,
        adjunto.isAcceptableOrUnknown(data['adjunto']!, _adjuntoMeta),
      );
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _fechaHoraMeta,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _fechaHoraMeta),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EkgData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EkgData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      )!,
      ritmo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ritmo'],
      ),
      frecuencia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frecuencia'],
      ),
      eje: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eje'],
      ),
      hallazgos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hallazgos'],
      )!,
      adjunto: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}adjunto'],
      ),
      fechaHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
    );
  }

  @override
  $EkgTable createAlias(String alias) {
    return $EkgTable(attachedDatabase, alias);
  }
}

class EkgData extends DataClass implements Insertable<EkgData> {
  final int id;
  final int episodioId;
  final String? ritmo;
  final String? frecuencia;
  final String? eje;
  final String hallazgos;
  final Uint8List? adjunto;
  final DateTime fechaHora;
  final bool invalidado;
  const EkgData({
    required this.id,
    required this.episodioId,
    this.ritmo,
    this.frecuencia,
    this.eje,
    required this.hallazgos,
    this.adjunto,
    required this.fechaHora,
    required this.invalidado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['episodio_id'] = Variable<int>(episodioId);
    if (!nullToAbsent || ritmo != null) {
      map['ritmo'] = Variable<String>(ritmo);
    }
    if (!nullToAbsent || frecuencia != null) {
      map['frecuencia'] = Variable<String>(frecuencia);
    }
    if (!nullToAbsent || eje != null) {
      map['eje'] = Variable<String>(eje);
    }
    map['hallazgos'] = Variable<String>(hallazgos);
    if (!nullToAbsent || adjunto != null) {
      map['adjunto'] = Variable<Uint8List>(adjunto);
    }
    map['fecha_hora'] = Variable<DateTime>(fechaHora);
    map['invalidado'] = Variable<bool>(invalidado);
    return map;
  }

  EkgCompanion toCompanion(bool nullToAbsent) {
    return EkgCompanion(
      id: Value(id),
      episodioId: Value(episodioId),
      ritmo: ritmo == null && nullToAbsent
          ? const Value.absent()
          : Value(ritmo),
      frecuencia: frecuencia == null && nullToAbsent
          ? const Value.absent()
          : Value(frecuencia),
      eje: eje == null && nullToAbsent ? const Value.absent() : Value(eje),
      hallazgos: Value(hallazgos),
      adjunto: adjunto == null && nullToAbsent
          ? const Value.absent()
          : Value(adjunto),
      fechaHora: Value(fechaHora),
      invalidado: Value(invalidado),
    );
  }

  factory EkgData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EkgData(
      id: serializer.fromJson<int>(json['id']),
      episodioId: serializer.fromJson<int>(json['episodioId']),
      ritmo: serializer.fromJson<String?>(json['ritmo']),
      frecuencia: serializer.fromJson<String?>(json['frecuencia']),
      eje: serializer.fromJson<String?>(json['eje']),
      hallazgos: serializer.fromJson<String>(json['hallazgos']),
      adjunto: serializer.fromJson<Uint8List?>(json['adjunto']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'episodioId': serializer.toJson<int>(episodioId),
      'ritmo': serializer.toJson<String?>(ritmo),
      'frecuencia': serializer.toJson<String?>(frecuencia),
      'eje': serializer.toJson<String?>(eje),
      'hallazgos': serializer.toJson<String>(hallazgos),
      'adjunto': serializer.toJson<Uint8List?>(adjunto),
      'fechaHora': serializer.toJson<DateTime>(fechaHora),
      'invalidado': serializer.toJson<bool>(invalidado),
    };
  }

  EkgData copyWith({
    int? id,
    int? episodioId,
    Value<String?> ritmo = const Value.absent(),
    Value<String?> frecuencia = const Value.absent(),
    Value<String?> eje = const Value.absent(),
    String? hallazgos,
    Value<Uint8List?> adjunto = const Value.absent(),
    DateTime? fechaHora,
    bool? invalidado,
  }) => EkgData(
    id: id ?? this.id,
    episodioId: episodioId ?? this.episodioId,
    ritmo: ritmo.present ? ritmo.value : this.ritmo,
    frecuencia: frecuencia.present ? frecuencia.value : this.frecuencia,
    eje: eje.present ? eje.value : this.eje,
    hallazgos: hallazgos ?? this.hallazgos,
    adjunto: adjunto.present ? adjunto.value : this.adjunto,
    fechaHora: fechaHora ?? this.fechaHora,
    invalidado: invalidado ?? this.invalidado,
  );
  EkgData copyWithCompanion(EkgCompanion data) {
    return EkgData(
      id: data.id.present ? data.id.value : this.id,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      ritmo: data.ritmo.present ? data.ritmo.value : this.ritmo,
      frecuencia: data.frecuencia.present
          ? data.frecuencia.value
          : this.frecuencia,
      eje: data.eje.present ? data.eje.value : this.eje,
      hallazgos: data.hallazgos.present ? data.hallazgos.value : this.hallazgos,
      adjunto: data.adjunto.present ? data.adjunto.value : this.adjunto,
      fechaHora: data.fechaHora.present ? data.fechaHora.value : this.fechaHora,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EkgData(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('ritmo: $ritmo, ')
          ..write('frecuencia: $frecuencia, ')
          ..write('eje: $eje, ')
          ..write('hallazgos: $hallazgos, ')
          ..write('adjunto: $adjunto, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    episodioId,
    ritmo,
    frecuencia,
    eje,
    hallazgos,
    $driftBlobEquality.hash(adjunto),
    fechaHora,
    invalidado,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EkgData &&
          other.id == this.id &&
          other.episodioId == this.episodioId &&
          other.ritmo == this.ritmo &&
          other.frecuencia == this.frecuencia &&
          other.eje == this.eje &&
          other.hallazgos == this.hallazgos &&
          $driftBlobEquality.equals(other.adjunto, this.adjunto) &&
          other.fechaHora == this.fechaHora &&
          other.invalidado == this.invalidado);
}

class EkgCompanion extends UpdateCompanion<EkgData> {
  final Value<int> id;
  final Value<int> episodioId;
  final Value<String?> ritmo;
  final Value<String?> frecuencia;
  final Value<String?> eje;
  final Value<String> hallazgos;
  final Value<Uint8List?> adjunto;
  final Value<DateTime> fechaHora;
  final Value<bool> invalidado;
  const EkgCompanion({
    this.id = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.ritmo = const Value.absent(),
    this.frecuencia = const Value.absent(),
    this.eje = const Value.absent(),
    this.hallazgos = const Value.absent(),
    this.adjunto = const Value.absent(),
    this.fechaHora = const Value.absent(),
    this.invalidado = const Value.absent(),
  });
  EkgCompanion.insert({
    this.id = const Value.absent(),
    required int episodioId,
    this.ritmo = const Value.absent(),
    this.frecuencia = const Value.absent(),
    this.eje = const Value.absent(),
    required String hallazgos,
    this.adjunto = const Value.absent(),
    this.fechaHora = const Value.absent(),
    this.invalidado = const Value.absent(),
  }) : episodioId = Value(episodioId),
       hallazgos = Value(hallazgos);
  static Insertable<EkgData> custom({
    Expression<int>? id,
    Expression<int>? episodioId,
    Expression<String>? ritmo,
    Expression<String>? frecuencia,
    Expression<String>? eje,
    Expression<String>? hallazgos,
    Expression<Uint8List>? adjunto,
    Expression<DateTime>? fechaHora,
    Expression<bool>? invalidado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (episodioId != null) 'episodio_id': episodioId,
      if (ritmo != null) 'ritmo': ritmo,
      if (frecuencia != null) 'frecuencia': frecuencia,
      if (eje != null) 'eje': eje,
      if (hallazgos != null) 'hallazgos': hallazgos,
      if (adjunto != null) 'adjunto': adjunto,
      if (fechaHora != null) 'fecha_hora': fechaHora,
      if (invalidado != null) 'invalidado': invalidado,
    });
  }

  EkgCompanion copyWith({
    Value<int>? id,
    Value<int>? episodioId,
    Value<String?>? ritmo,
    Value<String?>? frecuencia,
    Value<String?>? eje,
    Value<String>? hallazgos,
    Value<Uint8List?>? adjunto,
    Value<DateTime>? fechaHora,
    Value<bool>? invalidado,
  }) {
    return EkgCompanion(
      id: id ?? this.id,
      episodioId: episodioId ?? this.episodioId,
      ritmo: ritmo ?? this.ritmo,
      frecuencia: frecuencia ?? this.frecuencia,
      eje: eje ?? this.eje,
      hallazgos: hallazgos ?? this.hallazgos,
      adjunto: adjunto ?? this.adjunto,
      fechaHora: fechaHora ?? this.fechaHora,
      invalidado: invalidado ?? this.invalidado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (ritmo.present) {
      map['ritmo'] = Variable<String>(ritmo.value);
    }
    if (frecuencia.present) {
      map['frecuencia'] = Variable<String>(frecuencia.value);
    }
    if (eje.present) {
      map['eje'] = Variable<String>(eje.value);
    }
    if (hallazgos.present) {
      map['hallazgos'] = Variable<String>(hallazgos.value);
    }
    if (adjunto.present) {
      map['adjunto'] = Variable<Uint8List>(adjunto.value);
    }
    if (fechaHora.present) {
      map['fecha_hora'] = Variable<DateTime>(fechaHora.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EkgCompanion(')
          ..write('id: $id, ')
          ..write('episodioId: $episodioId, ')
          ..write('ritmo: $ritmo, ')
          ..write('frecuencia: $frecuencia, ')
          ..write('eje: $eje, ')
          ..write('hallazgos: $hallazgos, ')
          ..write('adjunto: $adjunto, ')
          ..write('fechaHora: $fechaHora, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }
}

class $VentilacionSavinaTable extends VentilacionSavina
    with TableInfo<$VentilacionSavinaTable, VentilacionSavinaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VentilacionSavinaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _modoMeta = const VerificationMeta('modo');
  @override
  late final GeneratedColumn<String> modo = GeneratedColumn<String>(
    'modo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fio2Meta = const VerificationMeta('fio2');
  @override
  late final GeneratedColumn<double> fio2 = GeneratedColumn<double>(
    'fio2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _peepMeta = const VerificationMeta('peep');
  @override
  late final GeneratedColumn<double> peep = GeneratedColumn<double>(
    'peep',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volumenTidalMeta = const VerificationMeta(
    'volumenTidal',
  );
  @override
  late final GeneratedColumn<double> volumenTidal = GeneratedColumn<double>(
    'volumen_tidal',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pControlMeta = const VerificationMeta(
    'pControl',
  );
  @override
  late final GeneratedColumn<double> pControl = GeneratedColumn<double>(
    'p_control',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frecRespProgramadaMeta =
      const VerificationMeta('frecRespProgramada');
  @override
  late final GeneratedColumn<double> frecRespProgramada =
      GeneratedColumn<double>(
        'frec_resp_programada',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _relIEMeta = const VerificationMeta('relIE');
  @override
  late final GeneratedColumn<double> relIE = GeneratedColumn<double>(
    'rel_i_e',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pSoporteMeta = const VerificationMeta(
    'pSoporte',
  );
  @override
  late final GeneratedColumn<double> pSoporte = GeneratedColumn<double>(
    'p_soporte',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _triggerMeta = const VerificationMeta(
    'trigger',
  );
  @override
  late final GeneratedColumn<double> trigger = GeneratedColumn<double>(
    'trigger',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pPicoMeta = const VerificationMeta('pPico');
  @override
  late final GeneratedColumn<double> pPico = GeneratedColumn<double>(
    'p_pico',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pMesetaMeta = const VerificationMeta(
    'pMeseta',
  );
  @override
  late final GeneratedColumn<double> pMeseta = GeneratedColumn<double>(
    'p_meseta',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pMediaMeta = const VerificationMeta('pMedia');
  @override
  late final GeneratedColumn<double> pMedia = GeneratedColumn<double>(
    'p_media',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _vtEspiradoMeta = const VerificationMeta(
    'vtEspirado',
  );
  @override
  late final GeneratedColumn<double> vtEspirado = GeneratedColumn<double>(
    'vt_espirado',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frecRespTotalMeta = const VerificationMeta(
    'frecRespTotal',
  );
  @override
  late final GeneratedColumn<double> frecRespTotal = GeneratedColumn<double>(
    'frec_resp_total',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volMinutoMeta = const VerificationMeta(
    'volMinuto',
  );
  @override
  late final GeneratedColumn<double> volMinuto = GeneratedColumn<double>(
    'vol_minuto',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fugaMeta = const VerificationMeta('fuga');
  @override
  late final GeneratedColumn<double> fuga = GeneratedColumn<double>(
    'fuga',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _drivingPressureMeta = const VerificationMeta(
    'drivingPressure',
  );
  @override
  late final GeneratedColumn<double> drivingPressure = GeneratedColumn<double>(
    'driving_pressure',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _complianceEstaticaMeta =
      const VerificationMeta('complianceEstatica');
  @override
  late final GeneratedColumn<double> complianceEstatica =
      GeneratedColumn<double>(
        'compliance_estatica',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _indiceoOxigenacionMeta =
      const VerificationMeta('indiceoOxigenacion');
  @override
  late final GeneratedColumn<double> indiceoOxigenacion =
      GeneratedColumn<double>(
        'indiceo_oxigenacion',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pfRatioMeta = const VerificationMeta(
    'pfRatio',
  );
  @override
  late final GeneratedColumn<double> pfRatio = GeneratedColumn<double>(
    'pf_ratio',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ardsBerlinMeta = const VerificationMeta(
    'ardsBerlin',
  );
  @override
  late final GeneratedColumn<String> ardsBerlin = GeneratedColumn<String>(
    'ards_berlin',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
    'notas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    episodioId,
    timestamp,
    modo,
    fio2,
    peep,
    volumenTidal,
    pControl,
    frecRespProgramada,
    relIE,
    pSoporte,
    trigger,
    pPico,
    pMeseta,
    pMedia,
    vtEspirado,
    frecRespTotal,
    volMinuto,
    fuga,
    drivingPressure,
    complianceEstatica,
    indiceoOxigenacion,
    pfRatio,
    ardsBerlin,
    notas,
    invalidado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ventilacion_savina';
  @override
  VerificationContext validateIntegrity(
    Insertable<VentilacionSavinaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('modo')) {
      context.handle(
        _modoMeta,
        modo.isAcceptableOrUnknown(data['modo']!, _modoMeta),
      );
    } else if (isInserting) {
      context.missing(_modoMeta);
    }
    if (data.containsKey('fio2')) {
      context.handle(
        _fio2Meta,
        fio2.isAcceptableOrUnknown(data['fio2']!, _fio2Meta),
      );
    }
    if (data.containsKey('peep')) {
      context.handle(
        _peepMeta,
        peep.isAcceptableOrUnknown(data['peep']!, _peepMeta),
      );
    }
    if (data.containsKey('volumen_tidal')) {
      context.handle(
        _volumenTidalMeta,
        volumenTidal.isAcceptableOrUnknown(
          data['volumen_tidal']!,
          _volumenTidalMeta,
        ),
      );
    }
    if (data.containsKey('p_control')) {
      context.handle(
        _pControlMeta,
        pControl.isAcceptableOrUnknown(data['p_control']!, _pControlMeta),
      );
    }
    if (data.containsKey('frec_resp_programada')) {
      context.handle(
        _frecRespProgramadaMeta,
        frecRespProgramada.isAcceptableOrUnknown(
          data['frec_resp_programada']!,
          _frecRespProgramadaMeta,
        ),
      );
    }
    if (data.containsKey('rel_i_e')) {
      context.handle(
        _relIEMeta,
        relIE.isAcceptableOrUnknown(data['rel_i_e']!, _relIEMeta),
      );
    }
    if (data.containsKey('p_soporte')) {
      context.handle(
        _pSoporteMeta,
        pSoporte.isAcceptableOrUnknown(data['p_soporte']!, _pSoporteMeta),
      );
    }
    if (data.containsKey('trigger')) {
      context.handle(
        _triggerMeta,
        trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta),
      );
    }
    if (data.containsKey('p_pico')) {
      context.handle(
        _pPicoMeta,
        pPico.isAcceptableOrUnknown(data['p_pico']!, _pPicoMeta),
      );
    }
    if (data.containsKey('p_meseta')) {
      context.handle(
        _pMesetaMeta,
        pMeseta.isAcceptableOrUnknown(data['p_meseta']!, _pMesetaMeta),
      );
    }
    if (data.containsKey('p_media')) {
      context.handle(
        _pMediaMeta,
        pMedia.isAcceptableOrUnknown(data['p_media']!, _pMediaMeta),
      );
    }
    if (data.containsKey('vt_espirado')) {
      context.handle(
        _vtEspiradoMeta,
        vtEspirado.isAcceptableOrUnknown(data['vt_espirado']!, _vtEspiradoMeta),
      );
    }
    if (data.containsKey('frec_resp_total')) {
      context.handle(
        _frecRespTotalMeta,
        frecRespTotal.isAcceptableOrUnknown(
          data['frec_resp_total']!,
          _frecRespTotalMeta,
        ),
      );
    }
    if (data.containsKey('vol_minuto')) {
      context.handle(
        _volMinutoMeta,
        volMinuto.isAcceptableOrUnknown(data['vol_minuto']!, _volMinutoMeta),
      );
    }
    if (data.containsKey('fuga')) {
      context.handle(
        _fugaMeta,
        fuga.isAcceptableOrUnknown(data['fuga']!, _fugaMeta),
      );
    }
    if (data.containsKey('driving_pressure')) {
      context.handle(
        _drivingPressureMeta,
        drivingPressure.isAcceptableOrUnknown(
          data['driving_pressure']!,
          _drivingPressureMeta,
        ),
      );
    }
    if (data.containsKey('compliance_estatica')) {
      context.handle(
        _complianceEstaticaMeta,
        complianceEstatica.isAcceptableOrUnknown(
          data['compliance_estatica']!,
          _complianceEstaticaMeta,
        ),
      );
    }
    if (data.containsKey('indiceo_oxigenacion')) {
      context.handle(
        _indiceoOxigenacionMeta,
        indiceoOxigenacion.isAcceptableOrUnknown(
          data['indiceo_oxigenacion']!,
          _indiceoOxigenacionMeta,
        ),
      );
    }
    if (data.containsKey('pf_ratio')) {
      context.handle(
        _pfRatioMeta,
        pfRatio.isAcceptableOrUnknown(data['pf_ratio']!, _pfRatioMeta),
      );
    }
    if (data.containsKey('ards_berlin')) {
      context.handle(
        _ardsBerlinMeta,
        ardsBerlin.isAcceptableOrUnknown(data['ards_berlin']!, _ardsBerlinMeta),
      );
    }
    if (data.containsKey('notas')) {
      context.handle(
        _notasMeta,
        notas.isAcceptableOrUnknown(data['notas']!, _notasMeta),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VentilacionSavinaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VentilacionSavinaData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      ),
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      modo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modo'],
      )!,
      fio2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fio2'],
      ),
      peep: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peep'],
      ),
      volumenTidal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}volumen_tidal'],
      ),
      pControl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p_control'],
      ),
      frecRespProgramada: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frec_resp_programada'],
      ),
      relIE: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rel_i_e'],
      ),
      pSoporte: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p_soporte'],
      ),
      trigger: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}trigger'],
      ),
      pPico: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p_pico'],
      ),
      pMeseta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p_meseta'],
      ),
      pMedia: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}p_media'],
      ),
      vtEspirado: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vt_espirado'],
      ),
      frecRespTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}frec_resp_total'],
      ),
      volMinuto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vol_minuto'],
      ),
      fuga: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fuga'],
      ),
      drivingPressure: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}driving_pressure'],
      ),
      complianceEstatica: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}compliance_estatica'],
      ),
      indiceoOxigenacion: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}indiceo_oxigenacion'],
      ),
      pfRatio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pf_ratio'],
      ),
      ardsBerlin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ards_berlin'],
      ),
      notas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notas'],
      ),
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
    );
  }

  @override
  $VentilacionSavinaTable createAlias(String alias) {
    return $VentilacionSavinaTable(attachedDatabase, alias);
  }
}

class VentilacionSavinaData extends DataClass
    implements Insertable<VentilacionSavinaData> {
  final int id;
  final int? pacienteId;
  final int? episodioId;
  final DateTime timestamp;
  final String modo;
  final double? fio2;
  final double? peep;
  final double? volumenTidal;
  final double? pControl;
  final double? frecRespProgramada;
  final double? relIE;
  final double? pSoporte;
  final double? trigger;
  final double? pPico;
  final double? pMeseta;
  final double? pMedia;
  final double? vtEspirado;
  final double? frecRespTotal;
  final double? volMinuto;
  final double? fuga;
  final double? drivingPressure;
  final double? complianceEstatica;
  final double? indiceoOxigenacion;
  final double? pfRatio;
  final String? ardsBerlin;
  final String? notas;
  final bool invalidado;
  const VentilacionSavinaData({
    required this.id,
    this.pacienteId,
    this.episodioId,
    required this.timestamp,
    required this.modo,
    this.fio2,
    this.peep,
    this.volumenTidal,
    this.pControl,
    this.frecRespProgramada,
    this.relIE,
    this.pSoporte,
    this.trigger,
    this.pPico,
    this.pMeseta,
    this.pMedia,
    this.vtEspirado,
    this.frecRespTotal,
    this.volMinuto,
    this.fuga,
    this.drivingPressure,
    this.complianceEstatica,
    this.indiceoOxigenacion,
    this.pfRatio,
    this.ardsBerlin,
    this.notas,
    required this.invalidado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || pacienteId != null) {
      map['paciente_id'] = Variable<int>(pacienteId);
    }
    if (!nullToAbsent || episodioId != null) {
      map['episodio_id'] = Variable<int>(episodioId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['modo'] = Variable<String>(modo);
    if (!nullToAbsent || fio2 != null) {
      map['fio2'] = Variable<double>(fio2);
    }
    if (!nullToAbsent || peep != null) {
      map['peep'] = Variable<double>(peep);
    }
    if (!nullToAbsent || volumenTidal != null) {
      map['volumen_tidal'] = Variable<double>(volumenTidal);
    }
    if (!nullToAbsent || pControl != null) {
      map['p_control'] = Variable<double>(pControl);
    }
    if (!nullToAbsent || frecRespProgramada != null) {
      map['frec_resp_programada'] = Variable<double>(frecRespProgramada);
    }
    if (!nullToAbsent || relIE != null) {
      map['rel_i_e'] = Variable<double>(relIE);
    }
    if (!nullToAbsent || pSoporte != null) {
      map['p_soporte'] = Variable<double>(pSoporte);
    }
    if (!nullToAbsent || trigger != null) {
      map['trigger'] = Variable<double>(trigger);
    }
    if (!nullToAbsent || pPico != null) {
      map['p_pico'] = Variable<double>(pPico);
    }
    if (!nullToAbsent || pMeseta != null) {
      map['p_meseta'] = Variable<double>(pMeseta);
    }
    if (!nullToAbsent || pMedia != null) {
      map['p_media'] = Variable<double>(pMedia);
    }
    if (!nullToAbsent || vtEspirado != null) {
      map['vt_espirado'] = Variable<double>(vtEspirado);
    }
    if (!nullToAbsent || frecRespTotal != null) {
      map['frec_resp_total'] = Variable<double>(frecRespTotal);
    }
    if (!nullToAbsent || volMinuto != null) {
      map['vol_minuto'] = Variable<double>(volMinuto);
    }
    if (!nullToAbsent || fuga != null) {
      map['fuga'] = Variable<double>(fuga);
    }
    if (!nullToAbsent || drivingPressure != null) {
      map['driving_pressure'] = Variable<double>(drivingPressure);
    }
    if (!nullToAbsent || complianceEstatica != null) {
      map['compliance_estatica'] = Variable<double>(complianceEstatica);
    }
    if (!nullToAbsent || indiceoOxigenacion != null) {
      map['indiceo_oxigenacion'] = Variable<double>(indiceoOxigenacion);
    }
    if (!nullToAbsent || pfRatio != null) {
      map['pf_ratio'] = Variable<double>(pfRatio);
    }
    if (!nullToAbsent || ardsBerlin != null) {
      map['ards_berlin'] = Variable<String>(ardsBerlin);
    }
    if (!nullToAbsent || notas != null) {
      map['notas'] = Variable<String>(notas);
    }
    map['invalidado'] = Variable<bool>(invalidado);
    return map;
  }

  VentilacionSavinaCompanion toCompanion(bool nullToAbsent) {
    return VentilacionSavinaCompanion(
      id: Value(id),
      pacienteId: pacienteId == null && nullToAbsent
          ? const Value.absent()
          : Value(pacienteId),
      episodioId: episodioId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodioId),
      timestamp: Value(timestamp),
      modo: Value(modo),
      fio2: fio2 == null && nullToAbsent ? const Value.absent() : Value(fio2),
      peep: peep == null && nullToAbsent ? const Value.absent() : Value(peep),
      volumenTidal: volumenTidal == null && nullToAbsent
          ? const Value.absent()
          : Value(volumenTidal),
      pControl: pControl == null && nullToAbsent
          ? const Value.absent()
          : Value(pControl),
      frecRespProgramada: frecRespProgramada == null && nullToAbsent
          ? const Value.absent()
          : Value(frecRespProgramada),
      relIE: relIE == null && nullToAbsent
          ? const Value.absent()
          : Value(relIE),
      pSoporte: pSoporte == null && nullToAbsent
          ? const Value.absent()
          : Value(pSoporte),
      trigger: trigger == null && nullToAbsent
          ? const Value.absent()
          : Value(trigger),
      pPico: pPico == null && nullToAbsent
          ? const Value.absent()
          : Value(pPico),
      pMeseta: pMeseta == null && nullToAbsent
          ? const Value.absent()
          : Value(pMeseta),
      pMedia: pMedia == null && nullToAbsent
          ? const Value.absent()
          : Value(pMedia),
      vtEspirado: vtEspirado == null && nullToAbsent
          ? const Value.absent()
          : Value(vtEspirado),
      frecRespTotal: frecRespTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(frecRespTotal),
      volMinuto: volMinuto == null && nullToAbsent
          ? const Value.absent()
          : Value(volMinuto),
      fuga: fuga == null && nullToAbsent ? const Value.absent() : Value(fuga),
      drivingPressure: drivingPressure == null && nullToAbsent
          ? const Value.absent()
          : Value(drivingPressure),
      complianceEstatica: complianceEstatica == null && nullToAbsent
          ? const Value.absent()
          : Value(complianceEstatica),
      indiceoOxigenacion: indiceoOxigenacion == null && nullToAbsent
          ? const Value.absent()
          : Value(indiceoOxigenacion),
      pfRatio: pfRatio == null && nullToAbsent
          ? const Value.absent()
          : Value(pfRatio),
      ardsBerlin: ardsBerlin == null && nullToAbsent
          ? const Value.absent()
          : Value(ardsBerlin),
      notas: notas == null && nullToAbsent
          ? const Value.absent()
          : Value(notas),
      invalidado: Value(invalidado),
    );
  }

  factory VentilacionSavinaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VentilacionSavinaData(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int?>(json['pacienteId']),
      episodioId: serializer.fromJson<int?>(json['episodioId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      modo: serializer.fromJson<String>(json['modo']),
      fio2: serializer.fromJson<double?>(json['fio2']),
      peep: serializer.fromJson<double?>(json['peep']),
      volumenTidal: serializer.fromJson<double?>(json['volumenTidal']),
      pControl: serializer.fromJson<double?>(json['pControl']),
      frecRespProgramada: serializer.fromJson<double?>(
        json['frecRespProgramada'],
      ),
      relIE: serializer.fromJson<double?>(json['relIE']),
      pSoporte: serializer.fromJson<double?>(json['pSoporte']),
      trigger: serializer.fromJson<double?>(json['trigger']),
      pPico: serializer.fromJson<double?>(json['pPico']),
      pMeseta: serializer.fromJson<double?>(json['pMeseta']),
      pMedia: serializer.fromJson<double?>(json['pMedia']),
      vtEspirado: serializer.fromJson<double?>(json['vtEspirado']),
      frecRespTotal: serializer.fromJson<double?>(json['frecRespTotal']),
      volMinuto: serializer.fromJson<double?>(json['volMinuto']),
      fuga: serializer.fromJson<double?>(json['fuga']),
      drivingPressure: serializer.fromJson<double?>(json['drivingPressure']),
      complianceEstatica: serializer.fromJson<double?>(
        json['complianceEstatica'],
      ),
      indiceoOxigenacion: serializer.fromJson<double?>(
        json['indiceoOxigenacion'],
      ),
      pfRatio: serializer.fromJson<double?>(json['pfRatio']),
      ardsBerlin: serializer.fromJson<String?>(json['ardsBerlin']),
      notas: serializer.fromJson<String?>(json['notas']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int?>(pacienteId),
      'episodioId': serializer.toJson<int?>(episodioId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'modo': serializer.toJson<String>(modo),
      'fio2': serializer.toJson<double?>(fio2),
      'peep': serializer.toJson<double?>(peep),
      'volumenTidal': serializer.toJson<double?>(volumenTidal),
      'pControl': serializer.toJson<double?>(pControl),
      'frecRespProgramada': serializer.toJson<double?>(frecRespProgramada),
      'relIE': serializer.toJson<double?>(relIE),
      'pSoporte': serializer.toJson<double?>(pSoporte),
      'trigger': serializer.toJson<double?>(trigger),
      'pPico': serializer.toJson<double?>(pPico),
      'pMeseta': serializer.toJson<double?>(pMeseta),
      'pMedia': serializer.toJson<double?>(pMedia),
      'vtEspirado': serializer.toJson<double?>(vtEspirado),
      'frecRespTotal': serializer.toJson<double?>(frecRespTotal),
      'volMinuto': serializer.toJson<double?>(volMinuto),
      'fuga': serializer.toJson<double?>(fuga),
      'drivingPressure': serializer.toJson<double?>(drivingPressure),
      'complianceEstatica': serializer.toJson<double?>(complianceEstatica),
      'indiceoOxigenacion': serializer.toJson<double?>(indiceoOxigenacion),
      'pfRatio': serializer.toJson<double?>(pfRatio),
      'ardsBerlin': serializer.toJson<String?>(ardsBerlin),
      'notas': serializer.toJson<String?>(notas),
      'invalidado': serializer.toJson<bool>(invalidado),
    };
  }

  VentilacionSavinaData copyWith({
    int? id,
    Value<int?> pacienteId = const Value.absent(),
    Value<int?> episodioId = const Value.absent(),
    DateTime? timestamp,
    String? modo,
    Value<double?> fio2 = const Value.absent(),
    Value<double?> peep = const Value.absent(),
    Value<double?> volumenTidal = const Value.absent(),
    Value<double?> pControl = const Value.absent(),
    Value<double?> frecRespProgramada = const Value.absent(),
    Value<double?> relIE = const Value.absent(),
    Value<double?> pSoporte = const Value.absent(),
    Value<double?> trigger = const Value.absent(),
    Value<double?> pPico = const Value.absent(),
    Value<double?> pMeseta = const Value.absent(),
    Value<double?> pMedia = const Value.absent(),
    Value<double?> vtEspirado = const Value.absent(),
    Value<double?> frecRespTotal = const Value.absent(),
    Value<double?> volMinuto = const Value.absent(),
    Value<double?> fuga = const Value.absent(),
    Value<double?> drivingPressure = const Value.absent(),
    Value<double?> complianceEstatica = const Value.absent(),
    Value<double?> indiceoOxigenacion = const Value.absent(),
    Value<double?> pfRatio = const Value.absent(),
    Value<String?> ardsBerlin = const Value.absent(),
    Value<String?> notas = const Value.absent(),
    bool? invalidado,
  }) => VentilacionSavinaData(
    id: id ?? this.id,
    pacienteId: pacienteId.present ? pacienteId.value : this.pacienteId,
    episodioId: episodioId.present ? episodioId.value : this.episodioId,
    timestamp: timestamp ?? this.timestamp,
    modo: modo ?? this.modo,
    fio2: fio2.present ? fio2.value : this.fio2,
    peep: peep.present ? peep.value : this.peep,
    volumenTidal: volumenTidal.present ? volumenTidal.value : this.volumenTidal,
    pControl: pControl.present ? pControl.value : this.pControl,
    frecRespProgramada: frecRespProgramada.present
        ? frecRespProgramada.value
        : this.frecRespProgramada,
    relIE: relIE.present ? relIE.value : this.relIE,
    pSoporte: pSoporte.present ? pSoporte.value : this.pSoporte,
    trigger: trigger.present ? trigger.value : this.trigger,
    pPico: pPico.present ? pPico.value : this.pPico,
    pMeseta: pMeseta.present ? pMeseta.value : this.pMeseta,
    pMedia: pMedia.present ? pMedia.value : this.pMedia,
    vtEspirado: vtEspirado.present ? vtEspirado.value : this.vtEspirado,
    frecRespTotal: frecRespTotal.present
        ? frecRespTotal.value
        : this.frecRespTotal,
    volMinuto: volMinuto.present ? volMinuto.value : this.volMinuto,
    fuga: fuga.present ? fuga.value : this.fuga,
    drivingPressure: drivingPressure.present
        ? drivingPressure.value
        : this.drivingPressure,
    complianceEstatica: complianceEstatica.present
        ? complianceEstatica.value
        : this.complianceEstatica,
    indiceoOxigenacion: indiceoOxigenacion.present
        ? indiceoOxigenacion.value
        : this.indiceoOxigenacion,
    pfRatio: pfRatio.present ? pfRatio.value : this.pfRatio,
    ardsBerlin: ardsBerlin.present ? ardsBerlin.value : this.ardsBerlin,
    notas: notas.present ? notas.value : this.notas,
    invalidado: invalidado ?? this.invalidado,
  );
  VentilacionSavinaData copyWithCompanion(VentilacionSavinaCompanion data) {
    return VentilacionSavinaData(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      modo: data.modo.present ? data.modo.value : this.modo,
      fio2: data.fio2.present ? data.fio2.value : this.fio2,
      peep: data.peep.present ? data.peep.value : this.peep,
      volumenTidal: data.volumenTidal.present
          ? data.volumenTidal.value
          : this.volumenTidal,
      pControl: data.pControl.present ? data.pControl.value : this.pControl,
      frecRespProgramada: data.frecRespProgramada.present
          ? data.frecRespProgramada.value
          : this.frecRespProgramada,
      relIE: data.relIE.present ? data.relIE.value : this.relIE,
      pSoporte: data.pSoporte.present ? data.pSoporte.value : this.pSoporte,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      pPico: data.pPico.present ? data.pPico.value : this.pPico,
      pMeseta: data.pMeseta.present ? data.pMeseta.value : this.pMeseta,
      pMedia: data.pMedia.present ? data.pMedia.value : this.pMedia,
      vtEspirado: data.vtEspirado.present
          ? data.vtEspirado.value
          : this.vtEspirado,
      frecRespTotal: data.frecRespTotal.present
          ? data.frecRespTotal.value
          : this.frecRespTotal,
      volMinuto: data.volMinuto.present ? data.volMinuto.value : this.volMinuto,
      fuga: data.fuga.present ? data.fuga.value : this.fuga,
      drivingPressure: data.drivingPressure.present
          ? data.drivingPressure.value
          : this.drivingPressure,
      complianceEstatica: data.complianceEstatica.present
          ? data.complianceEstatica.value
          : this.complianceEstatica,
      indiceoOxigenacion: data.indiceoOxigenacion.present
          ? data.indiceoOxigenacion.value
          : this.indiceoOxigenacion,
      pfRatio: data.pfRatio.present ? data.pfRatio.value : this.pfRatio,
      ardsBerlin: data.ardsBerlin.present
          ? data.ardsBerlin.value
          : this.ardsBerlin,
      notas: data.notas.present ? data.notas.value : this.notas,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VentilacionSavinaData(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('modo: $modo, ')
          ..write('fio2: $fio2, ')
          ..write('peep: $peep, ')
          ..write('volumenTidal: $volumenTidal, ')
          ..write('pControl: $pControl, ')
          ..write('frecRespProgramada: $frecRespProgramada, ')
          ..write('relIE: $relIE, ')
          ..write('pSoporte: $pSoporte, ')
          ..write('trigger: $trigger, ')
          ..write('pPico: $pPico, ')
          ..write('pMeseta: $pMeseta, ')
          ..write('pMedia: $pMedia, ')
          ..write('vtEspirado: $vtEspirado, ')
          ..write('frecRespTotal: $frecRespTotal, ')
          ..write('volMinuto: $volMinuto, ')
          ..write('fuga: $fuga, ')
          ..write('drivingPressure: $drivingPressure, ')
          ..write('complianceEstatica: $complianceEstatica, ')
          ..write('indiceoOxigenacion: $indiceoOxigenacion, ')
          ..write('pfRatio: $pfRatio, ')
          ..write('ardsBerlin: $ardsBerlin, ')
          ..write('notas: $notas, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    pacienteId,
    episodioId,
    timestamp,
    modo,
    fio2,
    peep,
    volumenTidal,
    pControl,
    frecRespProgramada,
    relIE,
    pSoporte,
    trigger,
    pPico,
    pMeseta,
    pMedia,
    vtEspirado,
    frecRespTotal,
    volMinuto,
    fuga,
    drivingPressure,
    complianceEstatica,
    indiceoOxigenacion,
    pfRatio,
    ardsBerlin,
    notas,
    invalidado,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VentilacionSavinaData &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.episodioId == this.episodioId &&
          other.timestamp == this.timestamp &&
          other.modo == this.modo &&
          other.fio2 == this.fio2 &&
          other.peep == this.peep &&
          other.volumenTidal == this.volumenTidal &&
          other.pControl == this.pControl &&
          other.frecRespProgramada == this.frecRespProgramada &&
          other.relIE == this.relIE &&
          other.pSoporte == this.pSoporte &&
          other.trigger == this.trigger &&
          other.pPico == this.pPico &&
          other.pMeseta == this.pMeseta &&
          other.pMedia == this.pMedia &&
          other.vtEspirado == this.vtEspirado &&
          other.frecRespTotal == this.frecRespTotal &&
          other.volMinuto == this.volMinuto &&
          other.fuga == this.fuga &&
          other.drivingPressure == this.drivingPressure &&
          other.complianceEstatica == this.complianceEstatica &&
          other.indiceoOxigenacion == this.indiceoOxigenacion &&
          other.pfRatio == this.pfRatio &&
          other.ardsBerlin == this.ardsBerlin &&
          other.notas == this.notas &&
          other.invalidado == this.invalidado);
}

class VentilacionSavinaCompanion
    extends UpdateCompanion<VentilacionSavinaData> {
  final Value<int> id;
  final Value<int?> pacienteId;
  final Value<int?> episodioId;
  final Value<DateTime> timestamp;
  final Value<String> modo;
  final Value<double?> fio2;
  final Value<double?> peep;
  final Value<double?> volumenTidal;
  final Value<double?> pControl;
  final Value<double?> frecRespProgramada;
  final Value<double?> relIE;
  final Value<double?> pSoporte;
  final Value<double?> trigger;
  final Value<double?> pPico;
  final Value<double?> pMeseta;
  final Value<double?> pMedia;
  final Value<double?> vtEspirado;
  final Value<double?> frecRespTotal;
  final Value<double?> volMinuto;
  final Value<double?> fuga;
  final Value<double?> drivingPressure;
  final Value<double?> complianceEstatica;
  final Value<double?> indiceoOxigenacion;
  final Value<double?> pfRatio;
  final Value<String?> ardsBerlin;
  final Value<String?> notas;
  final Value<bool> invalidado;
  const VentilacionSavinaCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.modo = const Value.absent(),
    this.fio2 = const Value.absent(),
    this.peep = const Value.absent(),
    this.volumenTidal = const Value.absent(),
    this.pControl = const Value.absent(),
    this.frecRespProgramada = const Value.absent(),
    this.relIE = const Value.absent(),
    this.pSoporte = const Value.absent(),
    this.trigger = const Value.absent(),
    this.pPico = const Value.absent(),
    this.pMeseta = const Value.absent(),
    this.pMedia = const Value.absent(),
    this.vtEspirado = const Value.absent(),
    this.frecRespTotal = const Value.absent(),
    this.volMinuto = const Value.absent(),
    this.fuga = const Value.absent(),
    this.drivingPressure = const Value.absent(),
    this.complianceEstatica = const Value.absent(),
    this.indiceoOxigenacion = const Value.absent(),
    this.pfRatio = const Value.absent(),
    this.ardsBerlin = const Value.absent(),
    this.notas = const Value.absent(),
    this.invalidado = const Value.absent(),
  });
  VentilacionSavinaCompanion.insert({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    required DateTime timestamp,
    required String modo,
    this.fio2 = const Value.absent(),
    this.peep = const Value.absent(),
    this.volumenTidal = const Value.absent(),
    this.pControl = const Value.absent(),
    this.frecRespProgramada = const Value.absent(),
    this.relIE = const Value.absent(),
    this.pSoporte = const Value.absent(),
    this.trigger = const Value.absent(),
    this.pPico = const Value.absent(),
    this.pMeseta = const Value.absent(),
    this.pMedia = const Value.absent(),
    this.vtEspirado = const Value.absent(),
    this.frecRespTotal = const Value.absent(),
    this.volMinuto = const Value.absent(),
    this.fuga = const Value.absent(),
    this.drivingPressure = const Value.absent(),
    this.complianceEstatica = const Value.absent(),
    this.indiceoOxigenacion = const Value.absent(),
    this.pfRatio = const Value.absent(),
    this.ardsBerlin = const Value.absent(),
    this.notas = const Value.absent(),
    this.invalidado = const Value.absent(),
  }) : timestamp = Value(timestamp),
       modo = Value(modo);
  static Insertable<VentilacionSavinaData> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<int>? episodioId,
    Expression<DateTime>? timestamp,
    Expression<String>? modo,
    Expression<double>? fio2,
    Expression<double>? peep,
    Expression<double>? volumenTidal,
    Expression<double>? pControl,
    Expression<double>? frecRespProgramada,
    Expression<double>? relIE,
    Expression<double>? pSoporte,
    Expression<double>? trigger,
    Expression<double>? pPico,
    Expression<double>? pMeseta,
    Expression<double>? pMedia,
    Expression<double>? vtEspirado,
    Expression<double>? frecRespTotal,
    Expression<double>? volMinuto,
    Expression<double>? fuga,
    Expression<double>? drivingPressure,
    Expression<double>? complianceEstatica,
    Expression<double>? indiceoOxigenacion,
    Expression<double>? pfRatio,
    Expression<String>? ardsBerlin,
    Expression<String>? notas,
    Expression<bool>? invalidado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (episodioId != null) 'episodio_id': episodioId,
      if (timestamp != null) 'timestamp': timestamp,
      if (modo != null) 'modo': modo,
      if (fio2 != null) 'fio2': fio2,
      if (peep != null) 'peep': peep,
      if (volumenTidal != null) 'volumen_tidal': volumenTidal,
      if (pControl != null) 'p_control': pControl,
      if (frecRespProgramada != null)
        'frec_resp_programada': frecRespProgramada,
      if (relIE != null) 'rel_i_e': relIE,
      if (pSoporte != null) 'p_soporte': pSoporte,
      if (trigger != null) 'trigger': trigger,
      if (pPico != null) 'p_pico': pPico,
      if (pMeseta != null) 'p_meseta': pMeseta,
      if (pMedia != null) 'p_media': pMedia,
      if (vtEspirado != null) 'vt_espirado': vtEspirado,
      if (frecRespTotal != null) 'frec_resp_total': frecRespTotal,
      if (volMinuto != null) 'vol_minuto': volMinuto,
      if (fuga != null) 'fuga': fuga,
      if (drivingPressure != null) 'driving_pressure': drivingPressure,
      if (complianceEstatica != null) 'compliance_estatica': complianceEstatica,
      if (indiceoOxigenacion != null) 'indiceo_oxigenacion': indiceoOxigenacion,
      if (pfRatio != null) 'pf_ratio': pfRatio,
      if (ardsBerlin != null) 'ards_berlin': ardsBerlin,
      if (notas != null) 'notas': notas,
      if (invalidado != null) 'invalidado': invalidado,
    });
  }

  VentilacionSavinaCompanion copyWith({
    Value<int>? id,
    Value<int?>? pacienteId,
    Value<int?>? episodioId,
    Value<DateTime>? timestamp,
    Value<String>? modo,
    Value<double?>? fio2,
    Value<double?>? peep,
    Value<double?>? volumenTidal,
    Value<double?>? pControl,
    Value<double?>? frecRespProgramada,
    Value<double?>? relIE,
    Value<double?>? pSoporte,
    Value<double?>? trigger,
    Value<double?>? pPico,
    Value<double?>? pMeseta,
    Value<double?>? pMedia,
    Value<double?>? vtEspirado,
    Value<double?>? frecRespTotal,
    Value<double?>? volMinuto,
    Value<double?>? fuga,
    Value<double?>? drivingPressure,
    Value<double?>? complianceEstatica,
    Value<double?>? indiceoOxigenacion,
    Value<double?>? pfRatio,
    Value<String?>? ardsBerlin,
    Value<String?>? notas,
    Value<bool>? invalidado,
  }) {
    return VentilacionSavinaCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      episodioId: episodioId ?? this.episodioId,
      timestamp: timestamp ?? this.timestamp,
      modo: modo ?? this.modo,
      fio2: fio2 ?? this.fio2,
      peep: peep ?? this.peep,
      volumenTidal: volumenTidal ?? this.volumenTidal,
      pControl: pControl ?? this.pControl,
      frecRespProgramada: frecRespProgramada ?? this.frecRespProgramada,
      relIE: relIE ?? this.relIE,
      pSoporte: pSoporte ?? this.pSoporte,
      trigger: trigger ?? this.trigger,
      pPico: pPico ?? this.pPico,
      pMeseta: pMeseta ?? this.pMeseta,
      pMedia: pMedia ?? this.pMedia,
      vtEspirado: vtEspirado ?? this.vtEspirado,
      frecRespTotal: frecRespTotal ?? this.frecRespTotal,
      volMinuto: volMinuto ?? this.volMinuto,
      fuga: fuga ?? this.fuga,
      drivingPressure: drivingPressure ?? this.drivingPressure,
      complianceEstatica: complianceEstatica ?? this.complianceEstatica,
      indiceoOxigenacion: indiceoOxigenacion ?? this.indiceoOxigenacion,
      pfRatio: pfRatio ?? this.pfRatio,
      ardsBerlin: ardsBerlin ?? this.ardsBerlin,
      notas: notas ?? this.notas,
      invalidado: invalidado ?? this.invalidado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (modo.present) {
      map['modo'] = Variable<String>(modo.value);
    }
    if (fio2.present) {
      map['fio2'] = Variable<double>(fio2.value);
    }
    if (peep.present) {
      map['peep'] = Variable<double>(peep.value);
    }
    if (volumenTidal.present) {
      map['volumen_tidal'] = Variable<double>(volumenTidal.value);
    }
    if (pControl.present) {
      map['p_control'] = Variable<double>(pControl.value);
    }
    if (frecRespProgramada.present) {
      map['frec_resp_programada'] = Variable<double>(frecRespProgramada.value);
    }
    if (relIE.present) {
      map['rel_i_e'] = Variable<double>(relIE.value);
    }
    if (pSoporte.present) {
      map['p_soporte'] = Variable<double>(pSoporte.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<double>(trigger.value);
    }
    if (pPico.present) {
      map['p_pico'] = Variable<double>(pPico.value);
    }
    if (pMeseta.present) {
      map['p_meseta'] = Variable<double>(pMeseta.value);
    }
    if (pMedia.present) {
      map['p_media'] = Variable<double>(pMedia.value);
    }
    if (vtEspirado.present) {
      map['vt_espirado'] = Variable<double>(vtEspirado.value);
    }
    if (frecRespTotal.present) {
      map['frec_resp_total'] = Variable<double>(frecRespTotal.value);
    }
    if (volMinuto.present) {
      map['vol_minuto'] = Variable<double>(volMinuto.value);
    }
    if (fuga.present) {
      map['fuga'] = Variable<double>(fuga.value);
    }
    if (drivingPressure.present) {
      map['driving_pressure'] = Variable<double>(drivingPressure.value);
    }
    if (complianceEstatica.present) {
      map['compliance_estatica'] = Variable<double>(complianceEstatica.value);
    }
    if (indiceoOxigenacion.present) {
      map['indiceo_oxigenacion'] = Variable<double>(indiceoOxigenacion.value);
    }
    if (pfRatio.present) {
      map['pf_ratio'] = Variable<double>(pfRatio.value);
    }
    if (ardsBerlin.present) {
      map['ards_berlin'] = Variable<String>(ardsBerlin.value);
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VentilacionSavinaCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('modo: $modo, ')
          ..write('fio2: $fio2, ')
          ..write('peep: $peep, ')
          ..write('volumenTidal: $volumenTidal, ')
          ..write('pControl: $pControl, ')
          ..write('frecRespProgramada: $frecRespProgramada, ')
          ..write('relIE: $relIE, ')
          ..write('pSoporte: $pSoporte, ')
          ..write('trigger: $trigger, ')
          ..write('pPico: $pPico, ')
          ..write('pMeseta: $pMeseta, ')
          ..write('pMedia: $pMedia, ')
          ..write('vtEspirado: $vtEspirado, ')
          ..write('frecRespTotal: $frecRespTotal, ')
          ..write('volMinuto: $volMinuto, ')
          ..write('fuga: $fuga, ')
          ..write('drivingPressure: $drivingPressure, ')
          ..write('complianceEstatica: $complianceEstatica, ')
          ..write('indiceoOxigenacion: $indiceoOxigenacion, ')
          ..write('pfRatio: $pfRatio, ')
          ..write('ardsBerlin: $ardsBerlin, ')
          ..write('notas: $notas, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }
}

class $SesionesHdTable extends SesionesHd
    with TableInfo<$SesionesHdTable, SesionesHdData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SesionesHdTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _fechaHoraInicioMeta = const VerificationMeta(
    'fechaHoraInicio',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHoraInicio =
      GeneratedColumn<DateTime>(
        'fecha_hora_inicio',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fechaHoraFinMeta = const VerificationMeta(
    'fechaHoraFin',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHoraFin = GeneratedColumn<DateTime>(
    'fecha_hora_fin',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tipoAccesoMeta = const VerificationMeta(
    'tipoAcceso',
  );
  @override
  late final GeneratedColumn<String> tipoAcceso = GeneratedColumn<String>(
    'tipo_acceso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lateralidadAccesoMeta = const VerificationMeta(
    'lateralidadAcceso',
  );
  @override
  late final GeneratedColumn<String> lateralidadAcceso =
      GeneratedColumn<String>(
        'lateralidad_acceso',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _tipoAccesoCateterMeta = const VerificationMeta(
    'tipoAccesoCateter',
  );
  @override
  late final GeneratedColumn<String> tipoAccesoCateter =
      GeneratedColumn<String>(
        'tipo_acceso_cateter',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _duracionProgramadaMinMeta =
      const VerificationMeta('duracionProgramadaMin');
  @override
  late final GeneratedColumn<int> duracionProgramadaMin = GeneratedColumn<int>(
    'duracion_programada_min',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _duracionRealMinMeta = const VerificationMeta(
    'duracionRealMin',
  );
  @override
  late final GeneratedColumn<int> duracionRealMin = GeneratedColumn<int>(
    'duracion_real_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qbMeta = const VerificationMeta('qb');
  @override
  late final GeneratedColumn<double> qb = GeneratedColumn<double>(
    'qb',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qdMeta = const VerificationMeta('qd');
  @override
  late final GeneratedColumn<double> qd = GeneratedColumn<double>(
    'qd',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dializadorTipoMeta = const VerificationMeta(
    'dializadorTipo',
  );
  @override
  late final GeneratedColumn<String> dializadorTipo = GeneratedColumn<String>(
    'dializador_tipo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dializadorSuperficieM2Meta =
      const VerificationMeta('dializadorSuperficieM2');
  @override
  late final GeneratedColumn<double> dializadorSuperficieM2 =
      GeneratedColumn<double>(
        'dializador_superficie_m2',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _dializadorKufMeta = const VerificationMeta(
    'dializadorKuf',
  );
  @override
  late final GeneratedColumn<double> dializadorKuf = GeneratedColumn<double>(
    'dializador_kuf',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _banoNaMeta = const VerificationMeta('banoNa');
  @override
  late final GeneratedColumn<double> banoNa = GeneratedColumn<double>(
    'bano_na',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _banoKMeta = const VerificationMeta('banoK');
  @override
  late final GeneratedColumn<double> banoK = GeneratedColumn<double>(
    'bano_k',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _banoCaMeta = const VerificationMeta('banoCa');
  @override
  late final GeneratedColumn<double> banoCa = GeneratedColumn<double>(
    'bano_ca',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _banoHco3Meta = const VerificationMeta(
    'banoHco3',
  );
  @override
  late final GeneratedColumn<double> banoHco3 = GeneratedColumn<double>(
    'bano_hco3',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _banoGlucosaMeta = const VerificationMeta(
    'banoGlucosa',
  );
  @override
  late final GeneratedColumn<double> banoGlucosa = GeneratedColumn<double>(
    'bano_glucosa',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ufTotalProgramadaMlMeta =
      const VerificationMeta('ufTotalProgramadaMl');
  @override
  late final GeneratedColumn<double> ufTotalProgramadaMl =
      GeneratedColumn<double>(
        'uf_total_programada_ml',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _ufTotalRealMlMeta = const VerificationMeta(
    'ufTotalRealMl',
  );
  @override
  late final GeneratedColumn<double> ufTotalRealMl = GeneratedColumn<double>(
    'uf_total_real_ml',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tasaUfMlKgHMeta = const VerificationMeta(
    'tasaUfMlKgH',
  );
  @override
  late final GeneratedColumn<double> tasaUfMlKgH = GeneratedColumn<double>(
    'tasa_uf_ml_kg_h',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tipoAnticoagulacionMeta =
      const VerificationMeta('tipoAnticoagulacion');
  @override
  late final GeneratedColumn<String> tipoAnticoagulacion =
      GeneratedColumn<String>(
        'tipo_anticoagulacion',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _heparinaBoloPorUIMeta = const VerificationMeta(
    'heparinaBoloPorUI',
  );
  @override
  late final GeneratedColumn<double> heparinaBoloPorUI =
      GeneratedColumn<double>(
        'heparina_bolo_por_u_i',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _heparinaMantenimientoUiHMeta =
      const VerificationMeta('heparinaMantenimientoUiH');
  @override
  late final GeneratedColumn<double> heparinaMantenimientoUiH =
      GeneratedColumn<double>(
        'heparina_mantenimiento_ui_h',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pesoPreHdKgMeta = const VerificationMeta(
    'pesoPreHdKg',
  );
  @override
  late final GeneratedColumn<double> pesoPreHdKg = GeneratedColumn<double>(
    'peso_pre_hd_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pesoPostHdKgMeta = const VerificationMeta(
    'pesoPostHdKg',
  );
  @override
  late final GeneratedColumn<double> pesoPostHdKg = GeneratedColumn<double>(
    'peso_post_hd_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pesoSecoObjetivoKgMeta =
      const VerificationMeta('pesoSecoObjetivoKg');
  @override
  late final GeneratedColumn<double> pesoSecoObjetivoKg =
      GeneratedColumn<double>(
        'peso_seco_objetivo_kg',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _ktvCalculadoMeta = const VerificationMeta(
    'ktvCalculado',
  );
  @override
  late final GeneratedColumn<double> ktvCalculado = GeneratedColumn<double>(
    'ktv_calculado',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urrCalculadoMeta = const VerificationMeta(
    'urrCalculado',
  );
  @override
  late final GeneratedColumn<double> urrCalculado = GeneratedColumn<double>(
    'urr_calculado',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eventosDuranteMeta = const VerificationMeta(
    'eventosDurante',
  );
  @override
  late final GeneratedColumn<String> eventosDurante = GeneratedColumn<String>(
    'eventos_durante',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _invalidadoMeta = const VerificationMeta(
    'invalidado',
  );
  @override
  late final GeneratedColumn<bool> invalidado = GeneratedColumn<bool>(
    'invalidado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("invalidado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    episodioId,
    fechaHoraInicio,
    fechaHoraFin,
    tipoAcceso,
    lateralidadAcceso,
    tipoAccesoCateter,
    duracionProgramadaMin,
    duracionRealMin,
    qb,
    qd,
    dializadorTipo,
    dializadorSuperficieM2,
    dializadorKuf,
    banoNa,
    banoK,
    banoCa,
    banoHco3,
    banoGlucosa,
    ufTotalProgramadaMl,
    ufTotalRealMl,
    tasaUfMlKgH,
    tipoAnticoagulacion,
    heparinaBoloPorUI,
    heparinaMantenimientoUiH,
    pesoPreHdKg,
    pesoPostHdKg,
    pesoSecoObjetivoKg,
    ktvCalculado,
    urrCalculado,
    eventosDurante,
    invalidado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sesiones_hd';
  @override
  VerificationContext validateIntegrity(
    Insertable<SesionesHdData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    }
    if (data.containsKey('fecha_hora_inicio')) {
      context.handle(
        _fechaHoraInicioMeta,
        fechaHoraInicio.isAcceptableOrUnknown(
          data['fecha_hora_inicio']!,
          _fechaHoraInicioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaHoraInicioMeta);
    }
    if (data.containsKey('fecha_hora_fin')) {
      context.handle(
        _fechaHoraFinMeta,
        fechaHoraFin.isAcceptableOrUnknown(
          data['fecha_hora_fin']!,
          _fechaHoraFinMeta,
        ),
      );
    }
    if (data.containsKey('tipo_acceso')) {
      context.handle(
        _tipoAccesoMeta,
        tipoAcceso.isAcceptableOrUnknown(data['tipo_acceso']!, _tipoAccesoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoAccesoMeta);
    }
    if (data.containsKey('lateralidad_acceso')) {
      context.handle(
        _lateralidadAccesoMeta,
        lateralidadAcceso.isAcceptableOrUnknown(
          data['lateralidad_acceso']!,
          _lateralidadAccesoMeta,
        ),
      );
    }
    if (data.containsKey('tipo_acceso_cateter')) {
      context.handle(
        _tipoAccesoCateterMeta,
        tipoAccesoCateter.isAcceptableOrUnknown(
          data['tipo_acceso_cateter']!,
          _tipoAccesoCateterMeta,
        ),
      );
    }
    if (data.containsKey('duracion_programada_min')) {
      context.handle(
        _duracionProgramadaMinMeta,
        duracionProgramadaMin.isAcceptableOrUnknown(
          data['duracion_programada_min']!,
          _duracionProgramadaMinMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_duracionProgramadaMinMeta);
    }
    if (data.containsKey('duracion_real_min')) {
      context.handle(
        _duracionRealMinMeta,
        duracionRealMin.isAcceptableOrUnknown(
          data['duracion_real_min']!,
          _duracionRealMinMeta,
        ),
      );
    }
    if (data.containsKey('qb')) {
      context.handle(_qbMeta, qb.isAcceptableOrUnknown(data['qb']!, _qbMeta));
    } else if (isInserting) {
      context.missing(_qbMeta);
    }
    if (data.containsKey('qd')) {
      context.handle(_qdMeta, qd.isAcceptableOrUnknown(data['qd']!, _qdMeta));
    } else if (isInserting) {
      context.missing(_qdMeta);
    }
    if (data.containsKey('dializador_tipo')) {
      context.handle(
        _dializadorTipoMeta,
        dializadorTipo.isAcceptableOrUnknown(
          data['dializador_tipo']!,
          _dializadorTipoMeta,
        ),
      );
    }
    if (data.containsKey('dializador_superficie_m2')) {
      context.handle(
        _dializadorSuperficieM2Meta,
        dializadorSuperficieM2.isAcceptableOrUnknown(
          data['dializador_superficie_m2']!,
          _dializadorSuperficieM2Meta,
        ),
      );
    }
    if (data.containsKey('dializador_kuf')) {
      context.handle(
        _dializadorKufMeta,
        dializadorKuf.isAcceptableOrUnknown(
          data['dializador_kuf']!,
          _dializadorKufMeta,
        ),
      );
    }
    if (data.containsKey('bano_na')) {
      context.handle(
        _banoNaMeta,
        banoNa.isAcceptableOrUnknown(data['bano_na']!, _banoNaMeta),
      );
    }
    if (data.containsKey('bano_k')) {
      context.handle(
        _banoKMeta,
        banoK.isAcceptableOrUnknown(data['bano_k']!, _banoKMeta),
      );
    }
    if (data.containsKey('bano_ca')) {
      context.handle(
        _banoCaMeta,
        banoCa.isAcceptableOrUnknown(data['bano_ca']!, _banoCaMeta),
      );
    }
    if (data.containsKey('bano_hco3')) {
      context.handle(
        _banoHco3Meta,
        banoHco3.isAcceptableOrUnknown(data['bano_hco3']!, _banoHco3Meta),
      );
    }
    if (data.containsKey('bano_glucosa')) {
      context.handle(
        _banoGlucosaMeta,
        banoGlucosa.isAcceptableOrUnknown(
          data['bano_glucosa']!,
          _banoGlucosaMeta,
        ),
      );
    }
    if (data.containsKey('uf_total_programada_ml')) {
      context.handle(
        _ufTotalProgramadaMlMeta,
        ufTotalProgramadaMl.isAcceptableOrUnknown(
          data['uf_total_programada_ml']!,
          _ufTotalProgramadaMlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ufTotalProgramadaMlMeta);
    }
    if (data.containsKey('uf_total_real_ml')) {
      context.handle(
        _ufTotalRealMlMeta,
        ufTotalRealMl.isAcceptableOrUnknown(
          data['uf_total_real_ml']!,
          _ufTotalRealMlMeta,
        ),
      );
    }
    if (data.containsKey('tasa_uf_ml_kg_h')) {
      context.handle(
        _tasaUfMlKgHMeta,
        tasaUfMlKgH.isAcceptableOrUnknown(
          data['tasa_uf_ml_kg_h']!,
          _tasaUfMlKgHMeta,
        ),
      );
    }
    if (data.containsKey('tipo_anticoagulacion')) {
      context.handle(
        _tipoAnticoagulacionMeta,
        tipoAnticoagulacion.isAcceptableOrUnknown(
          data['tipo_anticoagulacion']!,
          _tipoAnticoagulacionMeta,
        ),
      );
    }
    if (data.containsKey('heparina_bolo_por_u_i')) {
      context.handle(
        _heparinaBoloPorUIMeta,
        heparinaBoloPorUI.isAcceptableOrUnknown(
          data['heparina_bolo_por_u_i']!,
          _heparinaBoloPorUIMeta,
        ),
      );
    }
    if (data.containsKey('heparina_mantenimiento_ui_h')) {
      context.handle(
        _heparinaMantenimientoUiHMeta,
        heparinaMantenimientoUiH.isAcceptableOrUnknown(
          data['heparina_mantenimiento_ui_h']!,
          _heparinaMantenimientoUiHMeta,
        ),
      );
    }
    if (data.containsKey('peso_pre_hd_kg')) {
      context.handle(
        _pesoPreHdKgMeta,
        pesoPreHdKg.isAcceptableOrUnknown(
          data['peso_pre_hd_kg']!,
          _pesoPreHdKgMeta,
        ),
      );
    }
    if (data.containsKey('peso_post_hd_kg')) {
      context.handle(
        _pesoPostHdKgMeta,
        pesoPostHdKg.isAcceptableOrUnknown(
          data['peso_post_hd_kg']!,
          _pesoPostHdKgMeta,
        ),
      );
    }
    if (data.containsKey('peso_seco_objetivo_kg')) {
      context.handle(
        _pesoSecoObjetivoKgMeta,
        pesoSecoObjetivoKg.isAcceptableOrUnknown(
          data['peso_seco_objetivo_kg']!,
          _pesoSecoObjetivoKgMeta,
        ),
      );
    }
    if (data.containsKey('ktv_calculado')) {
      context.handle(
        _ktvCalculadoMeta,
        ktvCalculado.isAcceptableOrUnknown(
          data['ktv_calculado']!,
          _ktvCalculadoMeta,
        ),
      );
    }
    if (data.containsKey('urr_calculado')) {
      context.handle(
        _urrCalculadoMeta,
        urrCalculado.isAcceptableOrUnknown(
          data['urr_calculado']!,
          _urrCalculadoMeta,
        ),
      );
    }
    if (data.containsKey('eventos_durante')) {
      context.handle(
        _eventosDuranteMeta,
        eventosDurante.isAcceptableOrUnknown(
          data['eventos_durante']!,
          _eventosDuranteMeta,
        ),
      );
    }
    if (data.containsKey('invalidado')) {
      context.handle(
        _invalidadoMeta,
        invalidado.isAcceptableOrUnknown(data['invalidado']!, _invalidadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SesionesHdData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SesionesHdData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      ),
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      ),
      fechaHoraInicio: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora_inicio'],
      )!,
      fechaHoraFin: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora_fin'],
      ),
      tipoAcceso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_acceso'],
      )!,
      lateralidadAcceso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lateralidad_acceso'],
      ),
      tipoAccesoCateter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_acceso_cateter'],
      ),
      duracionProgramadaMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duracion_programada_min'],
      )!,
      duracionRealMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duracion_real_min'],
      ),
      qb: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}qb'],
      )!,
      qd: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}qd'],
      )!,
      dializadorTipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dializador_tipo'],
      ),
      dializadorSuperficieM2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dializador_superficie_m2'],
      ),
      dializadorKuf: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dializador_kuf'],
      ),
      banoNa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bano_na'],
      ),
      banoK: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bano_k'],
      ),
      banoCa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bano_ca'],
      ),
      banoHco3: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bano_hco3'],
      ),
      banoGlucosa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bano_glucosa'],
      ),
      ufTotalProgramadaMl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}uf_total_programada_ml'],
      )!,
      ufTotalRealMl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}uf_total_real_ml'],
      ),
      tasaUfMlKgH: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tasa_uf_ml_kg_h'],
      ),
      tipoAnticoagulacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_anticoagulacion'],
      ),
      heparinaBoloPorUI: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heparina_bolo_por_u_i'],
      ),
      heparinaMantenimientoUiH: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heparina_mantenimiento_ui_h'],
      ),
      pesoPreHdKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peso_pre_hd_kg'],
      ),
      pesoPostHdKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peso_post_hd_kg'],
      ),
      pesoSecoObjetivoKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}peso_seco_objetivo_kg'],
      ),
      ktvCalculado: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ktv_calculado'],
      ),
      urrCalculado: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}urr_calculado'],
      ),
      eventosDurante: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}eventos_durante'],
      ),
      invalidado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}invalidado'],
      )!,
    );
  }

  @override
  $SesionesHdTable createAlias(String alias) {
    return $SesionesHdTable(attachedDatabase, alias);
  }
}

class SesionesHdData extends DataClass implements Insertable<SesionesHdData> {
  final int id;
  final int? pacienteId;
  final int? episodioId;
  final DateTime fechaHoraInicio;
  final DateTime? fechaHoraFin;
  final String tipoAcceso;
  final String? lateralidadAcceso;
  final String? tipoAccesoCateter;
  final int duracionProgramadaMin;
  final int? duracionRealMin;
  final double qb;
  final double qd;
  final String? dializadorTipo;
  final double? dializadorSuperficieM2;
  final double? dializadorKuf;
  final double? banoNa;
  final double? banoK;
  final double? banoCa;
  final double? banoHco3;
  final double? banoGlucosa;
  final double ufTotalProgramadaMl;
  final double? ufTotalRealMl;
  final double? tasaUfMlKgH;
  final String? tipoAnticoagulacion;
  final double? heparinaBoloPorUI;
  final double? heparinaMantenimientoUiH;
  final double? pesoPreHdKg;
  final double? pesoPostHdKg;
  final double? pesoSecoObjetivoKg;
  final double? ktvCalculado;
  final double? urrCalculado;
  final String? eventosDurante;
  final bool invalidado;
  const SesionesHdData({
    required this.id,
    this.pacienteId,
    this.episodioId,
    required this.fechaHoraInicio,
    this.fechaHoraFin,
    required this.tipoAcceso,
    this.lateralidadAcceso,
    this.tipoAccesoCateter,
    required this.duracionProgramadaMin,
    this.duracionRealMin,
    required this.qb,
    required this.qd,
    this.dializadorTipo,
    this.dializadorSuperficieM2,
    this.dializadorKuf,
    this.banoNa,
    this.banoK,
    this.banoCa,
    this.banoHco3,
    this.banoGlucosa,
    required this.ufTotalProgramadaMl,
    this.ufTotalRealMl,
    this.tasaUfMlKgH,
    this.tipoAnticoagulacion,
    this.heparinaBoloPorUI,
    this.heparinaMantenimientoUiH,
    this.pesoPreHdKg,
    this.pesoPostHdKg,
    this.pesoSecoObjetivoKg,
    this.ktvCalculado,
    this.urrCalculado,
    this.eventosDurante,
    required this.invalidado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || pacienteId != null) {
      map['paciente_id'] = Variable<int>(pacienteId);
    }
    if (!nullToAbsent || episodioId != null) {
      map['episodio_id'] = Variable<int>(episodioId);
    }
    map['fecha_hora_inicio'] = Variable<DateTime>(fechaHoraInicio);
    if (!nullToAbsent || fechaHoraFin != null) {
      map['fecha_hora_fin'] = Variable<DateTime>(fechaHoraFin);
    }
    map['tipo_acceso'] = Variable<String>(tipoAcceso);
    if (!nullToAbsent || lateralidadAcceso != null) {
      map['lateralidad_acceso'] = Variable<String>(lateralidadAcceso);
    }
    if (!nullToAbsent || tipoAccesoCateter != null) {
      map['tipo_acceso_cateter'] = Variable<String>(tipoAccesoCateter);
    }
    map['duracion_programada_min'] = Variable<int>(duracionProgramadaMin);
    if (!nullToAbsent || duracionRealMin != null) {
      map['duracion_real_min'] = Variable<int>(duracionRealMin);
    }
    map['qb'] = Variable<double>(qb);
    map['qd'] = Variable<double>(qd);
    if (!nullToAbsent || dializadorTipo != null) {
      map['dializador_tipo'] = Variable<String>(dializadorTipo);
    }
    if (!nullToAbsent || dializadorSuperficieM2 != null) {
      map['dializador_superficie_m2'] = Variable<double>(
        dializadorSuperficieM2,
      );
    }
    if (!nullToAbsent || dializadorKuf != null) {
      map['dializador_kuf'] = Variable<double>(dializadorKuf);
    }
    if (!nullToAbsent || banoNa != null) {
      map['bano_na'] = Variable<double>(banoNa);
    }
    if (!nullToAbsent || banoK != null) {
      map['bano_k'] = Variable<double>(banoK);
    }
    if (!nullToAbsent || banoCa != null) {
      map['bano_ca'] = Variable<double>(banoCa);
    }
    if (!nullToAbsent || banoHco3 != null) {
      map['bano_hco3'] = Variable<double>(banoHco3);
    }
    if (!nullToAbsent || banoGlucosa != null) {
      map['bano_glucosa'] = Variable<double>(banoGlucosa);
    }
    map['uf_total_programada_ml'] = Variable<double>(ufTotalProgramadaMl);
    if (!nullToAbsent || ufTotalRealMl != null) {
      map['uf_total_real_ml'] = Variable<double>(ufTotalRealMl);
    }
    if (!nullToAbsent || tasaUfMlKgH != null) {
      map['tasa_uf_ml_kg_h'] = Variable<double>(tasaUfMlKgH);
    }
    if (!nullToAbsent || tipoAnticoagulacion != null) {
      map['tipo_anticoagulacion'] = Variable<String>(tipoAnticoagulacion);
    }
    if (!nullToAbsent || heparinaBoloPorUI != null) {
      map['heparina_bolo_por_u_i'] = Variable<double>(heparinaBoloPorUI);
    }
    if (!nullToAbsent || heparinaMantenimientoUiH != null) {
      map['heparina_mantenimiento_ui_h'] = Variable<double>(
        heparinaMantenimientoUiH,
      );
    }
    if (!nullToAbsent || pesoPreHdKg != null) {
      map['peso_pre_hd_kg'] = Variable<double>(pesoPreHdKg);
    }
    if (!nullToAbsent || pesoPostHdKg != null) {
      map['peso_post_hd_kg'] = Variable<double>(pesoPostHdKg);
    }
    if (!nullToAbsent || pesoSecoObjetivoKg != null) {
      map['peso_seco_objetivo_kg'] = Variable<double>(pesoSecoObjetivoKg);
    }
    if (!nullToAbsent || ktvCalculado != null) {
      map['ktv_calculado'] = Variable<double>(ktvCalculado);
    }
    if (!nullToAbsent || urrCalculado != null) {
      map['urr_calculado'] = Variable<double>(urrCalculado);
    }
    if (!nullToAbsent || eventosDurante != null) {
      map['eventos_durante'] = Variable<String>(eventosDurante);
    }
    map['invalidado'] = Variable<bool>(invalidado);
    return map;
  }

  SesionesHdCompanion toCompanion(bool nullToAbsent) {
    return SesionesHdCompanion(
      id: Value(id),
      pacienteId: pacienteId == null && nullToAbsent
          ? const Value.absent()
          : Value(pacienteId),
      episodioId: episodioId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodioId),
      fechaHoraInicio: Value(fechaHoraInicio),
      fechaHoraFin: fechaHoraFin == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaHoraFin),
      tipoAcceso: Value(tipoAcceso),
      lateralidadAcceso: lateralidadAcceso == null && nullToAbsent
          ? const Value.absent()
          : Value(lateralidadAcceso),
      tipoAccesoCateter: tipoAccesoCateter == null && nullToAbsent
          ? const Value.absent()
          : Value(tipoAccesoCateter),
      duracionProgramadaMin: Value(duracionProgramadaMin),
      duracionRealMin: duracionRealMin == null && nullToAbsent
          ? const Value.absent()
          : Value(duracionRealMin),
      qb: Value(qb),
      qd: Value(qd),
      dializadorTipo: dializadorTipo == null && nullToAbsent
          ? const Value.absent()
          : Value(dializadorTipo),
      dializadorSuperficieM2: dializadorSuperficieM2 == null && nullToAbsent
          ? const Value.absent()
          : Value(dializadorSuperficieM2),
      dializadorKuf: dializadorKuf == null && nullToAbsent
          ? const Value.absent()
          : Value(dializadorKuf),
      banoNa: banoNa == null && nullToAbsent
          ? const Value.absent()
          : Value(banoNa),
      banoK: banoK == null && nullToAbsent
          ? const Value.absent()
          : Value(banoK),
      banoCa: banoCa == null && nullToAbsent
          ? const Value.absent()
          : Value(banoCa),
      banoHco3: banoHco3 == null && nullToAbsent
          ? const Value.absent()
          : Value(banoHco3),
      banoGlucosa: banoGlucosa == null && nullToAbsent
          ? const Value.absent()
          : Value(banoGlucosa),
      ufTotalProgramadaMl: Value(ufTotalProgramadaMl),
      ufTotalRealMl: ufTotalRealMl == null && nullToAbsent
          ? const Value.absent()
          : Value(ufTotalRealMl),
      tasaUfMlKgH: tasaUfMlKgH == null && nullToAbsent
          ? const Value.absent()
          : Value(tasaUfMlKgH),
      tipoAnticoagulacion: tipoAnticoagulacion == null && nullToAbsent
          ? const Value.absent()
          : Value(tipoAnticoagulacion),
      heparinaBoloPorUI: heparinaBoloPorUI == null && nullToAbsent
          ? const Value.absent()
          : Value(heparinaBoloPorUI),
      heparinaMantenimientoUiH: heparinaMantenimientoUiH == null && nullToAbsent
          ? const Value.absent()
          : Value(heparinaMantenimientoUiH),
      pesoPreHdKg: pesoPreHdKg == null && nullToAbsent
          ? const Value.absent()
          : Value(pesoPreHdKg),
      pesoPostHdKg: pesoPostHdKg == null && nullToAbsent
          ? const Value.absent()
          : Value(pesoPostHdKg),
      pesoSecoObjetivoKg: pesoSecoObjetivoKg == null && nullToAbsent
          ? const Value.absent()
          : Value(pesoSecoObjetivoKg),
      ktvCalculado: ktvCalculado == null && nullToAbsent
          ? const Value.absent()
          : Value(ktvCalculado),
      urrCalculado: urrCalculado == null && nullToAbsent
          ? const Value.absent()
          : Value(urrCalculado),
      eventosDurante: eventosDurante == null && nullToAbsent
          ? const Value.absent()
          : Value(eventosDurante),
      invalidado: Value(invalidado),
    );
  }

  factory SesionesHdData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SesionesHdData(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int?>(json['pacienteId']),
      episodioId: serializer.fromJson<int?>(json['episodioId']),
      fechaHoraInicio: serializer.fromJson<DateTime>(json['fechaHoraInicio']),
      fechaHoraFin: serializer.fromJson<DateTime?>(json['fechaHoraFin']),
      tipoAcceso: serializer.fromJson<String>(json['tipoAcceso']),
      lateralidadAcceso: serializer.fromJson<String?>(
        json['lateralidadAcceso'],
      ),
      tipoAccesoCateter: serializer.fromJson<String?>(
        json['tipoAccesoCateter'],
      ),
      duracionProgramadaMin: serializer.fromJson<int>(
        json['duracionProgramadaMin'],
      ),
      duracionRealMin: serializer.fromJson<int?>(json['duracionRealMin']),
      qb: serializer.fromJson<double>(json['qb']),
      qd: serializer.fromJson<double>(json['qd']),
      dializadorTipo: serializer.fromJson<String?>(json['dializadorTipo']),
      dializadorSuperficieM2: serializer.fromJson<double?>(
        json['dializadorSuperficieM2'],
      ),
      dializadorKuf: serializer.fromJson<double?>(json['dializadorKuf']),
      banoNa: serializer.fromJson<double?>(json['banoNa']),
      banoK: serializer.fromJson<double?>(json['banoK']),
      banoCa: serializer.fromJson<double?>(json['banoCa']),
      banoHco3: serializer.fromJson<double?>(json['banoHco3']),
      banoGlucosa: serializer.fromJson<double?>(json['banoGlucosa']),
      ufTotalProgramadaMl: serializer.fromJson<double>(
        json['ufTotalProgramadaMl'],
      ),
      ufTotalRealMl: serializer.fromJson<double?>(json['ufTotalRealMl']),
      tasaUfMlKgH: serializer.fromJson<double?>(json['tasaUfMlKgH']),
      tipoAnticoagulacion: serializer.fromJson<String?>(
        json['tipoAnticoagulacion'],
      ),
      heparinaBoloPorUI: serializer.fromJson<double?>(
        json['heparinaBoloPorUI'],
      ),
      heparinaMantenimientoUiH: serializer.fromJson<double?>(
        json['heparinaMantenimientoUiH'],
      ),
      pesoPreHdKg: serializer.fromJson<double?>(json['pesoPreHdKg']),
      pesoPostHdKg: serializer.fromJson<double?>(json['pesoPostHdKg']),
      pesoSecoObjetivoKg: serializer.fromJson<double?>(
        json['pesoSecoObjetivoKg'],
      ),
      ktvCalculado: serializer.fromJson<double?>(json['ktvCalculado']),
      urrCalculado: serializer.fromJson<double?>(json['urrCalculado']),
      eventosDurante: serializer.fromJson<String?>(json['eventosDurante']),
      invalidado: serializer.fromJson<bool>(json['invalidado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int?>(pacienteId),
      'episodioId': serializer.toJson<int?>(episodioId),
      'fechaHoraInicio': serializer.toJson<DateTime>(fechaHoraInicio),
      'fechaHoraFin': serializer.toJson<DateTime?>(fechaHoraFin),
      'tipoAcceso': serializer.toJson<String>(tipoAcceso),
      'lateralidadAcceso': serializer.toJson<String?>(lateralidadAcceso),
      'tipoAccesoCateter': serializer.toJson<String?>(tipoAccesoCateter),
      'duracionProgramadaMin': serializer.toJson<int>(duracionProgramadaMin),
      'duracionRealMin': serializer.toJson<int?>(duracionRealMin),
      'qb': serializer.toJson<double>(qb),
      'qd': serializer.toJson<double>(qd),
      'dializadorTipo': serializer.toJson<String?>(dializadorTipo),
      'dializadorSuperficieM2': serializer.toJson<double?>(
        dializadorSuperficieM2,
      ),
      'dializadorKuf': serializer.toJson<double?>(dializadorKuf),
      'banoNa': serializer.toJson<double?>(banoNa),
      'banoK': serializer.toJson<double?>(banoK),
      'banoCa': serializer.toJson<double?>(banoCa),
      'banoHco3': serializer.toJson<double?>(banoHco3),
      'banoGlucosa': serializer.toJson<double?>(banoGlucosa),
      'ufTotalProgramadaMl': serializer.toJson<double>(ufTotalProgramadaMl),
      'ufTotalRealMl': serializer.toJson<double?>(ufTotalRealMl),
      'tasaUfMlKgH': serializer.toJson<double?>(tasaUfMlKgH),
      'tipoAnticoagulacion': serializer.toJson<String?>(tipoAnticoagulacion),
      'heparinaBoloPorUI': serializer.toJson<double?>(heparinaBoloPorUI),
      'heparinaMantenimientoUiH': serializer.toJson<double?>(
        heparinaMantenimientoUiH,
      ),
      'pesoPreHdKg': serializer.toJson<double?>(pesoPreHdKg),
      'pesoPostHdKg': serializer.toJson<double?>(pesoPostHdKg),
      'pesoSecoObjetivoKg': serializer.toJson<double?>(pesoSecoObjetivoKg),
      'ktvCalculado': serializer.toJson<double?>(ktvCalculado),
      'urrCalculado': serializer.toJson<double?>(urrCalculado),
      'eventosDurante': serializer.toJson<String?>(eventosDurante),
      'invalidado': serializer.toJson<bool>(invalidado),
    };
  }

  SesionesHdData copyWith({
    int? id,
    Value<int?> pacienteId = const Value.absent(),
    Value<int?> episodioId = const Value.absent(),
    DateTime? fechaHoraInicio,
    Value<DateTime?> fechaHoraFin = const Value.absent(),
    String? tipoAcceso,
    Value<String?> lateralidadAcceso = const Value.absent(),
    Value<String?> tipoAccesoCateter = const Value.absent(),
    int? duracionProgramadaMin,
    Value<int?> duracionRealMin = const Value.absent(),
    double? qb,
    double? qd,
    Value<String?> dializadorTipo = const Value.absent(),
    Value<double?> dializadorSuperficieM2 = const Value.absent(),
    Value<double?> dializadorKuf = const Value.absent(),
    Value<double?> banoNa = const Value.absent(),
    Value<double?> banoK = const Value.absent(),
    Value<double?> banoCa = const Value.absent(),
    Value<double?> banoHco3 = const Value.absent(),
    Value<double?> banoGlucosa = const Value.absent(),
    double? ufTotalProgramadaMl,
    Value<double?> ufTotalRealMl = const Value.absent(),
    Value<double?> tasaUfMlKgH = const Value.absent(),
    Value<String?> tipoAnticoagulacion = const Value.absent(),
    Value<double?> heparinaBoloPorUI = const Value.absent(),
    Value<double?> heparinaMantenimientoUiH = const Value.absent(),
    Value<double?> pesoPreHdKg = const Value.absent(),
    Value<double?> pesoPostHdKg = const Value.absent(),
    Value<double?> pesoSecoObjetivoKg = const Value.absent(),
    Value<double?> ktvCalculado = const Value.absent(),
    Value<double?> urrCalculado = const Value.absent(),
    Value<String?> eventosDurante = const Value.absent(),
    bool? invalidado,
  }) => SesionesHdData(
    id: id ?? this.id,
    pacienteId: pacienteId.present ? pacienteId.value : this.pacienteId,
    episodioId: episodioId.present ? episodioId.value : this.episodioId,
    fechaHoraInicio: fechaHoraInicio ?? this.fechaHoraInicio,
    fechaHoraFin: fechaHoraFin.present ? fechaHoraFin.value : this.fechaHoraFin,
    tipoAcceso: tipoAcceso ?? this.tipoAcceso,
    lateralidadAcceso: lateralidadAcceso.present
        ? lateralidadAcceso.value
        : this.lateralidadAcceso,
    tipoAccesoCateter: tipoAccesoCateter.present
        ? tipoAccesoCateter.value
        : this.tipoAccesoCateter,
    duracionProgramadaMin: duracionProgramadaMin ?? this.duracionProgramadaMin,
    duracionRealMin: duracionRealMin.present
        ? duracionRealMin.value
        : this.duracionRealMin,
    qb: qb ?? this.qb,
    qd: qd ?? this.qd,
    dializadorTipo: dializadorTipo.present
        ? dializadorTipo.value
        : this.dializadorTipo,
    dializadorSuperficieM2: dializadorSuperficieM2.present
        ? dializadorSuperficieM2.value
        : this.dializadorSuperficieM2,
    dializadorKuf: dializadorKuf.present
        ? dializadorKuf.value
        : this.dializadorKuf,
    banoNa: banoNa.present ? banoNa.value : this.banoNa,
    banoK: banoK.present ? banoK.value : this.banoK,
    banoCa: banoCa.present ? banoCa.value : this.banoCa,
    banoHco3: banoHco3.present ? banoHco3.value : this.banoHco3,
    banoGlucosa: banoGlucosa.present ? banoGlucosa.value : this.banoGlucosa,
    ufTotalProgramadaMl: ufTotalProgramadaMl ?? this.ufTotalProgramadaMl,
    ufTotalRealMl: ufTotalRealMl.present
        ? ufTotalRealMl.value
        : this.ufTotalRealMl,
    tasaUfMlKgH: tasaUfMlKgH.present ? tasaUfMlKgH.value : this.tasaUfMlKgH,
    tipoAnticoagulacion: tipoAnticoagulacion.present
        ? tipoAnticoagulacion.value
        : this.tipoAnticoagulacion,
    heparinaBoloPorUI: heparinaBoloPorUI.present
        ? heparinaBoloPorUI.value
        : this.heparinaBoloPorUI,
    heparinaMantenimientoUiH: heparinaMantenimientoUiH.present
        ? heparinaMantenimientoUiH.value
        : this.heparinaMantenimientoUiH,
    pesoPreHdKg: pesoPreHdKg.present ? pesoPreHdKg.value : this.pesoPreHdKg,
    pesoPostHdKg: pesoPostHdKg.present ? pesoPostHdKg.value : this.pesoPostHdKg,
    pesoSecoObjetivoKg: pesoSecoObjetivoKg.present
        ? pesoSecoObjetivoKg.value
        : this.pesoSecoObjetivoKg,
    ktvCalculado: ktvCalculado.present ? ktvCalculado.value : this.ktvCalculado,
    urrCalculado: urrCalculado.present ? urrCalculado.value : this.urrCalculado,
    eventosDurante: eventosDurante.present
        ? eventosDurante.value
        : this.eventosDurante,
    invalidado: invalidado ?? this.invalidado,
  );
  SesionesHdData copyWithCompanion(SesionesHdCompanion data) {
    return SesionesHdData(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      fechaHoraInicio: data.fechaHoraInicio.present
          ? data.fechaHoraInicio.value
          : this.fechaHoraInicio,
      fechaHoraFin: data.fechaHoraFin.present
          ? data.fechaHoraFin.value
          : this.fechaHoraFin,
      tipoAcceso: data.tipoAcceso.present
          ? data.tipoAcceso.value
          : this.tipoAcceso,
      lateralidadAcceso: data.lateralidadAcceso.present
          ? data.lateralidadAcceso.value
          : this.lateralidadAcceso,
      tipoAccesoCateter: data.tipoAccesoCateter.present
          ? data.tipoAccesoCateter.value
          : this.tipoAccesoCateter,
      duracionProgramadaMin: data.duracionProgramadaMin.present
          ? data.duracionProgramadaMin.value
          : this.duracionProgramadaMin,
      duracionRealMin: data.duracionRealMin.present
          ? data.duracionRealMin.value
          : this.duracionRealMin,
      qb: data.qb.present ? data.qb.value : this.qb,
      qd: data.qd.present ? data.qd.value : this.qd,
      dializadorTipo: data.dializadorTipo.present
          ? data.dializadorTipo.value
          : this.dializadorTipo,
      dializadorSuperficieM2: data.dializadorSuperficieM2.present
          ? data.dializadorSuperficieM2.value
          : this.dializadorSuperficieM2,
      dializadorKuf: data.dializadorKuf.present
          ? data.dializadorKuf.value
          : this.dializadorKuf,
      banoNa: data.banoNa.present ? data.banoNa.value : this.banoNa,
      banoK: data.banoK.present ? data.banoK.value : this.banoK,
      banoCa: data.banoCa.present ? data.banoCa.value : this.banoCa,
      banoHco3: data.banoHco3.present ? data.banoHco3.value : this.banoHco3,
      banoGlucosa: data.banoGlucosa.present
          ? data.banoGlucosa.value
          : this.banoGlucosa,
      ufTotalProgramadaMl: data.ufTotalProgramadaMl.present
          ? data.ufTotalProgramadaMl.value
          : this.ufTotalProgramadaMl,
      ufTotalRealMl: data.ufTotalRealMl.present
          ? data.ufTotalRealMl.value
          : this.ufTotalRealMl,
      tasaUfMlKgH: data.tasaUfMlKgH.present
          ? data.tasaUfMlKgH.value
          : this.tasaUfMlKgH,
      tipoAnticoagulacion: data.tipoAnticoagulacion.present
          ? data.tipoAnticoagulacion.value
          : this.tipoAnticoagulacion,
      heparinaBoloPorUI: data.heparinaBoloPorUI.present
          ? data.heparinaBoloPorUI.value
          : this.heparinaBoloPorUI,
      heparinaMantenimientoUiH: data.heparinaMantenimientoUiH.present
          ? data.heparinaMantenimientoUiH.value
          : this.heparinaMantenimientoUiH,
      pesoPreHdKg: data.pesoPreHdKg.present
          ? data.pesoPreHdKg.value
          : this.pesoPreHdKg,
      pesoPostHdKg: data.pesoPostHdKg.present
          ? data.pesoPostHdKg.value
          : this.pesoPostHdKg,
      pesoSecoObjetivoKg: data.pesoSecoObjetivoKg.present
          ? data.pesoSecoObjetivoKg.value
          : this.pesoSecoObjetivoKg,
      ktvCalculado: data.ktvCalculado.present
          ? data.ktvCalculado.value
          : this.ktvCalculado,
      urrCalculado: data.urrCalculado.present
          ? data.urrCalculado.value
          : this.urrCalculado,
      eventosDurante: data.eventosDurante.present
          ? data.eventosDurante.value
          : this.eventosDurante,
      invalidado: data.invalidado.present
          ? data.invalidado.value
          : this.invalidado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SesionesHdData(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('fechaHoraInicio: $fechaHoraInicio, ')
          ..write('fechaHoraFin: $fechaHoraFin, ')
          ..write('tipoAcceso: $tipoAcceso, ')
          ..write('lateralidadAcceso: $lateralidadAcceso, ')
          ..write('tipoAccesoCateter: $tipoAccesoCateter, ')
          ..write('duracionProgramadaMin: $duracionProgramadaMin, ')
          ..write('duracionRealMin: $duracionRealMin, ')
          ..write('qb: $qb, ')
          ..write('qd: $qd, ')
          ..write('dializadorTipo: $dializadorTipo, ')
          ..write('dializadorSuperficieM2: $dializadorSuperficieM2, ')
          ..write('dializadorKuf: $dializadorKuf, ')
          ..write('banoNa: $banoNa, ')
          ..write('banoK: $banoK, ')
          ..write('banoCa: $banoCa, ')
          ..write('banoHco3: $banoHco3, ')
          ..write('banoGlucosa: $banoGlucosa, ')
          ..write('ufTotalProgramadaMl: $ufTotalProgramadaMl, ')
          ..write('ufTotalRealMl: $ufTotalRealMl, ')
          ..write('tasaUfMlKgH: $tasaUfMlKgH, ')
          ..write('tipoAnticoagulacion: $tipoAnticoagulacion, ')
          ..write('heparinaBoloPorUI: $heparinaBoloPorUI, ')
          ..write('heparinaMantenimientoUiH: $heparinaMantenimientoUiH, ')
          ..write('pesoPreHdKg: $pesoPreHdKg, ')
          ..write('pesoPostHdKg: $pesoPostHdKg, ')
          ..write('pesoSecoObjetivoKg: $pesoSecoObjetivoKg, ')
          ..write('ktvCalculado: $ktvCalculado, ')
          ..write('urrCalculado: $urrCalculado, ')
          ..write('eventosDurante: $eventosDurante, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    pacienteId,
    episodioId,
    fechaHoraInicio,
    fechaHoraFin,
    tipoAcceso,
    lateralidadAcceso,
    tipoAccesoCateter,
    duracionProgramadaMin,
    duracionRealMin,
    qb,
    qd,
    dializadorTipo,
    dializadorSuperficieM2,
    dializadorKuf,
    banoNa,
    banoK,
    banoCa,
    banoHco3,
    banoGlucosa,
    ufTotalProgramadaMl,
    ufTotalRealMl,
    tasaUfMlKgH,
    tipoAnticoagulacion,
    heparinaBoloPorUI,
    heparinaMantenimientoUiH,
    pesoPreHdKg,
    pesoPostHdKg,
    pesoSecoObjetivoKg,
    ktvCalculado,
    urrCalculado,
    eventosDurante,
    invalidado,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SesionesHdData &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.episodioId == this.episodioId &&
          other.fechaHoraInicio == this.fechaHoraInicio &&
          other.fechaHoraFin == this.fechaHoraFin &&
          other.tipoAcceso == this.tipoAcceso &&
          other.lateralidadAcceso == this.lateralidadAcceso &&
          other.tipoAccesoCateter == this.tipoAccesoCateter &&
          other.duracionProgramadaMin == this.duracionProgramadaMin &&
          other.duracionRealMin == this.duracionRealMin &&
          other.qb == this.qb &&
          other.qd == this.qd &&
          other.dializadorTipo == this.dializadorTipo &&
          other.dializadorSuperficieM2 == this.dializadorSuperficieM2 &&
          other.dializadorKuf == this.dializadorKuf &&
          other.banoNa == this.banoNa &&
          other.banoK == this.banoK &&
          other.banoCa == this.banoCa &&
          other.banoHco3 == this.banoHco3 &&
          other.banoGlucosa == this.banoGlucosa &&
          other.ufTotalProgramadaMl == this.ufTotalProgramadaMl &&
          other.ufTotalRealMl == this.ufTotalRealMl &&
          other.tasaUfMlKgH == this.tasaUfMlKgH &&
          other.tipoAnticoagulacion == this.tipoAnticoagulacion &&
          other.heparinaBoloPorUI == this.heparinaBoloPorUI &&
          other.heparinaMantenimientoUiH == this.heparinaMantenimientoUiH &&
          other.pesoPreHdKg == this.pesoPreHdKg &&
          other.pesoPostHdKg == this.pesoPostHdKg &&
          other.pesoSecoObjetivoKg == this.pesoSecoObjetivoKg &&
          other.ktvCalculado == this.ktvCalculado &&
          other.urrCalculado == this.urrCalculado &&
          other.eventosDurante == this.eventosDurante &&
          other.invalidado == this.invalidado);
}

class SesionesHdCompanion extends UpdateCompanion<SesionesHdData> {
  final Value<int> id;
  final Value<int?> pacienteId;
  final Value<int?> episodioId;
  final Value<DateTime> fechaHoraInicio;
  final Value<DateTime?> fechaHoraFin;
  final Value<String> tipoAcceso;
  final Value<String?> lateralidadAcceso;
  final Value<String?> tipoAccesoCateter;
  final Value<int> duracionProgramadaMin;
  final Value<int?> duracionRealMin;
  final Value<double> qb;
  final Value<double> qd;
  final Value<String?> dializadorTipo;
  final Value<double?> dializadorSuperficieM2;
  final Value<double?> dializadorKuf;
  final Value<double?> banoNa;
  final Value<double?> banoK;
  final Value<double?> banoCa;
  final Value<double?> banoHco3;
  final Value<double?> banoGlucosa;
  final Value<double> ufTotalProgramadaMl;
  final Value<double?> ufTotalRealMl;
  final Value<double?> tasaUfMlKgH;
  final Value<String?> tipoAnticoagulacion;
  final Value<double?> heparinaBoloPorUI;
  final Value<double?> heparinaMantenimientoUiH;
  final Value<double?> pesoPreHdKg;
  final Value<double?> pesoPostHdKg;
  final Value<double?> pesoSecoObjetivoKg;
  final Value<double?> ktvCalculado;
  final Value<double?> urrCalculado;
  final Value<String?> eventosDurante;
  final Value<bool> invalidado;
  const SesionesHdCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.fechaHoraInicio = const Value.absent(),
    this.fechaHoraFin = const Value.absent(),
    this.tipoAcceso = const Value.absent(),
    this.lateralidadAcceso = const Value.absent(),
    this.tipoAccesoCateter = const Value.absent(),
    this.duracionProgramadaMin = const Value.absent(),
    this.duracionRealMin = const Value.absent(),
    this.qb = const Value.absent(),
    this.qd = const Value.absent(),
    this.dializadorTipo = const Value.absent(),
    this.dializadorSuperficieM2 = const Value.absent(),
    this.dializadorKuf = const Value.absent(),
    this.banoNa = const Value.absent(),
    this.banoK = const Value.absent(),
    this.banoCa = const Value.absent(),
    this.banoHco3 = const Value.absent(),
    this.banoGlucosa = const Value.absent(),
    this.ufTotalProgramadaMl = const Value.absent(),
    this.ufTotalRealMl = const Value.absent(),
    this.tasaUfMlKgH = const Value.absent(),
    this.tipoAnticoagulacion = const Value.absent(),
    this.heparinaBoloPorUI = const Value.absent(),
    this.heparinaMantenimientoUiH = const Value.absent(),
    this.pesoPreHdKg = const Value.absent(),
    this.pesoPostHdKg = const Value.absent(),
    this.pesoSecoObjetivoKg = const Value.absent(),
    this.ktvCalculado = const Value.absent(),
    this.urrCalculado = const Value.absent(),
    this.eventosDurante = const Value.absent(),
    this.invalidado = const Value.absent(),
  });
  SesionesHdCompanion.insert({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    required DateTime fechaHoraInicio,
    this.fechaHoraFin = const Value.absent(),
    required String tipoAcceso,
    this.lateralidadAcceso = const Value.absent(),
    this.tipoAccesoCateter = const Value.absent(),
    required int duracionProgramadaMin,
    this.duracionRealMin = const Value.absent(),
    required double qb,
    required double qd,
    this.dializadorTipo = const Value.absent(),
    this.dializadorSuperficieM2 = const Value.absent(),
    this.dializadorKuf = const Value.absent(),
    this.banoNa = const Value.absent(),
    this.banoK = const Value.absent(),
    this.banoCa = const Value.absent(),
    this.banoHco3 = const Value.absent(),
    this.banoGlucosa = const Value.absent(),
    required double ufTotalProgramadaMl,
    this.ufTotalRealMl = const Value.absent(),
    this.tasaUfMlKgH = const Value.absent(),
    this.tipoAnticoagulacion = const Value.absent(),
    this.heparinaBoloPorUI = const Value.absent(),
    this.heparinaMantenimientoUiH = const Value.absent(),
    this.pesoPreHdKg = const Value.absent(),
    this.pesoPostHdKg = const Value.absent(),
    this.pesoSecoObjetivoKg = const Value.absent(),
    this.ktvCalculado = const Value.absent(),
    this.urrCalculado = const Value.absent(),
    this.eventosDurante = const Value.absent(),
    this.invalidado = const Value.absent(),
  }) : fechaHoraInicio = Value(fechaHoraInicio),
       tipoAcceso = Value(tipoAcceso),
       duracionProgramadaMin = Value(duracionProgramadaMin),
       qb = Value(qb),
       qd = Value(qd),
       ufTotalProgramadaMl = Value(ufTotalProgramadaMl);
  static Insertable<SesionesHdData> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<int>? episodioId,
    Expression<DateTime>? fechaHoraInicio,
    Expression<DateTime>? fechaHoraFin,
    Expression<String>? tipoAcceso,
    Expression<String>? lateralidadAcceso,
    Expression<String>? tipoAccesoCateter,
    Expression<int>? duracionProgramadaMin,
    Expression<int>? duracionRealMin,
    Expression<double>? qb,
    Expression<double>? qd,
    Expression<String>? dializadorTipo,
    Expression<double>? dializadorSuperficieM2,
    Expression<double>? dializadorKuf,
    Expression<double>? banoNa,
    Expression<double>? banoK,
    Expression<double>? banoCa,
    Expression<double>? banoHco3,
    Expression<double>? banoGlucosa,
    Expression<double>? ufTotalProgramadaMl,
    Expression<double>? ufTotalRealMl,
    Expression<double>? tasaUfMlKgH,
    Expression<String>? tipoAnticoagulacion,
    Expression<double>? heparinaBoloPorUI,
    Expression<double>? heparinaMantenimientoUiH,
    Expression<double>? pesoPreHdKg,
    Expression<double>? pesoPostHdKg,
    Expression<double>? pesoSecoObjetivoKg,
    Expression<double>? ktvCalculado,
    Expression<double>? urrCalculado,
    Expression<String>? eventosDurante,
    Expression<bool>? invalidado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (episodioId != null) 'episodio_id': episodioId,
      if (fechaHoraInicio != null) 'fecha_hora_inicio': fechaHoraInicio,
      if (fechaHoraFin != null) 'fecha_hora_fin': fechaHoraFin,
      if (tipoAcceso != null) 'tipo_acceso': tipoAcceso,
      if (lateralidadAcceso != null) 'lateralidad_acceso': lateralidadAcceso,
      if (tipoAccesoCateter != null) 'tipo_acceso_cateter': tipoAccesoCateter,
      if (duracionProgramadaMin != null)
        'duracion_programada_min': duracionProgramadaMin,
      if (duracionRealMin != null) 'duracion_real_min': duracionRealMin,
      if (qb != null) 'qb': qb,
      if (qd != null) 'qd': qd,
      if (dializadorTipo != null) 'dializador_tipo': dializadorTipo,
      if (dializadorSuperficieM2 != null)
        'dializador_superficie_m2': dializadorSuperficieM2,
      if (dializadorKuf != null) 'dializador_kuf': dializadorKuf,
      if (banoNa != null) 'bano_na': banoNa,
      if (banoK != null) 'bano_k': banoK,
      if (banoCa != null) 'bano_ca': banoCa,
      if (banoHco3 != null) 'bano_hco3': banoHco3,
      if (banoGlucosa != null) 'bano_glucosa': banoGlucosa,
      if (ufTotalProgramadaMl != null)
        'uf_total_programada_ml': ufTotalProgramadaMl,
      if (ufTotalRealMl != null) 'uf_total_real_ml': ufTotalRealMl,
      if (tasaUfMlKgH != null) 'tasa_uf_ml_kg_h': tasaUfMlKgH,
      if (tipoAnticoagulacion != null)
        'tipo_anticoagulacion': tipoAnticoagulacion,
      if (heparinaBoloPorUI != null) 'heparina_bolo_por_u_i': heparinaBoloPorUI,
      if (heparinaMantenimientoUiH != null)
        'heparina_mantenimiento_ui_h': heparinaMantenimientoUiH,
      if (pesoPreHdKg != null) 'peso_pre_hd_kg': pesoPreHdKg,
      if (pesoPostHdKg != null) 'peso_post_hd_kg': pesoPostHdKg,
      if (pesoSecoObjetivoKg != null)
        'peso_seco_objetivo_kg': pesoSecoObjetivoKg,
      if (ktvCalculado != null) 'ktv_calculado': ktvCalculado,
      if (urrCalculado != null) 'urr_calculado': urrCalculado,
      if (eventosDurante != null) 'eventos_durante': eventosDurante,
      if (invalidado != null) 'invalidado': invalidado,
    });
  }

  SesionesHdCompanion copyWith({
    Value<int>? id,
    Value<int?>? pacienteId,
    Value<int?>? episodioId,
    Value<DateTime>? fechaHoraInicio,
    Value<DateTime?>? fechaHoraFin,
    Value<String>? tipoAcceso,
    Value<String?>? lateralidadAcceso,
    Value<String?>? tipoAccesoCateter,
    Value<int>? duracionProgramadaMin,
    Value<int?>? duracionRealMin,
    Value<double>? qb,
    Value<double>? qd,
    Value<String?>? dializadorTipo,
    Value<double?>? dializadorSuperficieM2,
    Value<double?>? dializadorKuf,
    Value<double?>? banoNa,
    Value<double?>? banoK,
    Value<double?>? banoCa,
    Value<double?>? banoHco3,
    Value<double?>? banoGlucosa,
    Value<double>? ufTotalProgramadaMl,
    Value<double?>? ufTotalRealMl,
    Value<double?>? tasaUfMlKgH,
    Value<String?>? tipoAnticoagulacion,
    Value<double?>? heparinaBoloPorUI,
    Value<double?>? heparinaMantenimientoUiH,
    Value<double?>? pesoPreHdKg,
    Value<double?>? pesoPostHdKg,
    Value<double?>? pesoSecoObjetivoKg,
    Value<double?>? ktvCalculado,
    Value<double?>? urrCalculado,
    Value<String?>? eventosDurante,
    Value<bool>? invalidado,
  }) {
    return SesionesHdCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      episodioId: episodioId ?? this.episodioId,
      fechaHoraInicio: fechaHoraInicio ?? this.fechaHoraInicio,
      fechaHoraFin: fechaHoraFin ?? this.fechaHoraFin,
      tipoAcceso: tipoAcceso ?? this.tipoAcceso,
      lateralidadAcceso: lateralidadAcceso ?? this.lateralidadAcceso,
      tipoAccesoCateter: tipoAccesoCateter ?? this.tipoAccesoCateter,
      duracionProgramadaMin:
          duracionProgramadaMin ?? this.duracionProgramadaMin,
      duracionRealMin: duracionRealMin ?? this.duracionRealMin,
      qb: qb ?? this.qb,
      qd: qd ?? this.qd,
      dializadorTipo: dializadorTipo ?? this.dializadorTipo,
      dializadorSuperficieM2:
          dializadorSuperficieM2 ?? this.dializadorSuperficieM2,
      dializadorKuf: dializadorKuf ?? this.dializadorKuf,
      banoNa: banoNa ?? this.banoNa,
      banoK: banoK ?? this.banoK,
      banoCa: banoCa ?? this.banoCa,
      banoHco3: banoHco3 ?? this.banoHco3,
      banoGlucosa: banoGlucosa ?? this.banoGlucosa,
      ufTotalProgramadaMl: ufTotalProgramadaMl ?? this.ufTotalProgramadaMl,
      ufTotalRealMl: ufTotalRealMl ?? this.ufTotalRealMl,
      tasaUfMlKgH: tasaUfMlKgH ?? this.tasaUfMlKgH,
      tipoAnticoagulacion: tipoAnticoagulacion ?? this.tipoAnticoagulacion,
      heparinaBoloPorUI: heparinaBoloPorUI ?? this.heparinaBoloPorUI,
      heparinaMantenimientoUiH:
          heparinaMantenimientoUiH ?? this.heparinaMantenimientoUiH,
      pesoPreHdKg: pesoPreHdKg ?? this.pesoPreHdKg,
      pesoPostHdKg: pesoPostHdKg ?? this.pesoPostHdKg,
      pesoSecoObjetivoKg: pesoSecoObjetivoKg ?? this.pesoSecoObjetivoKg,
      ktvCalculado: ktvCalculado ?? this.ktvCalculado,
      urrCalculado: urrCalculado ?? this.urrCalculado,
      eventosDurante: eventosDurante ?? this.eventosDurante,
      invalidado: invalidado ?? this.invalidado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (fechaHoraInicio.present) {
      map['fecha_hora_inicio'] = Variable<DateTime>(fechaHoraInicio.value);
    }
    if (fechaHoraFin.present) {
      map['fecha_hora_fin'] = Variable<DateTime>(fechaHoraFin.value);
    }
    if (tipoAcceso.present) {
      map['tipo_acceso'] = Variable<String>(tipoAcceso.value);
    }
    if (lateralidadAcceso.present) {
      map['lateralidad_acceso'] = Variable<String>(lateralidadAcceso.value);
    }
    if (tipoAccesoCateter.present) {
      map['tipo_acceso_cateter'] = Variable<String>(tipoAccesoCateter.value);
    }
    if (duracionProgramadaMin.present) {
      map['duracion_programada_min'] = Variable<int>(
        duracionProgramadaMin.value,
      );
    }
    if (duracionRealMin.present) {
      map['duracion_real_min'] = Variable<int>(duracionRealMin.value);
    }
    if (qb.present) {
      map['qb'] = Variable<double>(qb.value);
    }
    if (qd.present) {
      map['qd'] = Variable<double>(qd.value);
    }
    if (dializadorTipo.present) {
      map['dializador_tipo'] = Variable<String>(dializadorTipo.value);
    }
    if (dializadorSuperficieM2.present) {
      map['dializador_superficie_m2'] = Variable<double>(
        dializadorSuperficieM2.value,
      );
    }
    if (dializadorKuf.present) {
      map['dializador_kuf'] = Variable<double>(dializadorKuf.value);
    }
    if (banoNa.present) {
      map['bano_na'] = Variable<double>(banoNa.value);
    }
    if (banoK.present) {
      map['bano_k'] = Variable<double>(banoK.value);
    }
    if (banoCa.present) {
      map['bano_ca'] = Variable<double>(banoCa.value);
    }
    if (banoHco3.present) {
      map['bano_hco3'] = Variable<double>(banoHco3.value);
    }
    if (banoGlucosa.present) {
      map['bano_glucosa'] = Variable<double>(banoGlucosa.value);
    }
    if (ufTotalProgramadaMl.present) {
      map['uf_total_programada_ml'] = Variable<double>(
        ufTotalProgramadaMl.value,
      );
    }
    if (ufTotalRealMl.present) {
      map['uf_total_real_ml'] = Variable<double>(ufTotalRealMl.value);
    }
    if (tasaUfMlKgH.present) {
      map['tasa_uf_ml_kg_h'] = Variable<double>(tasaUfMlKgH.value);
    }
    if (tipoAnticoagulacion.present) {
      map['tipo_anticoagulacion'] = Variable<String>(tipoAnticoagulacion.value);
    }
    if (heparinaBoloPorUI.present) {
      map['heparina_bolo_por_u_i'] = Variable<double>(heparinaBoloPorUI.value);
    }
    if (heparinaMantenimientoUiH.present) {
      map['heparina_mantenimiento_ui_h'] = Variable<double>(
        heparinaMantenimientoUiH.value,
      );
    }
    if (pesoPreHdKg.present) {
      map['peso_pre_hd_kg'] = Variable<double>(pesoPreHdKg.value);
    }
    if (pesoPostHdKg.present) {
      map['peso_post_hd_kg'] = Variable<double>(pesoPostHdKg.value);
    }
    if (pesoSecoObjetivoKg.present) {
      map['peso_seco_objetivo_kg'] = Variable<double>(pesoSecoObjetivoKg.value);
    }
    if (ktvCalculado.present) {
      map['ktv_calculado'] = Variable<double>(ktvCalculado.value);
    }
    if (urrCalculado.present) {
      map['urr_calculado'] = Variable<double>(urrCalculado.value);
    }
    if (eventosDurante.present) {
      map['eventos_durante'] = Variable<String>(eventosDurante.value);
    }
    if (invalidado.present) {
      map['invalidado'] = Variable<bool>(invalidado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SesionesHdCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('fechaHoraInicio: $fechaHoraInicio, ')
          ..write('fechaHoraFin: $fechaHoraFin, ')
          ..write('tipoAcceso: $tipoAcceso, ')
          ..write('lateralidadAcceso: $lateralidadAcceso, ')
          ..write('tipoAccesoCateter: $tipoAccesoCateter, ')
          ..write('duracionProgramadaMin: $duracionProgramadaMin, ')
          ..write('duracionRealMin: $duracionRealMin, ')
          ..write('qb: $qb, ')
          ..write('qd: $qd, ')
          ..write('dializadorTipo: $dializadorTipo, ')
          ..write('dializadorSuperficieM2: $dializadorSuperficieM2, ')
          ..write('dializadorKuf: $dializadorKuf, ')
          ..write('banoNa: $banoNa, ')
          ..write('banoK: $banoK, ')
          ..write('banoCa: $banoCa, ')
          ..write('banoHco3: $banoHco3, ')
          ..write('banoGlucosa: $banoGlucosa, ')
          ..write('ufTotalProgramadaMl: $ufTotalProgramadaMl, ')
          ..write('ufTotalRealMl: $ufTotalRealMl, ')
          ..write('tasaUfMlKgH: $tasaUfMlKgH, ')
          ..write('tipoAnticoagulacion: $tipoAnticoagulacion, ')
          ..write('heparinaBoloPorUI: $heparinaBoloPorUI, ')
          ..write('heparinaMantenimientoUiH: $heparinaMantenimientoUiH, ')
          ..write('pesoPreHdKg: $pesoPreHdKg, ')
          ..write('pesoPostHdKg: $pesoPostHdKg, ')
          ..write('pesoSecoObjetivoKg: $pesoSecoObjetivoKg, ')
          ..write('ktvCalculado: $ktvCalculado, ')
          ..write('urrCalculado: $urrCalculado, ')
          ..write('eventosDurante: $eventosDurante, ')
          ..write('invalidado: $invalidado')
          ..write(')'))
        .toString();
  }
}

class $CalculosRealizadosTable extends CalculosRealizados
    with TableInfo<$CalculosRealizadosTable, CalculosRealizado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalculosRealizadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pacientes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _episodioIdMeta = const VerificationMeta(
    'episodioId',
  );
  @override
  late final GeneratedColumn<int> episodioId = GeneratedColumn<int>(
    'episodio_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES episodios (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tipoCalculoMeta = const VerificationMeta(
    'tipoCalculo',
  );
  @override
  late final GeneratedColumn<String> tipoCalculo = GeneratedColumn<String>(
    'tipo_calculo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _inputsJsonMeta = const VerificationMeta(
    'inputsJson',
  );
  @override
  late final GeneratedColumn<String> inputsJson = GeneratedColumn<String>(
    'inputs_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultadoJsonMeta = const VerificationMeta(
    'resultadoJson',
  );
  @override
  late final GeneratedColumn<String> resultadoJson = GeneratedColumn<String>(
    'resultado_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaHoraMeta = const VerificationMeta(
    'fechaHora',
  );
  @override
  late final GeneratedColumn<DateTime> fechaHora = GeneratedColumn<DateTime>(
    'fecha_hora',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pacienteId,
    episodioId,
    tipoCalculo,
    inputsJson,
    resultadoJson,
    fechaHora,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calculos_realizados';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalculosRealizado> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pacienteIdMeta);
    }
    if (data.containsKey('episodio_id')) {
      context.handle(
        _episodioIdMeta,
        episodioId.isAcceptableOrUnknown(data['episodio_id']!, _episodioIdMeta),
      );
    }
    if (data.containsKey('tipo_calculo')) {
      context.handle(
        _tipoCalculoMeta,
        tipoCalculo.isAcceptableOrUnknown(
          data['tipo_calculo']!,
          _tipoCalculoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoCalculoMeta);
    }
    if (data.containsKey('inputs_json')) {
      context.handle(
        _inputsJsonMeta,
        inputsJson.isAcceptableOrUnknown(data['inputs_json']!, _inputsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_inputsJsonMeta);
    }
    if (data.containsKey('resultado_json')) {
      context.handle(
        _resultadoJsonMeta,
        resultadoJson.isAcceptableOrUnknown(
          data['resultado_json']!,
          _resultadoJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_resultadoJsonMeta);
    }
    if (data.containsKey('fecha_hora')) {
      context.handle(
        _fechaHoraMeta,
        fechaHora.isAcceptableOrUnknown(data['fecha_hora']!, _fechaHoraMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalculosRealizado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalculosRealizado(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      )!,
      episodioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episodio_id'],
      ),
      tipoCalculo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_calculo'],
      )!,
      inputsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inputs_json'],
      )!,
      resultadoJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resultado_json'],
      )!,
      fechaHora: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_hora'],
      )!,
    );
  }

  @override
  $CalculosRealizadosTable createAlias(String alias) {
    return $CalculosRealizadosTable(attachedDatabase, alias);
  }
}

class CalculosRealizado extends DataClass
    implements Insertable<CalculosRealizado> {
  final int id;
  final int pacienteId;
  final int? episodioId;
  final String tipoCalculo;
  final String inputsJson;
  final String resultadoJson;
  final DateTime fechaHora;
  const CalculosRealizado({
    required this.id,
    required this.pacienteId,
    this.episodioId,
    required this.tipoCalculo,
    required this.inputsJson,
    required this.resultadoJson,
    required this.fechaHora,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['paciente_id'] = Variable<int>(pacienteId);
    if (!nullToAbsent || episodioId != null) {
      map['episodio_id'] = Variable<int>(episodioId);
    }
    map['tipo_calculo'] = Variable<String>(tipoCalculo);
    map['inputs_json'] = Variable<String>(inputsJson);
    map['resultado_json'] = Variable<String>(resultadoJson);
    map['fecha_hora'] = Variable<DateTime>(fechaHora);
    return map;
  }

  CalculosRealizadosCompanion toCompanion(bool nullToAbsent) {
    return CalculosRealizadosCompanion(
      id: Value(id),
      pacienteId: Value(pacienteId),
      episodioId: episodioId == null && nullToAbsent
          ? const Value.absent()
          : Value(episodioId),
      tipoCalculo: Value(tipoCalculo),
      inputsJson: Value(inputsJson),
      resultadoJson: Value(resultadoJson),
      fechaHora: Value(fechaHora),
    );
  }

  factory CalculosRealizado.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalculosRealizado(
      id: serializer.fromJson<int>(json['id']),
      pacienteId: serializer.fromJson<int>(json['pacienteId']),
      episodioId: serializer.fromJson<int?>(json['episodioId']),
      tipoCalculo: serializer.fromJson<String>(json['tipoCalculo']),
      inputsJson: serializer.fromJson<String>(json['inputsJson']),
      resultadoJson: serializer.fromJson<String>(json['resultadoJson']),
      fechaHora: serializer.fromJson<DateTime>(json['fechaHora']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pacienteId': serializer.toJson<int>(pacienteId),
      'episodioId': serializer.toJson<int?>(episodioId),
      'tipoCalculo': serializer.toJson<String>(tipoCalculo),
      'inputsJson': serializer.toJson<String>(inputsJson),
      'resultadoJson': serializer.toJson<String>(resultadoJson),
      'fechaHora': serializer.toJson<DateTime>(fechaHora),
    };
  }

  CalculosRealizado copyWith({
    int? id,
    int? pacienteId,
    Value<int?> episodioId = const Value.absent(),
    String? tipoCalculo,
    String? inputsJson,
    String? resultadoJson,
    DateTime? fechaHora,
  }) => CalculosRealizado(
    id: id ?? this.id,
    pacienteId: pacienteId ?? this.pacienteId,
    episodioId: episodioId.present ? episodioId.value : this.episodioId,
    tipoCalculo: tipoCalculo ?? this.tipoCalculo,
    inputsJson: inputsJson ?? this.inputsJson,
    resultadoJson: resultadoJson ?? this.resultadoJson,
    fechaHora: fechaHora ?? this.fechaHora,
  );
  CalculosRealizado copyWithCompanion(CalculosRealizadosCompanion data) {
    return CalculosRealizado(
      id: data.id.present ? data.id.value : this.id,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      episodioId: data.episodioId.present
          ? data.episodioId.value
          : this.episodioId,
      tipoCalculo: data.tipoCalculo.present
          ? data.tipoCalculo.value
          : this.tipoCalculo,
      inputsJson: data.inputsJson.present
          ? data.inputsJson.value
          : this.inputsJson,
      resultadoJson: data.resultadoJson.present
          ? data.resultadoJson.value
          : this.resultadoJson,
      fechaHora: data.fechaHora.present ? data.fechaHora.value : this.fechaHora,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalculosRealizado(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('tipoCalculo: $tipoCalculo, ')
          ..write('inputsJson: $inputsJson, ')
          ..write('resultadoJson: $resultadoJson, ')
          ..write('fechaHora: $fechaHora')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pacienteId,
    episodioId,
    tipoCalculo,
    inputsJson,
    resultadoJson,
    fechaHora,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalculosRealizado &&
          other.id == this.id &&
          other.pacienteId == this.pacienteId &&
          other.episodioId == this.episodioId &&
          other.tipoCalculo == this.tipoCalculo &&
          other.inputsJson == this.inputsJson &&
          other.resultadoJson == this.resultadoJson &&
          other.fechaHora == this.fechaHora);
}

class CalculosRealizadosCompanion extends UpdateCompanion<CalculosRealizado> {
  final Value<int> id;
  final Value<int> pacienteId;
  final Value<int?> episodioId;
  final Value<String> tipoCalculo;
  final Value<String> inputsJson;
  final Value<String> resultadoJson;
  final Value<DateTime> fechaHora;
  const CalculosRealizadosCompanion({
    this.id = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.episodioId = const Value.absent(),
    this.tipoCalculo = const Value.absent(),
    this.inputsJson = const Value.absent(),
    this.resultadoJson = const Value.absent(),
    this.fechaHora = const Value.absent(),
  });
  CalculosRealizadosCompanion.insert({
    this.id = const Value.absent(),
    required int pacienteId,
    this.episodioId = const Value.absent(),
    required String tipoCalculo,
    required String inputsJson,
    required String resultadoJson,
    this.fechaHora = const Value.absent(),
  }) : pacienteId = Value(pacienteId),
       tipoCalculo = Value(tipoCalculo),
       inputsJson = Value(inputsJson),
       resultadoJson = Value(resultadoJson);
  static Insertable<CalculosRealizado> custom({
    Expression<int>? id,
    Expression<int>? pacienteId,
    Expression<int>? episodioId,
    Expression<String>? tipoCalculo,
    Expression<String>? inputsJson,
    Expression<String>? resultadoJson,
    Expression<DateTime>? fechaHora,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (episodioId != null) 'episodio_id': episodioId,
      if (tipoCalculo != null) 'tipo_calculo': tipoCalculo,
      if (inputsJson != null) 'inputs_json': inputsJson,
      if (resultadoJson != null) 'resultado_json': resultadoJson,
      if (fechaHora != null) 'fecha_hora': fechaHora,
    });
  }

  CalculosRealizadosCompanion copyWith({
    Value<int>? id,
    Value<int>? pacienteId,
    Value<int?>? episodioId,
    Value<String>? tipoCalculo,
    Value<String>? inputsJson,
    Value<String>? resultadoJson,
    Value<DateTime>? fechaHora,
  }) {
    return CalculosRealizadosCompanion(
      id: id ?? this.id,
      pacienteId: pacienteId ?? this.pacienteId,
      episodioId: episodioId ?? this.episodioId,
      tipoCalculo: tipoCalculo ?? this.tipoCalculo,
      inputsJson: inputsJson ?? this.inputsJson,
      resultadoJson: resultadoJson ?? this.resultadoJson,
      fechaHora: fechaHora ?? this.fechaHora,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (episodioId.present) {
      map['episodio_id'] = Variable<int>(episodioId.value);
    }
    if (tipoCalculo.present) {
      map['tipo_calculo'] = Variable<String>(tipoCalculo.value);
    }
    if (inputsJson.present) {
      map['inputs_json'] = Variable<String>(inputsJson.value);
    }
    if (resultadoJson.present) {
      map['resultado_json'] = Variable<String>(resultadoJson.value);
    }
    if (fechaHora.present) {
      map['fecha_hora'] = Variable<DateTime>(fechaHora.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalculosRealizadosCompanion(')
          ..write('id: $id, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('episodioId: $episodioId, ')
          ..write('tipoCalculo: $tipoCalculo, ')
          ..write('inputsJson: $inputsJson, ')
          ..write('resultadoJson: $resultadoJson, ')
          ..write('fechaHora: $fechaHora')
          ..write(')'))
        .toString();
  }
}

class $AuditLogTable extends AuditLog
    with TableInfo<$AuditLogTable, AuditLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accionMeta = const VerificationMeta('accion');
  @override
  late final GeneratedColumn<String> accion = GeneratedColumn<String>(
    'accion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entidadMeta = const VerificationMeta(
    'entidad',
  );
  @override
  late final GeneratedColumn<String> entidad = GeneratedColumn<String>(
    'entidad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entidadIdMeta = const VerificationMeta(
    'entidadId',
  );
  @override
  late final GeneratedColumn<int> entidadId = GeneratedColumn<int>(
    'entidad_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pacienteIdMeta = const VerificationMeta(
    'pacienteId',
  );
  @override
  late final GeneratedColumn<int> pacienteId = GeneratedColumn<int>(
    'paciente_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios_locales (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _detalleJsonMeta = const VerificationMeta(
    'detalleJson',
  );
  @override
  late final GeneratedColumn<String> detalleJson = GeneratedColumn<String>(
    'detalle_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _institucionMeta = const VerificationMeta(
    'institucion',
  );
  @override
  late final GeneratedColumn<String> institucion = GeneratedColumn<String>(
    'institucion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(
      'Instituto de Nefrología Dr. Abelardo Buch López',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accion,
    entidad,
    entidadId,
    pacienteId,
    usuarioId,
    timestamp,
    detalleJson,
    institucion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLogData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('accion')) {
      context.handle(
        _accionMeta,
        accion.isAcceptableOrUnknown(data['accion']!, _accionMeta),
      );
    } else if (isInserting) {
      context.missing(_accionMeta);
    }
    if (data.containsKey('entidad')) {
      context.handle(
        _entidadMeta,
        entidad.isAcceptableOrUnknown(data['entidad']!, _entidadMeta),
      );
    }
    if (data.containsKey('entidad_id')) {
      context.handle(
        _entidadIdMeta,
        entidadId.isAcceptableOrUnknown(data['entidad_id']!, _entidadIdMeta),
      );
    }
    if (data.containsKey('paciente_id')) {
      context.handle(
        _pacienteIdMeta,
        pacienteId.isAcceptableOrUnknown(data['paciente_id']!, _pacienteIdMeta),
      );
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    if (data.containsKey('detalle_json')) {
      context.handle(
        _detalleJsonMeta,
        detalleJson.isAcceptableOrUnknown(
          data['detalle_json']!,
          _detalleJsonMeta,
        ),
      );
    }
    if (data.containsKey('institucion')) {
      context.handle(
        _institucionMeta,
        institucion.isAcceptableOrUnknown(
          data['institucion']!,
          _institucionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accion'],
      )!,
      entidad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entidad'],
      ),
      entidadId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entidad_id'],
      ),
      pacienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}paciente_id'],
      ),
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      ),
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      detalleJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detalle_json'],
      ),
      institucion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}institucion'],
      )!,
    );
  }

  @override
  $AuditLogTable createAlias(String alias) {
    return $AuditLogTable(attachedDatabase, alias);
  }
}

class AuditLogData extends DataClass implements Insertable<AuditLogData> {
  final int id;
  final String accion;
  final String? entidad;
  final int? entidadId;
  final int? pacienteId;
  final int? usuarioId;
  final DateTime timestamp;
  final String? detalleJson;
  final String institucion;
  const AuditLogData({
    required this.id,
    required this.accion,
    this.entidad,
    this.entidadId,
    this.pacienteId,
    this.usuarioId,
    required this.timestamp,
    this.detalleJson,
    required this.institucion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['accion'] = Variable<String>(accion);
    if (!nullToAbsent || entidad != null) {
      map['entidad'] = Variable<String>(entidad);
    }
    if (!nullToAbsent || entidadId != null) {
      map['entidad_id'] = Variable<int>(entidadId);
    }
    if (!nullToAbsent || pacienteId != null) {
      map['paciente_id'] = Variable<int>(pacienteId);
    }
    if (!nullToAbsent || usuarioId != null) {
      map['usuario_id'] = Variable<int>(usuarioId);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || detalleJson != null) {
      map['detalle_json'] = Variable<String>(detalleJson);
    }
    map['institucion'] = Variable<String>(institucion);
    return map;
  }

  AuditLogCompanion toCompanion(bool nullToAbsent) {
    return AuditLogCompanion(
      id: Value(id),
      accion: Value(accion),
      entidad: entidad == null && nullToAbsent
          ? const Value.absent()
          : Value(entidad),
      entidadId: entidadId == null && nullToAbsent
          ? const Value.absent()
          : Value(entidadId),
      pacienteId: pacienteId == null && nullToAbsent
          ? const Value.absent()
          : Value(pacienteId),
      usuarioId: usuarioId == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioId),
      timestamp: Value(timestamp),
      detalleJson: detalleJson == null && nullToAbsent
          ? const Value.absent()
          : Value(detalleJson),
      institucion: Value(institucion),
    );
  }

  factory AuditLogData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogData(
      id: serializer.fromJson<int>(json['id']),
      accion: serializer.fromJson<String>(json['accion']),
      entidad: serializer.fromJson<String?>(json['entidad']),
      entidadId: serializer.fromJson<int?>(json['entidadId']),
      pacienteId: serializer.fromJson<int?>(json['pacienteId']),
      usuarioId: serializer.fromJson<int?>(json['usuarioId']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      detalleJson: serializer.fromJson<String?>(json['detalleJson']),
      institucion: serializer.fromJson<String>(json['institucion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accion': serializer.toJson<String>(accion),
      'entidad': serializer.toJson<String?>(entidad),
      'entidadId': serializer.toJson<int?>(entidadId),
      'pacienteId': serializer.toJson<int?>(pacienteId),
      'usuarioId': serializer.toJson<int?>(usuarioId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'detalleJson': serializer.toJson<String?>(detalleJson),
      'institucion': serializer.toJson<String>(institucion),
    };
  }

  AuditLogData copyWith({
    int? id,
    String? accion,
    Value<String?> entidad = const Value.absent(),
    Value<int?> entidadId = const Value.absent(),
    Value<int?> pacienteId = const Value.absent(),
    Value<int?> usuarioId = const Value.absent(),
    DateTime? timestamp,
    Value<String?> detalleJson = const Value.absent(),
    String? institucion,
  }) => AuditLogData(
    id: id ?? this.id,
    accion: accion ?? this.accion,
    entidad: entidad.present ? entidad.value : this.entidad,
    entidadId: entidadId.present ? entidadId.value : this.entidadId,
    pacienteId: pacienteId.present ? pacienteId.value : this.pacienteId,
    usuarioId: usuarioId.present ? usuarioId.value : this.usuarioId,
    timestamp: timestamp ?? this.timestamp,
    detalleJson: detalleJson.present ? detalleJson.value : this.detalleJson,
    institucion: institucion ?? this.institucion,
  );
  AuditLogData copyWithCompanion(AuditLogCompanion data) {
    return AuditLogData(
      id: data.id.present ? data.id.value : this.id,
      accion: data.accion.present ? data.accion.value : this.accion,
      entidad: data.entidad.present ? data.entidad.value : this.entidad,
      entidadId: data.entidadId.present ? data.entidadId.value : this.entidadId,
      pacienteId: data.pacienteId.present
          ? data.pacienteId.value
          : this.pacienteId,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      detalleJson: data.detalleJson.present
          ? data.detalleJson.value
          : this.detalleJson,
      institucion: data.institucion.present
          ? data.institucion.value
          : this.institucion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogData(')
          ..write('id: $id, ')
          ..write('accion: $accion, ')
          ..write('entidad: $entidad, ')
          ..write('entidadId: $entidadId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('detalleJson: $detalleJson, ')
          ..write('institucion: $institucion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accion,
    entidad,
    entidadId,
    pacienteId,
    usuarioId,
    timestamp,
    detalleJson,
    institucion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogData &&
          other.id == this.id &&
          other.accion == this.accion &&
          other.entidad == this.entidad &&
          other.entidadId == this.entidadId &&
          other.pacienteId == this.pacienteId &&
          other.usuarioId == this.usuarioId &&
          other.timestamp == this.timestamp &&
          other.detalleJson == this.detalleJson &&
          other.institucion == this.institucion);
}

class AuditLogCompanion extends UpdateCompanion<AuditLogData> {
  final Value<int> id;
  final Value<String> accion;
  final Value<String?> entidad;
  final Value<int?> entidadId;
  final Value<int?> pacienteId;
  final Value<int?> usuarioId;
  final Value<DateTime> timestamp;
  final Value<String?> detalleJson;
  final Value<String> institucion;
  const AuditLogCompanion({
    this.id = const Value.absent(),
    this.accion = const Value.absent(),
    this.entidad = const Value.absent(),
    this.entidadId = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.detalleJson = const Value.absent(),
    this.institucion = const Value.absent(),
  });
  AuditLogCompanion.insert({
    this.id = const Value.absent(),
    required String accion,
    this.entidad = const Value.absent(),
    this.entidadId = const Value.absent(),
    this.pacienteId = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.detalleJson = const Value.absent(),
    this.institucion = const Value.absent(),
  }) : accion = Value(accion);
  static Insertable<AuditLogData> custom({
    Expression<int>? id,
    Expression<String>? accion,
    Expression<String>? entidad,
    Expression<int>? entidadId,
    Expression<int>? pacienteId,
    Expression<int>? usuarioId,
    Expression<DateTime>? timestamp,
    Expression<String>? detalleJson,
    Expression<String>? institucion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accion != null) 'accion': accion,
      if (entidad != null) 'entidad': entidad,
      if (entidadId != null) 'entidad_id': entidadId,
      if (pacienteId != null) 'paciente_id': pacienteId,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (timestamp != null) 'timestamp': timestamp,
      if (detalleJson != null) 'detalle_json': detalleJson,
      if (institucion != null) 'institucion': institucion,
    });
  }

  AuditLogCompanion copyWith({
    Value<int>? id,
    Value<String>? accion,
    Value<String?>? entidad,
    Value<int?>? entidadId,
    Value<int?>? pacienteId,
    Value<int?>? usuarioId,
    Value<DateTime>? timestamp,
    Value<String?>? detalleJson,
    Value<String>? institucion,
  }) {
    return AuditLogCompanion(
      id: id ?? this.id,
      accion: accion ?? this.accion,
      entidad: entidad ?? this.entidad,
      entidadId: entidadId ?? this.entidadId,
      pacienteId: pacienteId ?? this.pacienteId,
      usuarioId: usuarioId ?? this.usuarioId,
      timestamp: timestamp ?? this.timestamp,
      detalleJson: detalleJson ?? this.detalleJson,
      institucion: institucion ?? this.institucion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accion.present) {
      map['accion'] = Variable<String>(accion.value);
    }
    if (entidad.present) {
      map['entidad'] = Variable<String>(entidad.value);
    }
    if (entidadId.present) {
      map['entidad_id'] = Variable<int>(entidadId.value);
    }
    if (pacienteId.present) {
      map['paciente_id'] = Variable<int>(pacienteId.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (detalleJson.present) {
      map['detalle_json'] = Variable<String>(detalleJson.value);
    }
    if (institucion.present) {
      map['institucion'] = Variable<String>(institucion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogCompanion(')
          ..write('id: $id, ')
          ..write('accion: $accion, ')
          ..write('entidad: $entidad, ')
          ..write('entidadId: $entidadId, ')
          ..write('pacienteId: $pacienteId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('timestamp: $timestamp, ')
          ..write('detalleJson: $detalleJson, ')
          ..write('institucion: $institucion')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsuariosLocalesTable usuariosLocales = $UsuariosLocalesTable(
    this,
  );
  late final $PacientesTable pacientes = $PacientesTable(this);
  late final $HistoriasClinicasTable historiasClinicas =
      $HistoriasClinicasTable(this);
  late final $EpisodiosTable episodios = $EpisodiosTable(this);
  late final $DiagnosticosTable diagnosticos = $DiagnosticosTable(this);
  late final $SignosVitalesTable signosVitales = $SignosVitalesTable(this);
  late final $ParametrosClinicosTable parametrosClinicos =
      $ParametrosClinicosTable(this);
  late final $CatalogoMetaTable catalogoMeta = $CatalogoMetaTable(this);
  late final $UnidadesMedidaTable unidadesMedida = $UnidadesMedidaTable(this);
  late final $LaboratoriosTable laboratorios = $LaboratoriosTable(this);
  late final $ImagenesTable imagenes = $ImagenesTable(this);
  late final $EkgTable ekg = $EkgTable(this);
  late final $VentilacionSavinaTable ventilacionSavina =
      $VentilacionSavinaTable(this);
  late final $SesionesHdTable sesionesHd = $SesionesHdTable(this);
  late final $CalculosRealizadosTable calculosRealizados =
      $CalculosRealizadosTable(this);
  late final $AuditLogTable auditLog = $AuditLogTable(this);
  late final Index idxPacNombre = Index(
    'idx_pac_nombre',
    'CREATE INDEX idx_pac_nombre ON pacientes (nombre_normalizado)',
  );
  late final Index idxPacHc = Index(
    'idx_pac_hc',
    'CREATE INDEX idx_pac_hc ON pacientes (numero_hc)',
  );
  late final Index idxPacCedula = Index(
    'idx_pac_cedula',
    'CREATE INDEX idx_pac_cedula ON pacientes (cedula)',
  );
  late final Index idxPacServicioEstado = Index(
    'idx_pac_servicio_estado',
    'CREATE INDEX idx_pac_servicio_estado ON pacientes (servicio_actual, estado)',
  );
  late final Index idxDiagCie = Index(
    'idx_diag_cie',
    'CREATE INDEX idx_diag_cie ON diagnosticos (codigo_cie, episodio_id)',
  );
  late final Index idxLabPacParamFecha = Index(
    'idx_lab_pac_param_fecha',
    'CREATE INDEX idx_lab_pac_param_fecha ON laboratorios (paciente_id, parametro_codigo, fecha_hora)',
  );
  late final Index idxLabParamFecha = Index(
    'idx_lab_param_fecha',
    'CREATE INDEX idx_lab_param_fecha ON laboratorios (parametro_codigo, fecha_hora)',
  );
  late final Index idxCalcTipoFecha = Index(
    'idx_calc_tipo_fecha',
    'CREATE INDEX idx_calc_tipo_fecha ON calculos_realizados (tipo_calculo, fecha_hora)',
  );
  late final Index idxAuditTimestamp = Index(
    'idx_audit_timestamp',
    'CREATE INDEX idx_audit_timestamp ON audit_log (timestamp)',
  );
  late final Index idxAuditPaciente = Index(
    'idx_audit_paciente',
    'CREATE INDEX idx_audit_paciente ON audit_log (paciente_id, timestamp)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usuariosLocales,
    pacientes,
    historiasClinicas,
    episodios,
    diagnosticos,
    signosVitales,
    parametrosClinicos,
    catalogoMeta,
    unidadesMedida,
    laboratorios,
    imagenes,
    ekg,
    ventilacionSavina,
    sesionesHd,
    calculosRealizados,
    auditLog,
    idxPacNombre,
    idxPacHc,
    idxPacCedula,
    idxPacServicioEstado,
    idxDiagCie,
    idxLabPacParamFecha,
    idxLabParamFecha,
    idxCalcTipoFecha,
    idxAuditTimestamp,
    idxAuditPaciente,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('historias_clinicas', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('episodios', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('diagnosticos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('signos_vitales', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('signos_vitales', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'parametros_clinicos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('unidades_medida', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('laboratorios', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('laboratorios', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('imagenes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ekg', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ventilacion_savina', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ventilacion_savina', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sesiones_hd', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sesiones_hd', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pacientes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('calculos_realizados', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'episodios',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('calculos_realizados', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$UsuariosLocalesTableCreateCompanionBuilder =
    UsuariosLocalesCompanion Function({
      Value<int> id,
      required String nombre,
      Value<String?> especialidad,
      Value<DateTime> creadoEn,
      Value<DateTime?> ultimoAcceso,
      Value<int> autoLockSegundos,
      Value<bool> biometriaHabilitada,
    });
typedef $$UsuariosLocalesTableUpdateCompanionBuilder =
    UsuariosLocalesCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String?> especialidad,
      Value<DateTime> creadoEn,
      Value<DateTime?> ultimoAcceso,
      Value<int> autoLockSegundos,
      Value<bool> biometriaHabilitada,
    });

final class $$UsuariosLocalesTableReferences
    extends
        BaseReferences<_$AppDatabase, $UsuariosLocalesTable, UsuariosLocale> {
  $$UsuariosLocalesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$AuditLogTable, List<AuditLogData>>
  _auditLogRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.auditLog,
    aliasName: $_aliasNameGenerator(
      db.usuariosLocales.id,
      db.auditLog.usuarioId,
    ),
  );

  $$AuditLogTableProcessedTableManager get auditLogRefs {
    final manager = $$AuditLogTableTableManager(
      $_db,
      $_db.auditLog,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_auditLogRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsuariosLocalesTableFilterComposer
    extends Composer<_$AppDatabase, $UsuariosLocalesTable> {
  $$UsuariosLocalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get especialidad => $composableBuilder(
    column: $table.especialidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get ultimoAcceso => $composableBuilder(
    column: $table.ultimoAcceso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get autoLockSegundos => $composableBuilder(
    column: $table.autoLockSegundos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get biometriaHabilitada => $composableBuilder(
    column: $table.biometriaHabilitada,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> auditLogRefs(
    Expression<bool> Function($$AuditLogTableFilterComposer f) f,
  ) {
    final $$AuditLogTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditLog,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogTableFilterComposer(
            $db: $db,
            $table: $db.auditLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsuariosLocalesTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuariosLocalesTable> {
  $$UsuariosLocalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get especialidad => $composableBuilder(
    column: $table.especialidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get ultimoAcceso => $composableBuilder(
    column: $table.ultimoAcceso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get autoLockSegundos => $composableBuilder(
    column: $table.autoLockSegundos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get biometriaHabilitada => $composableBuilder(
    column: $table.biometriaHabilitada,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsuariosLocalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuariosLocalesTable> {
  $$UsuariosLocalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get especialidad => $composableBuilder(
    column: $table.especialidad,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  GeneratedColumn<DateTime> get ultimoAcceso => $composableBuilder(
    column: $table.ultimoAcceso,
    builder: (column) => column,
  );

  GeneratedColumn<int> get autoLockSegundos => $composableBuilder(
    column: $table.autoLockSegundos,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get biometriaHabilitada => $composableBuilder(
    column: $table.biometriaHabilitada,
    builder: (column) => column,
  );

  Expression<T> auditLogRefs<T extends Object>(
    Expression<T> Function($$AuditLogTableAnnotationComposer a) f,
  ) {
    final $$AuditLogTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditLog,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogTableAnnotationComposer(
            $db: $db,
            $table: $db.auditLog,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsuariosLocalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuariosLocalesTable,
          UsuariosLocale,
          $$UsuariosLocalesTableFilterComposer,
          $$UsuariosLocalesTableOrderingComposer,
          $$UsuariosLocalesTableAnnotationComposer,
          $$UsuariosLocalesTableCreateCompanionBuilder,
          $$UsuariosLocalesTableUpdateCompanionBuilder,
          (UsuariosLocale, $$UsuariosLocalesTableReferences),
          UsuariosLocale,
          PrefetchHooks Function({bool auditLogRefs})
        > {
  $$UsuariosLocalesTableTableManager(
    _$AppDatabase db,
    $UsuariosLocalesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuariosLocalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuariosLocalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuariosLocalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String?> especialidad = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime?> ultimoAcceso = const Value.absent(),
                Value<int> autoLockSegundos = const Value.absent(),
                Value<bool> biometriaHabilitada = const Value.absent(),
              }) => UsuariosLocalesCompanion(
                id: id,
                nombre: nombre,
                especialidad: especialidad,
                creadoEn: creadoEn,
                ultimoAcceso: ultimoAcceso,
                autoLockSegundos: autoLockSegundos,
                biometriaHabilitada: biometriaHabilitada,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                Value<String?> especialidad = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime?> ultimoAcceso = const Value.absent(),
                Value<int> autoLockSegundos = const Value.absent(),
                Value<bool> biometriaHabilitada = const Value.absent(),
              }) => UsuariosLocalesCompanion.insert(
                id: id,
                nombre: nombre,
                especialidad: especialidad,
                creadoEn: creadoEn,
                ultimoAcceso: ultimoAcceso,
                autoLockSegundos: autoLockSegundos,
                biometriaHabilitada: biometriaHabilitada,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsuariosLocalesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({auditLogRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (auditLogRefs) db.auditLog],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (auditLogRefs)
                    await $_getPrefetchedData<
                      UsuariosLocale,
                      $UsuariosLocalesTable,
                      AuditLogData
                    >(
                      currentTable: table,
                      referencedTable: $$UsuariosLocalesTableReferences
                          ._auditLogRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsuariosLocalesTableReferences(
                            db,
                            table,
                            p0,
                          ).auditLogRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.usuarioId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsuariosLocalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuariosLocalesTable,
      UsuariosLocale,
      $$UsuariosLocalesTableFilterComposer,
      $$UsuariosLocalesTableOrderingComposer,
      $$UsuariosLocalesTableAnnotationComposer,
      $$UsuariosLocalesTableCreateCompanionBuilder,
      $$UsuariosLocalesTableUpdateCompanionBuilder,
      (UsuariosLocale, $$UsuariosLocalesTableReferences),
      UsuariosLocale,
      PrefetchHooks Function({bool auditLogRefs})
    >;
typedef $$PacientesTableCreateCompanionBuilder =
    PacientesCompanion Function({
      Value<int> id,
      required String numeroHc,
      required String nombreCompleto,
      required String nombreNormalizado,
      Value<String?> cedula,
      required DateTime fechaNacimiento,
      required String sexo,
      Value<String?> grupoSanguineo,
      Value<String?> factorRh,
      Value<double?> pesoSeco,
      Value<double?> pesoActual,
      Value<double?> talla,
      Value<String?> servicioActual,
      Value<String> estado,
      Value<DateTime?> fechaIngreso,
      Value<DateTime?> fechaEgreso,
      Value<String?> motivoIngreso,
      Value<DateTime> creadoEn,
      Value<DateTime> actualizadoEn,
    });
typedef $$PacientesTableUpdateCompanionBuilder =
    PacientesCompanion Function({
      Value<int> id,
      Value<String> numeroHc,
      Value<String> nombreCompleto,
      Value<String> nombreNormalizado,
      Value<String?> cedula,
      Value<DateTime> fechaNacimiento,
      Value<String> sexo,
      Value<String?> grupoSanguineo,
      Value<String?> factorRh,
      Value<double?> pesoSeco,
      Value<double?> pesoActual,
      Value<double?> talla,
      Value<String?> servicioActual,
      Value<String> estado,
      Value<DateTime?> fechaIngreso,
      Value<DateTime?> fechaEgreso,
      Value<String?> motivoIngreso,
      Value<DateTime> creadoEn,
      Value<DateTime> actualizadoEn,
    });

final class $$PacientesTableReferences
    extends BaseReferences<_$AppDatabase, $PacientesTable, Paciente> {
  $$PacientesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HistoriasClinicasTable, List<HistoriasClinica>>
  _historiasClinicasRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.historiasClinicas,
        aliasName: $_aliasNameGenerator(
          db.pacientes.id,
          db.historiasClinicas.pacienteId,
        ),
      );

  $$HistoriasClinicasTableProcessedTableManager get historiasClinicasRefs {
    final manager = $$HistoriasClinicasTableTableManager(
      $_db,
      $_db.historiasClinicas,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historiasClinicasRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EpisodiosTable, List<Episodio>>
  _episodiosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.episodios,
    aliasName: $_aliasNameGenerator(db.pacientes.id, db.episodios.pacienteId),
  );

  $$EpisodiosTableProcessedTableManager get episodiosRefs {
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_episodiosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SignosVitalesTable, List<SignosVitale>>
  _signosVitalesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.signosVitales,
    aliasName: $_aliasNameGenerator(
      db.pacientes.id,
      db.signosVitales.pacienteId,
    ),
  );

  $$SignosVitalesTableProcessedTableManager get signosVitalesRefs {
    final manager = $$SignosVitalesTableTableManager(
      $_db,
      $_db.signosVitales,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_signosVitalesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LaboratoriosTable, List<Laboratorio>>
  _laboratoriosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.laboratorios,
    aliasName: $_aliasNameGenerator(
      db.pacientes.id,
      db.laboratorios.pacienteId,
    ),
  );

  $$LaboratoriosTableProcessedTableManager get laboratoriosRefs {
    final manager = $$LaboratoriosTableTableManager(
      $_db,
      $_db.laboratorios,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_laboratoriosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $VentilacionSavinaTable,
    List<VentilacionSavinaData>
  >
  _ventilacionSavinaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ventilacionSavina,
        aliasName: $_aliasNameGenerator(
          db.pacientes.id,
          db.ventilacionSavina.pacienteId,
        ),
      );

  $$VentilacionSavinaTableProcessedTableManager get ventilacionSavinaRefs {
    final manager = $$VentilacionSavinaTableTableManager(
      $_db,
      $_db.ventilacionSavina,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ventilacionSavinaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SesionesHdTable, List<SesionesHdData>>
  _sesionesHdRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sesionesHd,
    aliasName: $_aliasNameGenerator(db.pacientes.id, db.sesionesHd.pacienteId),
  );

  $$SesionesHdTableProcessedTableManager get sesionesHdRefs {
    final manager = $$SesionesHdTableTableManager(
      $_db,
      $_db.sesionesHd,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sesionesHdRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CalculosRealizadosTable, List<CalculosRealizado>>
  _calculosRealizadosRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.calculosRealizados,
        aliasName: $_aliasNameGenerator(
          db.pacientes.id,
          db.calculosRealizados.pacienteId,
        ),
      );

  $$CalculosRealizadosTableProcessedTableManager get calculosRealizadosRefs {
    final manager = $$CalculosRealizadosTableTableManager(
      $_db,
      $_db.calculosRealizados,
    ).filter((f) => f.pacienteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _calculosRealizadosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PacientesTableFilterComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroHc => $composableBuilder(
    column: $table.numeroHc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreCompleto => $composableBuilder(
    column: $table.nombreCompleto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreNormalizado => $composableBuilder(
    column: $table.nombreNormalizado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cedula => $composableBuilder(
    column: $table.cedula,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaNacimiento => $composableBuilder(
    column: $table.fechaNacimiento,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sexo => $composableBuilder(
    column: $table.sexo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get grupoSanguineo => $composableBuilder(
    column: $table.grupoSanguineo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get factorRh => $composableBuilder(
    column: $table.factorRh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pesoSeco => $composableBuilder(
    column: $table.pesoSeco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pesoActual => $composableBuilder(
    column: $table.pesoActual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get talla => $composableBuilder(
    column: $table.talla,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servicioActual => $composableBuilder(
    column: $table.servicioActual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> historiasClinicasRefs(
    Expression<bool> Function($$HistoriasClinicasTableFilterComposer f) f,
  ) {
    final $$HistoriasClinicasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historiasClinicas,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistoriasClinicasTableFilterComposer(
            $db: $db,
            $table: $db.historiasClinicas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> episodiosRefs(
    Expression<bool> Function($$EpisodiosTableFilterComposer f) f,
  ) {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> signosVitalesRefs(
    Expression<bool> Function($$SignosVitalesTableFilterComposer f) f,
  ) {
    final $$SignosVitalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.signosVitales,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SignosVitalesTableFilterComposer(
            $db: $db,
            $table: $db.signosVitales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> laboratoriosRefs(
    Expression<bool> Function($$LaboratoriosTableFilterComposer f) f,
  ) {
    final $$LaboratoriosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableFilterComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ventilacionSavinaRefs(
    Expression<bool> Function($$VentilacionSavinaTableFilterComposer f) f,
  ) {
    final $$VentilacionSavinaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ventilacionSavina,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VentilacionSavinaTableFilterComposer(
            $db: $db,
            $table: $db.ventilacionSavina,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sesionesHdRefs(
    Expression<bool> Function($$SesionesHdTableFilterComposer f) f,
  ) {
    final $$SesionesHdTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sesionesHd,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SesionesHdTableFilterComposer(
            $db: $db,
            $table: $db.sesionesHd,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> calculosRealizadosRefs(
    Expression<bool> Function($$CalculosRealizadosTableFilterComposer f) f,
  ) {
    final $$CalculosRealizadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.calculosRealizados,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CalculosRealizadosTableFilterComposer(
            $db: $db,
            $table: $db.calculosRealizados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PacientesTableOrderingComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroHc => $composableBuilder(
    column: $table.numeroHc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreCompleto => $composableBuilder(
    column: $table.nombreCompleto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreNormalizado => $composableBuilder(
    column: $table.nombreNormalizado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cedula => $composableBuilder(
    column: $table.cedula,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaNacimiento => $composableBuilder(
    column: $table.fechaNacimiento,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sexo => $composableBuilder(
    column: $table.sexo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get grupoSanguineo => $composableBuilder(
    column: $table.grupoSanguineo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get factorRh => $composableBuilder(
    column: $table.factorRh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pesoSeco => $composableBuilder(
    column: $table.pesoSeco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pesoActual => $composableBuilder(
    column: $table.pesoActual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get talla => $composableBuilder(
    column: $table.talla,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servicioActual => $composableBuilder(
    column: $table.servicioActual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PacientesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PacientesTable> {
  $$PacientesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numeroHc =>
      $composableBuilder(column: $table.numeroHc, builder: (column) => column);

  GeneratedColumn<String> get nombreCompleto => $composableBuilder(
    column: $table.nombreCompleto,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombreNormalizado => $composableBuilder(
    column: $table.nombreNormalizado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cedula =>
      $composableBuilder(column: $table.cedula, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaNacimiento => $composableBuilder(
    column: $table.fechaNacimiento,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sexo =>
      $composableBuilder(column: $table.sexo, builder: (column) => column);

  GeneratedColumn<String> get grupoSanguineo => $composableBuilder(
    column: $table.grupoSanguineo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get factorRh =>
      $composableBuilder(column: $table.factorRh, builder: (column) => column);

  GeneratedColumn<double> get pesoSeco =>
      $composableBuilder(column: $table.pesoSeco, builder: (column) => column);

  GeneratedColumn<double> get pesoActual => $composableBuilder(
    column: $table.pesoActual,
    builder: (column) => column,
  );

  GeneratedColumn<double> get talla =>
      $composableBuilder(column: $table.talla, builder: (column) => column);

  GeneratedColumn<String> get servicioActual => $composableBuilder(
    column: $table.servicioActual,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  GeneratedColumn<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => column,
  );

  Expression<T> historiasClinicasRefs<T extends Object>(
    Expression<T> Function($$HistoriasClinicasTableAnnotationComposer a) f,
  ) {
    final $$HistoriasClinicasTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.historiasClinicas,
          getReferencedColumn: (t) => t.pacienteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$HistoriasClinicasTableAnnotationComposer(
                $db: $db,
                $table: $db.historiasClinicas,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> episodiosRefs<T extends Object>(
    Expression<T> Function($$EpisodiosTableAnnotationComposer a) f,
  ) {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> signosVitalesRefs<T extends Object>(
    Expression<T> Function($$SignosVitalesTableAnnotationComposer a) f,
  ) {
    final $$SignosVitalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.signosVitales,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SignosVitalesTableAnnotationComposer(
            $db: $db,
            $table: $db.signosVitales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> laboratoriosRefs<T extends Object>(
    Expression<T> Function($$LaboratoriosTableAnnotationComposer a) f,
  ) {
    final $$LaboratoriosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableAnnotationComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ventilacionSavinaRefs<T extends Object>(
    Expression<T> Function($$VentilacionSavinaTableAnnotationComposer a) f,
  ) {
    final $$VentilacionSavinaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ventilacionSavina,
          getReferencedColumn: (t) => t.pacienteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$VentilacionSavinaTableAnnotationComposer(
                $db: $db,
                $table: $db.ventilacionSavina,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> sesionesHdRefs<T extends Object>(
    Expression<T> Function($$SesionesHdTableAnnotationComposer a) f,
  ) {
    final $$SesionesHdTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sesionesHd,
      getReferencedColumn: (t) => t.pacienteId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SesionesHdTableAnnotationComposer(
            $db: $db,
            $table: $db.sesionesHd,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> calculosRealizadosRefs<T extends Object>(
    Expression<T> Function($$CalculosRealizadosTableAnnotationComposer a) f,
  ) {
    final $$CalculosRealizadosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.calculosRealizados,
          getReferencedColumn: (t) => t.pacienteId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CalculosRealizadosTableAnnotationComposer(
                $db: $db,
                $table: $db.calculosRealizados,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PacientesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PacientesTable,
          Paciente,
          $$PacientesTableFilterComposer,
          $$PacientesTableOrderingComposer,
          $$PacientesTableAnnotationComposer,
          $$PacientesTableCreateCompanionBuilder,
          $$PacientesTableUpdateCompanionBuilder,
          (Paciente, $$PacientesTableReferences),
          Paciente,
          PrefetchHooks Function({
            bool historiasClinicasRefs,
            bool episodiosRefs,
            bool signosVitalesRefs,
            bool laboratoriosRefs,
            bool ventilacionSavinaRefs,
            bool sesionesHdRefs,
            bool calculosRealizadosRefs,
          })
        > {
  $$PacientesTableTableManager(_$AppDatabase db, $PacientesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PacientesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PacientesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PacientesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> numeroHc = const Value.absent(),
                Value<String> nombreCompleto = const Value.absent(),
                Value<String> nombreNormalizado = const Value.absent(),
                Value<String?> cedula = const Value.absent(),
                Value<DateTime> fechaNacimiento = const Value.absent(),
                Value<String> sexo = const Value.absent(),
                Value<String?> grupoSanguineo = const Value.absent(),
                Value<String?> factorRh = const Value.absent(),
                Value<double?> pesoSeco = const Value.absent(),
                Value<double?> pesoActual = const Value.absent(),
                Value<double?> talla = const Value.absent(),
                Value<String?> servicioActual = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<DateTime?> fechaIngreso = const Value.absent(),
                Value<DateTime?> fechaEgreso = const Value.absent(),
                Value<String?> motivoIngreso = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime> actualizadoEn = const Value.absent(),
              }) => PacientesCompanion(
                id: id,
                numeroHc: numeroHc,
                nombreCompleto: nombreCompleto,
                nombreNormalizado: nombreNormalizado,
                cedula: cedula,
                fechaNacimiento: fechaNacimiento,
                sexo: sexo,
                grupoSanguineo: grupoSanguineo,
                factorRh: factorRh,
                pesoSeco: pesoSeco,
                pesoActual: pesoActual,
                talla: talla,
                servicioActual: servicioActual,
                estado: estado,
                fechaIngreso: fechaIngreso,
                fechaEgreso: fechaEgreso,
                motivoIngreso: motivoIngreso,
                creadoEn: creadoEn,
                actualizadoEn: actualizadoEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String numeroHc,
                required String nombreCompleto,
                required String nombreNormalizado,
                Value<String?> cedula = const Value.absent(),
                required DateTime fechaNacimiento,
                required String sexo,
                Value<String?> grupoSanguineo = const Value.absent(),
                Value<String?> factorRh = const Value.absent(),
                Value<double?> pesoSeco = const Value.absent(),
                Value<double?> pesoActual = const Value.absent(),
                Value<double?> talla = const Value.absent(),
                Value<String?> servicioActual = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<DateTime?> fechaIngreso = const Value.absent(),
                Value<DateTime?> fechaEgreso = const Value.absent(),
                Value<String?> motivoIngreso = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime> actualizadoEn = const Value.absent(),
              }) => PacientesCompanion.insert(
                id: id,
                numeroHc: numeroHc,
                nombreCompleto: nombreCompleto,
                nombreNormalizado: nombreNormalizado,
                cedula: cedula,
                fechaNacimiento: fechaNacimiento,
                sexo: sexo,
                grupoSanguineo: grupoSanguineo,
                factorRh: factorRh,
                pesoSeco: pesoSeco,
                pesoActual: pesoActual,
                talla: talla,
                servicioActual: servicioActual,
                estado: estado,
                fechaIngreso: fechaIngreso,
                fechaEgreso: fechaEgreso,
                motivoIngreso: motivoIngreso,
                creadoEn: creadoEn,
                actualizadoEn: actualizadoEn,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PacientesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                historiasClinicasRefs = false,
                episodiosRefs = false,
                signosVitalesRefs = false,
                laboratoriosRefs = false,
                ventilacionSavinaRefs = false,
                sesionesHdRefs = false,
                calculosRealizadosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (historiasClinicasRefs) db.historiasClinicas,
                    if (episodiosRefs) db.episodios,
                    if (signosVitalesRefs) db.signosVitales,
                    if (laboratoriosRefs) db.laboratorios,
                    if (ventilacionSavinaRefs) db.ventilacionSavina,
                    if (sesionesHdRefs) db.sesionesHd,
                    if (calculosRealizadosRefs) db.calculosRealizados,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (historiasClinicasRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          HistoriasClinica
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._historiasClinicasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).historiasClinicasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (episodiosRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          Episodio
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._episodiosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).episodiosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (signosVitalesRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          SignosVitale
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._signosVitalesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).signosVitalesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (laboratoriosRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          Laboratorio
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._laboratoriosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).laboratoriosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ventilacionSavinaRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          VentilacionSavinaData
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._ventilacionSavinaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).ventilacionSavinaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sesionesHdRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          SesionesHdData
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._sesionesHdRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).sesionesHdRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (calculosRealizadosRefs)
                        await $_getPrefetchedData<
                          Paciente,
                          $PacientesTable,
                          CalculosRealizado
                        >(
                          currentTable: table,
                          referencedTable: $$PacientesTableReferences
                              ._calculosRealizadosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PacientesTableReferences(
                                db,
                                table,
                                p0,
                              ).calculosRealizadosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pacienteId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PacientesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PacientesTable,
      Paciente,
      $$PacientesTableFilterComposer,
      $$PacientesTableOrderingComposer,
      $$PacientesTableAnnotationComposer,
      $$PacientesTableCreateCompanionBuilder,
      $$PacientesTableUpdateCompanionBuilder,
      (Paciente, $$PacientesTableReferences),
      Paciente,
      PrefetchHooks Function({
        bool historiasClinicasRefs,
        bool episodiosRefs,
        bool signosVitalesRefs,
        bool laboratoriosRefs,
        bool ventilacionSavinaRefs,
        bool sesionesHdRefs,
        bool calculosRealizadosRefs,
      })
    >;
typedef $$HistoriasClinicasTableCreateCompanionBuilder =
    HistoriasClinicasCompanion Function({
      Value<int> id,
      required int pacienteId,
      Value<String?> hea,
      Value<String?> app,
      Value<String?> apf,
      Value<String?> alergias,
      Value<String?> operacionesPrevias,
      Value<String?> datosPositivosInterrogatorio,
      Value<String?> examenFisico,
      Value<DateTime> creadoEn,
      Value<DateTime> actualizadoEn,
    });
typedef $$HistoriasClinicasTableUpdateCompanionBuilder =
    HistoriasClinicasCompanion Function({
      Value<int> id,
      Value<int> pacienteId,
      Value<String?> hea,
      Value<String?> app,
      Value<String?> apf,
      Value<String?> alergias,
      Value<String?> operacionesPrevias,
      Value<String?> datosPositivosInterrogatorio,
      Value<String?> examenFisico,
      Value<DateTime> creadoEn,
      Value<DateTime> actualizadoEn,
    });

final class $$HistoriasClinicasTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HistoriasClinicasTable,
          HistoriasClinica
        > {
  $$HistoriasClinicasTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.historiasClinicas.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistoriasClinicasTableFilterComposer
    extends Composer<_$AppDatabase, $HistoriasClinicasTable> {
  $$HistoriasClinicasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hea => $composableBuilder(
    column: $table.hea,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get app => $composableBuilder(
    column: $table.app,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apf => $composableBuilder(
    column: $table.apf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alergias => $composableBuilder(
    column: $table.alergias,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operacionesPrevias => $composableBuilder(
    column: $table.operacionesPrevias,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get datosPositivosInterrogatorio => $composableBuilder(
    column: $table.datosPositivosInterrogatorio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get examenFisico => $composableBuilder(
    column: $table.examenFisico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoriasClinicasTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoriasClinicasTable> {
  $$HistoriasClinicasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hea => $composableBuilder(
    column: $table.hea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get app => $composableBuilder(
    column: $table.app,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apf => $composableBuilder(
    column: $table.apf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alergias => $composableBuilder(
    column: $table.alergias,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operacionesPrevias => $composableBuilder(
    column: $table.operacionesPrevias,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get datosPositivosInterrogatorio =>
      $composableBuilder(
        column: $table.datosPositivosInterrogatorio,
        builder: (column) => ColumnOrderings(column),
      );

  ColumnOrderings<String> get examenFisico => $composableBuilder(
    column: $table.examenFisico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoriasClinicasTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoriasClinicasTable> {
  $$HistoriasClinicasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hea =>
      $composableBuilder(column: $table.hea, builder: (column) => column);

  GeneratedColumn<String> get app =>
      $composableBuilder(column: $table.app, builder: (column) => column);

  GeneratedColumn<String> get apf =>
      $composableBuilder(column: $table.apf, builder: (column) => column);

  GeneratedColumn<String> get alergias =>
      $composableBuilder(column: $table.alergias, builder: (column) => column);

  GeneratedColumn<String> get operacionesPrevias => $composableBuilder(
    column: $table.operacionesPrevias,
    builder: (column) => column,
  );

  GeneratedColumn<String> get datosPositivosInterrogatorio =>
      $composableBuilder(
        column: $table.datosPositivosInterrogatorio,
        builder: (column) => column,
      );

  GeneratedColumn<String> get examenFisico => $composableBuilder(
    column: $table.examenFisico,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  GeneratedColumn<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => column,
  );

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistoriasClinicasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoriasClinicasTable,
          HistoriasClinica,
          $$HistoriasClinicasTableFilterComposer,
          $$HistoriasClinicasTableOrderingComposer,
          $$HistoriasClinicasTableAnnotationComposer,
          $$HistoriasClinicasTableCreateCompanionBuilder,
          $$HistoriasClinicasTableUpdateCompanionBuilder,
          (HistoriasClinica, $$HistoriasClinicasTableReferences),
          HistoriasClinica,
          PrefetchHooks Function({bool pacienteId})
        > {
  $$HistoriasClinicasTableTableManager(
    _$AppDatabase db,
    $HistoriasClinicasTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoriasClinicasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoriasClinicasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoriasClinicasTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<String?> hea = const Value.absent(),
                Value<String?> app = const Value.absent(),
                Value<String?> apf = const Value.absent(),
                Value<String?> alergias = const Value.absent(),
                Value<String?> operacionesPrevias = const Value.absent(),
                Value<String?> datosPositivosInterrogatorio =
                    const Value.absent(),
                Value<String?> examenFisico = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime> actualizadoEn = const Value.absent(),
              }) => HistoriasClinicasCompanion(
                id: id,
                pacienteId: pacienteId,
                hea: hea,
                app: app,
                apf: apf,
                alergias: alergias,
                operacionesPrevias: operacionesPrevias,
                datosPositivosInterrogatorio: datosPositivosInterrogatorio,
                examenFisico: examenFisico,
                creadoEn: creadoEn,
                actualizadoEn: actualizadoEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pacienteId,
                Value<String?> hea = const Value.absent(),
                Value<String?> app = const Value.absent(),
                Value<String?> apf = const Value.absent(),
                Value<String?> alergias = const Value.absent(),
                Value<String?> operacionesPrevias = const Value.absent(),
                Value<String?> datosPositivosInterrogatorio =
                    const Value.absent(),
                Value<String?> examenFisico = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
                Value<DateTime> actualizadoEn = const Value.absent(),
              }) => HistoriasClinicasCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                hea: hea,
                app: app,
                apf: apf,
                alergias: alergias,
                operacionesPrevias: operacionesPrevias,
                datosPositivosInterrogatorio: datosPositivosInterrogatorio,
                examenFisico: examenFisico,
                creadoEn: creadoEn,
                actualizadoEn: actualizadoEn,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistoriasClinicasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pacienteId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable:
                                    $$HistoriasClinicasTableReferences
                                        ._pacienteIdTable(db),
                                referencedColumn:
                                    $$HistoriasClinicasTableReferences
                                        ._pacienteIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistoriasClinicasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoriasClinicasTable,
      HistoriasClinica,
      $$HistoriasClinicasTableFilterComposer,
      $$HistoriasClinicasTableOrderingComposer,
      $$HistoriasClinicasTableAnnotationComposer,
      $$HistoriasClinicasTableCreateCompanionBuilder,
      $$HistoriasClinicasTableUpdateCompanionBuilder,
      (HistoriasClinica, $$HistoriasClinicasTableReferences),
      HistoriasClinica,
      PrefetchHooks Function({bool pacienteId})
    >;
typedef $$EpisodiosTableCreateCompanionBuilder =
    EpisodiosCompanion Function({
      Value<int> id,
      required int pacienteId,
      required String tipoEpisodio,
      required DateTime fechaIngreso,
      Value<DateTime?> fechaEgreso,
      Value<String?> servicioOrigen,
      Value<String?> motivoIngreso,
      Value<String> estado,
      Value<String?> condicionEgreso,
      Value<DateTime> creadoEn,
    });
typedef $$EpisodiosTableUpdateCompanionBuilder =
    EpisodiosCompanion Function({
      Value<int> id,
      Value<int> pacienteId,
      Value<String> tipoEpisodio,
      Value<DateTime> fechaIngreso,
      Value<DateTime?> fechaEgreso,
      Value<String?> servicioOrigen,
      Value<String?> motivoIngreso,
      Value<String> estado,
      Value<String?> condicionEgreso,
      Value<DateTime> creadoEn,
    });

final class $$EpisodiosTableReferences
    extends BaseReferences<_$AppDatabase, $EpisodiosTable, Episodio> {
  $$EpisodiosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.episodios.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DiagnosticosTable, List<Diagnostico>>
  _diagnosticosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.diagnosticos,
    aliasName: $_aliasNameGenerator(
      db.episodios.id,
      db.diagnosticos.episodioId,
    ),
  );

  $$DiagnosticosTableProcessedTableManager get diagnosticosRefs {
    final manager = $$DiagnosticosTableTableManager(
      $_db,
      $_db.diagnosticos,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_diagnosticosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SignosVitalesTable, List<SignosVitale>>
  _signosVitalesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.signosVitales,
    aliasName: $_aliasNameGenerator(
      db.episodios.id,
      db.signosVitales.episodioId,
    ),
  );

  $$SignosVitalesTableProcessedTableManager get signosVitalesRefs {
    final manager = $$SignosVitalesTableTableManager(
      $_db,
      $_db.signosVitales,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_signosVitalesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LaboratoriosTable, List<Laboratorio>>
  _laboratoriosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.laboratorios,
    aliasName: $_aliasNameGenerator(
      db.episodios.id,
      db.laboratorios.episodioId,
    ),
  );

  $$LaboratoriosTableProcessedTableManager get laboratoriosRefs {
    final manager = $$LaboratoriosTableTableManager(
      $_db,
      $_db.laboratorios,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_laboratoriosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ImagenesTable, List<Imagene>> _imagenesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.imagenes,
    aliasName: $_aliasNameGenerator(db.episodios.id, db.imagenes.episodioId),
  );

  $$ImagenesTableProcessedTableManager get imagenesRefs {
    final manager = $$ImagenesTableTableManager(
      $_db,
      $_db.imagenes,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_imagenesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EkgTable, List<EkgData>> _ekgRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ekg,
    aliasName: $_aliasNameGenerator(db.episodios.id, db.ekg.episodioId),
  );

  $$EkgTableProcessedTableManager get ekgRefs {
    final manager = $$EkgTableTableManager(
      $_db,
      $_db.ekg,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ekgRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $VentilacionSavinaTable,
    List<VentilacionSavinaData>
  >
  _ventilacionSavinaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.ventilacionSavina,
        aliasName: $_aliasNameGenerator(
          db.episodios.id,
          db.ventilacionSavina.episodioId,
        ),
      );

  $$VentilacionSavinaTableProcessedTableManager get ventilacionSavinaRefs {
    final manager = $$VentilacionSavinaTableTableManager(
      $_db,
      $_db.ventilacionSavina,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ventilacionSavinaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SesionesHdTable, List<SesionesHdData>>
  _sesionesHdRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sesionesHd,
    aliasName: $_aliasNameGenerator(db.episodios.id, db.sesionesHd.episodioId),
  );

  $$SesionesHdTableProcessedTableManager get sesionesHdRefs {
    final manager = $$SesionesHdTableTableManager(
      $_db,
      $_db.sesionesHd,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sesionesHdRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CalculosRealizadosTable, List<CalculosRealizado>>
  _calculosRealizadosRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.calculosRealizados,
        aliasName: $_aliasNameGenerator(
          db.episodios.id,
          db.calculosRealizados.episodioId,
        ),
      );

  $$CalculosRealizadosTableProcessedTableManager get calculosRealizadosRefs {
    final manager = $$CalculosRealizadosTableTableManager(
      $_db,
      $_db.calculosRealizados,
    ).filter((f) => f.episodioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _calculosRealizadosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EpisodiosTableFilterComposer
    extends Composer<_$AppDatabase, $EpisodiosTable> {
  $$EpisodiosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoEpisodio => $composableBuilder(
    column: $table.tipoEpisodio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get servicioOrigen => $composableBuilder(
    column: $table.servicioOrigen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condicionEgreso => $composableBuilder(
    column: $table.condicionEgreso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> diagnosticosRefs(
    Expression<bool> Function($$DiagnosticosTableFilterComposer f) f,
  ) {
    final $$DiagnosticosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnosticos,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosticosTableFilterComposer(
            $db: $db,
            $table: $db.diagnosticos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> signosVitalesRefs(
    Expression<bool> Function($$SignosVitalesTableFilterComposer f) f,
  ) {
    final $$SignosVitalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.signosVitales,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SignosVitalesTableFilterComposer(
            $db: $db,
            $table: $db.signosVitales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> laboratoriosRefs(
    Expression<bool> Function($$LaboratoriosTableFilterComposer f) f,
  ) {
    final $$LaboratoriosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableFilterComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> imagenesRefs(
    Expression<bool> Function($$ImagenesTableFilterComposer f) f,
  ) {
    final $$ImagenesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imagenes,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImagenesTableFilterComposer(
            $db: $db,
            $table: $db.imagenes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ekgRefs(
    Expression<bool> Function($$EkgTableFilterComposer f) f,
  ) {
    final $$EkgTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ekg,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EkgTableFilterComposer(
            $db: $db,
            $table: $db.ekg,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ventilacionSavinaRefs(
    Expression<bool> Function($$VentilacionSavinaTableFilterComposer f) f,
  ) {
    final $$VentilacionSavinaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ventilacionSavina,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VentilacionSavinaTableFilterComposer(
            $db: $db,
            $table: $db.ventilacionSavina,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sesionesHdRefs(
    Expression<bool> Function($$SesionesHdTableFilterComposer f) f,
  ) {
    final $$SesionesHdTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sesionesHd,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SesionesHdTableFilterComposer(
            $db: $db,
            $table: $db.sesionesHd,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> calculosRealizadosRefs(
    Expression<bool> Function($$CalculosRealizadosTableFilterComposer f) f,
  ) {
    final $$CalculosRealizadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.calculosRealizados,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CalculosRealizadosTableFilterComposer(
            $db: $db,
            $table: $db.calculosRealizados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EpisodiosTableOrderingComposer
    extends Composer<_$AppDatabase, $EpisodiosTable> {
  $$EpisodiosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoEpisodio => $composableBuilder(
    column: $table.tipoEpisodio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get servicioOrigen => $composableBuilder(
    column: $table.servicioOrigen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condicionEgreso => $composableBuilder(
    column: $table.condicionEgreso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get creadoEn => $composableBuilder(
    column: $table.creadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EpisodiosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EpisodiosTable> {
  $$EpisodiosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipoEpisodio => $composableBuilder(
    column: $table.tipoEpisodio,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaIngreso => $composableBuilder(
    column: $table.fechaIngreso,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaEgreso => $composableBuilder(
    column: $table.fechaEgreso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get servicioOrigen => $composableBuilder(
    column: $table.servicioOrigen,
    builder: (column) => column,
  );

  GeneratedColumn<String> get motivoIngreso => $composableBuilder(
    column: $table.motivoIngreso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get condicionEgreso => $composableBuilder(
    column: $table.condicionEgreso,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get creadoEn =>
      $composableBuilder(column: $table.creadoEn, builder: (column) => column);

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> diagnosticosRefs<T extends Object>(
    Expression<T> Function($$DiagnosticosTableAnnotationComposer a) f,
  ) {
    final $$DiagnosticosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.diagnosticos,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DiagnosticosTableAnnotationComposer(
            $db: $db,
            $table: $db.diagnosticos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> signosVitalesRefs<T extends Object>(
    Expression<T> Function($$SignosVitalesTableAnnotationComposer a) f,
  ) {
    final $$SignosVitalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.signosVitales,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SignosVitalesTableAnnotationComposer(
            $db: $db,
            $table: $db.signosVitales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> laboratoriosRefs<T extends Object>(
    Expression<T> Function($$LaboratoriosTableAnnotationComposer a) f,
  ) {
    final $$LaboratoriosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableAnnotationComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> imagenesRefs<T extends Object>(
    Expression<T> Function($$ImagenesTableAnnotationComposer a) f,
  ) {
    final $$ImagenesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.imagenes,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImagenesTableAnnotationComposer(
            $db: $db,
            $table: $db.imagenes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ekgRefs<T extends Object>(
    Expression<T> Function($$EkgTableAnnotationComposer a) f,
  ) {
    final $$EkgTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ekg,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EkgTableAnnotationComposer(
            $db: $db,
            $table: $db.ekg,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ventilacionSavinaRefs<T extends Object>(
    Expression<T> Function($$VentilacionSavinaTableAnnotationComposer a) f,
  ) {
    final $$VentilacionSavinaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.ventilacionSavina,
          getReferencedColumn: (t) => t.episodioId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$VentilacionSavinaTableAnnotationComposer(
                $db: $db,
                $table: $db.ventilacionSavina,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> sesionesHdRefs<T extends Object>(
    Expression<T> Function($$SesionesHdTableAnnotationComposer a) f,
  ) {
    final $$SesionesHdTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sesionesHd,
      getReferencedColumn: (t) => t.episodioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SesionesHdTableAnnotationComposer(
            $db: $db,
            $table: $db.sesionesHd,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> calculosRealizadosRefs<T extends Object>(
    Expression<T> Function($$CalculosRealizadosTableAnnotationComposer a) f,
  ) {
    final $$CalculosRealizadosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.calculosRealizados,
          getReferencedColumn: (t) => t.episodioId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CalculosRealizadosTableAnnotationComposer(
                $db: $db,
                $table: $db.calculosRealizados,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EpisodiosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EpisodiosTable,
          Episodio,
          $$EpisodiosTableFilterComposer,
          $$EpisodiosTableOrderingComposer,
          $$EpisodiosTableAnnotationComposer,
          $$EpisodiosTableCreateCompanionBuilder,
          $$EpisodiosTableUpdateCompanionBuilder,
          (Episodio, $$EpisodiosTableReferences),
          Episodio,
          PrefetchHooks Function({
            bool pacienteId,
            bool diagnosticosRefs,
            bool signosVitalesRefs,
            bool laboratoriosRefs,
            bool imagenesRefs,
            bool ekgRefs,
            bool ventilacionSavinaRefs,
            bool sesionesHdRefs,
            bool calculosRealizadosRefs,
          })
        > {
  $$EpisodiosTableTableManager(_$AppDatabase db, $EpisodiosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpisodiosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpisodiosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpisodiosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<String> tipoEpisodio = const Value.absent(),
                Value<DateTime> fechaIngreso = const Value.absent(),
                Value<DateTime?> fechaEgreso = const Value.absent(),
                Value<String?> servicioOrigen = const Value.absent(),
                Value<String?> motivoIngreso = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String?> condicionEgreso = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => EpisodiosCompanion(
                id: id,
                pacienteId: pacienteId,
                tipoEpisodio: tipoEpisodio,
                fechaIngreso: fechaIngreso,
                fechaEgreso: fechaEgreso,
                servicioOrigen: servicioOrigen,
                motivoIngreso: motivoIngreso,
                estado: estado,
                condicionEgreso: condicionEgreso,
                creadoEn: creadoEn,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pacienteId,
                required String tipoEpisodio,
                required DateTime fechaIngreso,
                Value<DateTime?> fechaEgreso = const Value.absent(),
                Value<String?> servicioOrigen = const Value.absent(),
                Value<String?> motivoIngreso = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<String?> condicionEgreso = const Value.absent(),
                Value<DateTime> creadoEn = const Value.absent(),
              }) => EpisodiosCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                tipoEpisodio: tipoEpisodio,
                fechaIngreso: fechaIngreso,
                fechaEgreso: fechaEgreso,
                servicioOrigen: servicioOrigen,
                motivoIngreso: motivoIngreso,
                estado: estado,
                condicionEgreso: condicionEgreso,
                creadoEn: creadoEn,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EpisodiosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pacienteId = false,
                diagnosticosRefs = false,
                signosVitalesRefs = false,
                laboratoriosRefs = false,
                imagenesRefs = false,
                ekgRefs = false,
                ventilacionSavinaRefs = false,
                sesionesHdRefs = false,
                calculosRealizadosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (diagnosticosRefs) db.diagnosticos,
                    if (signosVitalesRefs) db.signosVitales,
                    if (laboratoriosRefs) db.laboratorios,
                    if (imagenesRefs) db.imagenes,
                    if (ekgRefs) db.ekg,
                    if (ventilacionSavinaRefs) db.ventilacionSavina,
                    if (sesionesHdRefs) db.sesionesHd,
                    if (calculosRealizadosRefs) db.calculosRealizados,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pacienteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pacienteId,
                                    referencedTable: $$EpisodiosTableReferences
                                        ._pacienteIdTable(db),
                                    referencedColumn: $$EpisodiosTableReferences
                                        ._pacienteIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (diagnosticosRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          Diagnostico
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._diagnosticosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).diagnosticosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (signosVitalesRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          SignosVitale
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._signosVitalesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).signosVitalesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (laboratoriosRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          Laboratorio
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._laboratoriosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).laboratoriosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (imagenesRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          Imagene
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._imagenesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).imagenesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ekgRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          EkgData
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._ekgRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(db, table, p0).ekgRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ventilacionSavinaRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          VentilacionSavinaData
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._ventilacionSavinaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).ventilacionSavinaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sesionesHdRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          SesionesHdData
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._sesionesHdRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).sesionesHdRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (calculosRealizadosRefs)
                        await $_getPrefetchedData<
                          Episodio,
                          $EpisodiosTable,
                          CalculosRealizado
                        >(
                          currentTable: table,
                          referencedTable: $$EpisodiosTableReferences
                              ._calculosRealizadosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EpisodiosTableReferences(
                                db,
                                table,
                                p0,
                              ).calculosRealizadosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodioId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EpisodiosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EpisodiosTable,
      Episodio,
      $$EpisodiosTableFilterComposer,
      $$EpisodiosTableOrderingComposer,
      $$EpisodiosTableAnnotationComposer,
      $$EpisodiosTableCreateCompanionBuilder,
      $$EpisodiosTableUpdateCompanionBuilder,
      (Episodio, $$EpisodiosTableReferences),
      Episodio,
      PrefetchHooks Function({
        bool pacienteId,
        bool diagnosticosRefs,
        bool signosVitalesRefs,
        bool laboratoriosRefs,
        bool imagenesRefs,
        bool ekgRefs,
        bool ventilacionSavinaRefs,
        bool sesionesHdRefs,
        bool calculosRealizadosRefs,
      })
    >;
typedef $$DiagnosticosTableCreateCompanionBuilder =
    DiagnosticosCompanion Function({
      Value<int> id,
      required int episodioId,
      Value<String?> codigoCie,
      required String descripcion,
      Value<String> tipo,
      Value<DateTime> fecha,
    });
typedef $$DiagnosticosTableUpdateCompanionBuilder =
    DiagnosticosCompanion Function({
      Value<int> id,
      Value<int> episodioId,
      Value<String?> codigoCie,
      Value<String> descripcion,
      Value<String> tipo,
      Value<DateTime> fecha,
    });

final class $$DiagnosticosTableReferences
    extends BaseReferences<_$AppDatabase, $DiagnosticosTable, Diagnostico> {
  $$DiagnosticosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.diagnosticos.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager get episodioId {
    final $_column = $_itemColumn<int>('episodio_id')!;

    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DiagnosticosTableFilterComposer
    extends Composer<_$AppDatabase, $DiagnosticosTable> {
  $$DiagnosticosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codigoCie => $composableBuilder(
    column: $table.codigoCie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiagnosticosTableOrderingComposer
    extends Composer<_$AppDatabase, $DiagnosticosTable> {
  $$DiagnosticosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codigoCie => $composableBuilder(
    column: $table.codigoCie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiagnosticosTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiagnosticosTable> {
  $$DiagnosticosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codigoCie =>
      $composableBuilder(column: $table.codigoCie, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DiagnosticosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiagnosticosTable,
          Diagnostico,
          $$DiagnosticosTableFilterComposer,
          $$DiagnosticosTableOrderingComposer,
          $$DiagnosticosTableAnnotationComposer,
          $$DiagnosticosTableCreateCompanionBuilder,
          $$DiagnosticosTableUpdateCompanionBuilder,
          (Diagnostico, $$DiagnosticosTableReferences),
          Diagnostico,
          PrefetchHooks Function({bool episodioId})
        > {
  $$DiagnosticosTableTableManager(_$AppDatabase db, $DiagnosticosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiagnosticosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiagnosticosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiagnosticosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> episodioId = const Value.absent(),
                Value<String?> codigoCie = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => DiagnosticosCompanion(
                id: id,
                episodioId: episodioId,
                codigoCie: codigoCie,
                descripcion: descripcion,
                tipo: tipo,
                fecha: fecha,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int episodioId,
                Value<String?> codigoCie = const Value.absent(),
                required String descripcion,
                Value<String> tipo = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => DiagnosticosCompanion.insert(
                id: id,
                episodioId: episodioId,
                codigoCie: codigoCie,
                descripcion: descripcion,
                tipo: tipo,
                fecha: fecha,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DiagnosticosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable: $$DiagnosticosTableReferences
                                    ._episodioIdTable(db),
                                referencedColumn: $$DiagnosticosTableReferences
                                    ._episodioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DiagnosticosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiagnosticosTable,
      Diagnostico,
      $$DiagnosticosTableFilterComposer,
      $$DiagnosticosTableOrderingComposer,
      $$DiagnosticosTableAnnotationComposer,
      $$DiagnosticosTableCreateCompanionBuilder,
      $$DiagnosticosTableUpdateCompanionBuilder,
      (Diagnostico, $$DiagnosticosTableReferences),
      Diagnostico,
      PrefetchHooks Function({bool episodioId})
    >;
typedef $$SignosVitalesTableCreateCompanionBuilder =
    SignosVitalesCompanion Function({
      Value<int> id,
      required int pacienteId,
      Value<int?> episodioId,
      required DateTime timestamp,
      Value<double?> frecuenciaCardiaca,
      Value<double?> presionSistolica,
      Value<double?> presionDiastolica,
      Value<double?> presionMedia,
      Value<double?> frecuenciaRespiratoria,
      Value<double?> temperatura,
      Value<double?> saturacionO2,
      Value<double?> diuresis,
      Value<String?> notas,
      Value<bool> invalidado,
    });
typedef $$SignosVitalesTableUpdateCompanionBuilder =
    SignosVitalesCompanion Function({
      Value<int> id,
      Value<int> pacienteId,
      Value<int?> episodioId,
      Value<DateTime> timestamp,
      Value<double?> frecuenciaCardiaca,
      Value<double?> presionSistolica,
      Value<double?> presionDiastolica,
      Value<double?> presionMedia,
      Value<double?> frecuenciaRespiratoria,
      Value<double?> temperatura,
      Value<double?> saturacionO2,
      Value<double?> diuresis,
      Value<String?> notas,
      Value<bool> invalidado,
    });

final class $$SignosVitalesTableReferences
    extends BaseReferences<_$AppDatabase, $SignosVitalesTable, SignosVitale> {
  $$SignosVitalesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.signosVitales.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.signosVitales.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager? get episodioId {
    final $_column = $_itemColumn<int>('episodio_id');
    if ($_column == null) return null;
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SignosVitalesTableFilterComposer
    extends Composer<_$AppDatabase, $SignosVitalesTable> {
  $$SignosVitalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frecuenciaCardiaca => $composableBuilder(
    column: $table.frecuenciaCardiaca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get presionSistolica => $composableBuilder(
    column: $table.presionSistolica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get presionDiastolica => $composableBuilder(
    column: $table.presionDiastolica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get presionMedia => $composableBuilder(
    column: $table.presionMedia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frecuenciaRespiratoria => $composableBuilder(
    column: $table.frecuenciaRespiratoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperatura => $composableBuilder(
    column: $table.temperatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get saturacionO2 => $composableBuilder(
    column: $table.saturacionO2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diuresis => $composableBuilder(
    column: $table.diuresis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SignosVitalesTableOrderingComposer
    extends Composer<_$AppDatabase, $SignosVitalesTable> {
  $$SignosVitalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frecuenciaCardiaca => $composableBuilder(
    column: $table.frecuenciaCardiaca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get presionSistolica => $composableBuilder(
    column: $table.presionSistolica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get presionDiastolica => $composableBuilder(
    column: $table.presionDiastolica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get presionMedia => $composableBuilder(
    column: $table.presionMedia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frecuenciaRespiratoria => $composableBuilder(
    column: $table.frecuenciaRespiratoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperatura => $composableBuilder(
    column: $table.temperatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get saturacionO2 => $composableBuilder(
    column: $table.saturacionO2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diuresis => $composableBuilder(
    column: $table.diuresis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SignosVitalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignosVitalesTable> {
  $$SignosVitalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get frecuenciaCardiaca => $composableBuilder(
    column: $table.frecuenciaCardiaca,
    builder: (column) => column,
  );

  GeneratedColumn<double> get presionSistolica => $composableBuilder(
    column: $table.presionSistolica,
    builder: (column) => column,
  );

  GeneratedColumn<double> get presionDiastolica => $composableBuilder(
    column: $table.presionDiastolica,
    builder: (column) => column,
  );

  GeneratedColumn<double> get presionMedia => $composableBuilder(
    column: $table.presionMedia,
    builder: (column) => column,
  );

  GeneratedColumn<double> get frecuenciaRespiratoria => $composableBuilder(
    column: $table.frecuenciaRespiratoria,
    builder: (column) => column,
  );

  GeneratedColumn<double> get temperatura => $composableBuilder(
    column: $table.temperatura,
    builder: (column) => column,
  );

  GeneratedColumn<double> get saturacionO2 => $composableBuilder(
    column: $table.saturacionO2,
    builder: (column) => column,
  );

  GeneratedColumn<double> get diuresis =>
      $composableBuilder(column: $table.diuresis, builder: (column) => column);

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SignosVitalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SignosVitalesTable,
          SignosVitale,
          $$SignosVitalesTableFilterComposer,
          $$SignosVitalesTableOrderingComposer,
          $$SignosVitalesTableAnnotationComposer,
          $$SignosVitalesTableCreateCompanionBuilder,
          $$SignosVitalesTableUpdateCompanionBuilder,
          (SignosVitale, $$SignosVitalesTableReferences),
          SignosVitale,
          PrefetchHooks Function({bool pacienteId, bool episodioId})
        > {
  $$SignosVitalesTableTableManager(_$AppDatabase db, $SignosVitalesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SignosVitalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SignosVitalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SignosVitalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<double?> frecuenciaCardiaca = const Value.absent(),
                Value<double?> presionSistolica = const Value.absent(),
                Value<double?> presionDiastolica = const Value.absent(),
                Value<double?> presionMedia = const Value.absent(),
                Value<double?> frecuenciaRespiratoria = const Value.absent(),
                Value<double?> temperatura = const Value.absent(),
                Value<double?> saturacionO2 = const Value.absent(),
                Value<double?> diuresis = const Value.absent(),
                Value<String?> notas = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => SignosVitalesCompanion(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                timestamp: timestamp,
                frecuenciaCardiaca: frecuenciaCardiaca,
                presionSistolica: presionSistolica,
                presionDiastolica: presionDiastolica,
                presionMedia: presionMedia,
                frecuenciaRespiratoria: frecuenciaRespiratoria,
                temperatura: temperatura,
                saturacionO2: saturacionO2,
                diuresis: diuresis,
                notas: notas,
                invalidado: invalidado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pacienteId,
                Value<int?> episodioId = const Value.absent(),
                required DateTime timestamp,
                Value<double?> frecuenciaCardiaca = const Value.absent(),
                Value<double?> presionSistolica = const Value.absent(),
                Value<double?> presionDiastolica = const Value.absent(),
                Value<double?> presionMedia = const Value.absent(),
                Value<double?> frecuenciaRespiratoria = const Value.absent(),
                Value<double?> temperatura = const Value.absent(),
                Value<double?> saturacionO2 = const Value.absent(),
                Value<double?> diuresis = const Value.absent(),
                Value<String?> notas = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => SignosVitalesCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                timestamp: timestamp,
                frecuenciaCardiaca: frecuenciaCardiaca,
                presionSistolica: presionSistolica,
                presionDiastolica: presionDiastolica,
                presionMedia: presionMedia,
                frecuenciaRespiratoria: frecuenciaRespiratoria,
                temperatura: temperatura,
                saturacionO2: saturacionO2,
                diuresis: diuresis,
                notas: notas,
                invalidado: invalidado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SignosVitalesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pacienteId = false, episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable: $$SignosVitalesTableReferences
                                    ._pacienteIdTable(db),
                                referencedColumn: $$SignosVitalesTableReferences
                                    ._pacienteIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable: $$SignosVitalesTableReferences
                                    ._episodioIdTable(db),
                                referencedColumn: $$SignosVitalesTableReferences
                                    ._episodioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SignosVitalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SignosVitalesTable,
      SignosVitale,
      $$SignosVitalesTableFilterComposer,
      $$SignosVitalesTableOrderingComposer,
      $$SignosVitalesTableAnnotationComposer,
      $$SignosVitalesTableCreateCompanionBuilder,
      $$SignosVitalesTableUpdateCompanionBuilder,
      (SignosVitale, $$SignosVitalesTableReferences),
      SignosVitale,
      PrefetchHooks Function({bool pacienteId, bool episodioId})
    >;
typedef $$ParametrosClinicosTableCreateCompanionBuilder =
    ParametrosClinicosCompanion Function({
      required String codigo,
      required String nombreEs,
      required String nombreEn,
      required String nombreFr,
      required String categoria,
      required String unidadCanonica,
      Value<double?> rangoMin,
      Value<double?> rangoMax,
      Value<int> decimales,
      Value<int> rowid,
    });
typedef $$ParametrosClinicosTableUpdateCompanionBuilder =
    ParametrosClinicosCompanion Function({
      Value<String> codigo,
      Value<String> nombreEs,
      Value<String> nombreEn,
      Value<String> nombreFr,
      Value<String> categoria,
      Value<String> unidadCanonica,
      Value<double?> rangoMin,
      Value<double?> rangoMax,
      Value<int> decimales,
      Value<int> rowid,
    });

final class $$ParametrosClinicosTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ParametrosClinicosTable,
          ParametrosClinico
        > {
  $$ParametrosClinicosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$UnidadesMedidaTable, List<UnidadesMedidaData>>
  _unidadesMedidaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.unidadesMedida,
    aliasName: $_aliasNameGenerator(
      db.parametrosClinicos.codigo,
      db.unidadesMedida.parametroCodigo,
    ),
  );

  $$UnidadesMedidaTableProcessedTableManager get unidadesMedidaRefs {
    final manager = $$UnidadesMedidaTableTableManager($_db, $_db.unidadesMedida)
        .filter(
          (f) => f.parametroCodigo.codigo.sqlEquals(
            $_itemColumn<String>('codigo')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_unidadesMedidaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LaboratoriosTable, List<Laboratorio>>
  _laboratoriosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.laboratorios,
    aliasName: $_aliasNameGenerator(
      db.parametrosClinicos.codigo,
      db.laboratorios.parametroCodigo,
    ),
  );

  $$LaboratoriosTableProcessedTableManager get laboratoriosRefs {
    final manager = $$LaboratoriosTableTableManager($_db, $_db.laboratorios)
        .filter(
          (f) => f.parametroCodigo.codigo.sqlEquals(
            $_itemColumn<String>('codigo')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_laboratoriosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ParametrosClinicosTableFilterComposer
    extends Composer<_$AppDatabase, $ParametrosClinicosTable> {
  $$ParametrosClinicosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreEs => $composableBuilder(
    column: $table.nombreEs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreEn => $composableBuilder(
    column: $table.nombreEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreFr => $composableBuilder(
    column: $table.nombreFr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unidadCanonica => $composableBuilder(
    column: $table.unidadCanonica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rangoMin => $composableBuilder(
    column: $table.rangoMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rangoMax => $composableBuilder(
    column: $table.rangoMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get decimales => $composableBuilder(
    column: $table.decimales,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unidadesMedidaRefs(
    Expression<bool> Function($$UnidadesMedidaTableFilterComposer f) f,
  ) {
    final $$UnidadesMedidaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codigo,
      referencedTable: $db.unidadesMedida,
      getReferencedColumn: (t) => t.parametroCodigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnidadesMedidaTableFilterComposer(
            $db: $db,
            $table: $db.unidadesMedida,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> laboratoriosRefs(
    Expression<bool> Function($$LaboratoriosTableFilterComposer f) f,
  ) {
    final $$LaboratoriosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codigo,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.parametroCodigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableFilterComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParametrosClinicosTableOrderingComposer
    extends Composer<_$AppDatabase, $ParametrosClinicosTable> {
  $$ParametrosClinicosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get codigo => $composableBuilder(
    column: $table.codigo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreEs => $composableBuilder(
    column: $table.nombreEs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreEn => $composableBuilder(
    column: $table.nombreEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreFr => $composableBuilder(
    column: $table.nombreFr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unidadCanonica => $composableBuilder(
    column: $table.unidadCanonica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rangoMin => $composableBuilder(
    column: $table.rangoMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rangoMax => $composableBuilder(
    column: $table.rangoMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get decimales => $composableBuilder(
    column: $table.decimales,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParametrosClinicosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParametrosClinicosTable> {
  $$ParametrosClinicosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get codigo =>
      $composableBuilder(column: $table.codigo, builder: (column) => column);

  GeneratedColumn<String> get nombreEs =>
      $composableBuilder(column: $table.nombreEs, builder: (column) => column);

  GeneratedColumn<String> get nombreEn =>
      $composableBuilder(column: $table.nombreEn, builder: (column) => column);

  GeneratedColumn<String> get nombreFr =>
      $composableBuilder(column: $table.nombreFr, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get unidadCanonica => $composableBuilder(
    column: $table.unidadCanonica,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rangoMin =>
      $composableBuilder(column: $table.rangoMin, builder: (column) => column);

  GeneratedColumn<double> get rangoMax =>
      $composableBuilder(column: $table.rangoMax, builder: (column) => column);

  GeneratedColumn<int> get decimales =>
      $composableBuilder(column: $table.decimales, builder: (column) => column);

  Expression<T> unidadesMedidaRefs<T extends Object>(
    Expression<T> Function($$UnidadesMedidaTableAnnotationComposer a) f,
  ) {
    final $$UnidadesMedidaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codigo,
      referencedTable: $db.unidadesMedida,
      getReferencedColumn: (t) => t.parametroCodigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnidadesMedidaTableAnnotationComposer(
            $db: $db,
            $table: $db.unidadesMedida,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> laboratoriosRefs<T extends Object>(
    Expression<T> Function($$LaboratoriosTableAnnotationComposer a) f,
  ) {
    final $$LaboratoriosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codigo,
      referencedTable: $db.laboratorios,
      getReferencedColumn: (t) => t.parametroCodigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaboratoriosTableAnnotationComposer(
            $db: $db,
            $table: $db.laboratorios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParametrosClinicosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParametrosClinicosTable,
          ParametrosClinico,
          $$ParametrosClinicosTableFilterComposer,
          $$ParametrosClinicosTableOrderingComposer,
          $$ParametrosClinicosTableAnnotationComposer,
          $$ParametrosClinicosTableCreateCompanionBuilder,
          $$ParametrosClinicosTableUpdateCompanionBuilder,
          (ParametrosClinico, $$ParametrosClinicosTableReferences),
          ParametrosClinico,
          PrefetchHooks Function({
            bool unidadesMedidaRefs,
            bool laboratoriosRefs,
          })
        > {
  $$ParametrosClinicosTableTableManager(
    _$AppDatabase db,
    $ParametrosClinicosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParametrosClinicosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParametrosClinicosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParametrosClinicosTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> codigo = const Value.absent(),
                Value<String> nombreEs = const Value.absent(),
                Value<String> nombreEn = const Value.absent(),
                Value<String> nombreFr = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<String> unidadCanonica = const Value.absent(),
                Value<double?> rangoMin = const Value.absent(),
                Value<double?> rangoMax = const Value.absent(),
                Value<int> decimales = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParametrosClinicosCompanion(
                codigo: codigo,
                nombreEs: nombreEs,
                nombreEn: nombreEn,
                nombreFr: nombreFr,
                categoria: categoria,
                unidadCanonica: unidadCanonica,
                rangoMin: rangoMin,
                rangoMax: rangoMax,
                decimales: decimales,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codigo,
                required String nombreEs,
                required String nombreEn,
                required String nombreFr,
                required String categoria,
                required String unidadCanonica,
                Value<double?> rangoMin = const Value.absent(),
                Value<double?> rangoMax = const Value.absent(),
                Value<int> decimales = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParametrosClinicosCompanion.insert(
                codigo: codigo,
                nombreEs: nombreEs,
                nombreEn: nombreEn,
                nombreFr: nombreFr,
                categoria: categoria,
                unidadCanonica: unidadCanonica,
                rangoMin: rangoMin,
                rangoMax: rangoMax,
                decimales: decimales,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParametrosClinicosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({unidadesMedidaRefs = false, laboratoriosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (unidadesMedidaRefs) db.unidadesMedida,
                    if (laboratoriosRefs) db.laboratorios,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (unidadesMedidaRefs)
                        await $_getPrefetchedData<
                          ParametrosClinico,
                          $ParametrosClinicosTable,
                          UnidadesMedidaData
                        >(
                          currentTable: table,
                          referencedTable: $$ParametrosClinicosTableReferences
                              ._unidadesMedidaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParametrosClinicosTableReferences(
                                db,
                                table,
                                p0,
                              ).unidadesMedidaRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parametroCodigo == item.codigo,
                              ),
                          typedResults: items,
                        ),
                      if (laboratoriosRefs)
                        await $_getPrefetchedData<
                          ParametrosClinico,
                          $ParametrosClinicosTable,
                          Laboratorio
                        >(
                          currentTable: table,
                          referencedTable: $$ParametrosClinicosTableReferences
                              ._laboratoriosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ParametrosClinicosTableReferences(
                                db,
                                table,
                                p0,
                              ).laboratoriosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parametroCodigo == item.codigo,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ParametrosClinicosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParametrosClinicosTable,
      ParametrosClinico,
      $$ParametrosClinicosTableFilterComposer,
      $$ParametrosClinicosTableOrderingComposer,
      $$ParametrosClinicosTableAnnotationComposer,
      $$ParametrosClinicosTableCreateCompanionBuilder,
      $$ParametrosClinicosTableUpdateCompanionBuilder,
      (ParametrosClinico, $$ParametrosClinicosTableReferences),
      ParametrosClinico,
      PrefetchHooks Function({bool unidadesMedidaRefs, bool laboratoriosRefs})
    >;
typedef $$CatalogoMetaTableCreateCompanionBuilder =
    CatalogoMetaCompanion Function({
      Value<int> id,
      required int version,
      Value<DateTime> seededAt,
    });
typedef $$CatalogoMetaTableUpdateCompanionBuilder =
    CatalogoMetaCompanion Function({
      Value<int> id,
      Value<int> version,
      Value<DateTime> seededAt,
    });

class $$CatalogoMetaTableFilterComposer
    extends Composer<_$AppDatabase, $CatalogoMetaTable> {
  $$CatalogoMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get seededAt => $composableBuilder(
    column: $table.seededAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CatalogoMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $CatalogoMetaTable> {
  $$CatalogoMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get seededAt => $composableBuilder(
    column: $table.seededAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatalogoMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatalogoMetaTable> {
  $$CatalogoMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get seededAt =>
      $composableBuilder(column: $table.seededAt, builder: (column) => column);
}

class $$CatalogoMetaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatalogoMetaTable,
          CatalogoMetaData,
          $$CatalogoMetaTableFilterComposer,
          $$CatalogoMetaTableOrderingComposer,
          $$CatalogoMetaTableAnnotationComposer,
          $$CatalogoMetaTableCreateCompanionBuilder,
          $$CatalogoMetaTableUpdateCompanionBuilder,
          (
            CatalogoMetaData,
            BaseReferences<_$AppDatabase, $CatalogoMetaTable, CatalogoMetaData>,
          ),
          CatalogoMetaData,
          PrefetchHooks Function()
        > {
  $$CatalogoMetaTableTableManager(_$AppDatabase db, $CatalogoMetaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatalogoMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatalogoMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatalogoMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime> seededAt = const Value.absent(),
              }) => CatalogoMetaCompanion(
                id: id,
                version: version,
                seededAt: seededAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int version,
                Value<DateTime> seededAt = const Value.absent(),
              }) => CatalogoMetaCompanion.insert(
                id: id,
                version: version,
                seededAt: seededAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CatalogoMetaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatalogoMetaTable,
      CatalogoMetaData,
      $$CatalogoMetaTableFilterComposer,
      $$CatalogoMetaTableOrderingComposer,
      $$CatalogoMetaTableAnnotationComposer,
      $$CatalogoMetaTableCreateCompanionBuilder,
      $$CatalogoMetaTableUpdateCompanionBuilder,
      (
        CatalogoMetaData,
        BaseReferences<_$AppDatabase, $CatalogoMetaTable, CatalogoMetaData>,
      ),
      CatalogoMetaData,
      PrefetchHooks Function()
    >;
typedef $$UnidadesMedidaTableCreateCompanionBuilder =
    UnidadesMedidaCompanion Function({
      Value<int> id,
      required String parametroCodigo,
      required String unidad,
      required double factorACanonica,
      Value<double> offset,
    });
typedef $$UnidadesMedidaTableUpdateCompanionBuilder =
    UnidadesMedidaCompanion Function({
      Value<int> id,
      Value<String> parametroCodigo,
      Value<String> unidad,
      Value<double> factorACanonica,
      Value<double> offset,
    });

final class $$UnidadesMedidaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UnidadesMedidaTable,
          UnidadesMedidaData
        > {
  $$UnidadesMedidaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ParametrosClinicosTable _parametroCodigoTable(_$AppDatabase db) =>
      db.parametrosClinicos.createAlias(
        $_aliasNameGenerator(
          db.unidadesMedida.parametroCodigo,
          db.parametrosClinicos.codigo,
        ),
      );

  $$ParametrosClinicosTableProcessedTableManager get parametroCodigo {
    final $_column = $_itemColumn<String>('parametro_codigo')!;

    final manager = $$ParametrosClinicosTableTableManager(
      $_db,
      $_db.parametrosClinicos,
    ).filter((f) => f.codigo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parametroCodigoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnidadesMedidaTableFilterComposer
    extends Composer<_$AppDatabase, $UnidadesMedidaTable> {
  $$UnidadesMedidaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unidad => $composableBuilder(
    column: $table.unidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get factorACanonica => $composableBuilder(
    column: $table.factorACanonica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get offset => $composableBuilder(
    column: $table.offset,
    builder: (column) => ColumnFilters(column),
  );

  $$ParametrosClinicosTableFilterComposer get parametroCodigo {
    final $$ParametrosClinicosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parametroCodigo,
      referencedTable: $db.parametrosClinicos,
      getReferencedColumn: (t) => t.codigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametrosClinicosTableFilterComposer(
            $db: $db,
            $table: $db.parametrosClinicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnidadesMedidaTableOrderingComposer
    extends Composer<_$AppDatabase, $UnidadesMedidaTable> {
  $$UnidadesMedidaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unidad => $composableBuilder(
    column: $table.unidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get factorACanonica => $composableBuilder(
    column: $table.factorACanonica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get offset => $composableBuilder(
    column: $table.offset,
    builder: (column) => ColumnOrderings(column),
  );

  $$ParametrosClinicosTableOrderingComposer get parametroCodigo {
    final $$ParametrosClinicosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parametroCodigo,
      referencedTable: $db.parametrosClinicos,
      getReferencedColumn: (t) => t.codigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametrosClinicosTableOrderingComposer(
            $db: $db,
            $table: $db.parametrosClinicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnidadesMedidaTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnidadesMedidaTable> {
  $$UnidadesMedidaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unidad =>
      $composableBuilder(column: $table.unidad, builder: (column) => column);

  GeneratedColumn<double> get factorACanonica => $composableBuilder(
    column: $table.factorACanonica,
    builder: (column) => column,
  );

  GeneratedColumn<double> get offset =>
      $composableBuilder(column: $table.offset, builder: (column) => column);

  $$ParametrosClinicosTableAnnotationComposer get parametroCodigo {
    final $$ParametrosClinicosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.parametroCodigo,
          referencedTable: $db.parametrosClinicos,
          getReferencedColumn: (t) => t.codigo,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ParametrosClinicosTableAnnotationComposer(
                $db: $db,
                $table: $db.parametrosClinicos,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$UnidadesMedidaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnidadesMedidaTable,
          UnidadesMedidaData,
          $$UnidadesMedidaTableFilterComposer,
          $$UnidadesMedidaTableOrderingComposer,
          $$UnidadesMedidaTableAnnotationComposer,
          $$UnidadesMedidaTableCreateCompanionBuilder,
          $$UnidadesMedidaTableUpdateCompanionBuilder,
          (UnidadesMedidaData, $$UnidadesMedidaTableReferences),
          UnidadesMedidaData,
          PrefetchHooks Function({bool parametroCodigo})
        > {
  $$UnidadesMedidaTableTableManager(
    _$AppDatabase db,
    $UnidadesMedidaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnidadesMedidaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnidadesMedidaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnidadesMedidaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> parametroCodigo = const Value.absent(),
                Value<String> unidad = const Value.absent(),
                Value<double> factorACanonica = const Value.absent(),
                Value<double> offset = const Value.absent(),
              }) => UnidadesMedidaCompanion(
                id: id,
                parametroCodigo: parametroCodigo,
                unidad: unidad,
                factorACanonica: factorACanonica,
                offset: offset,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String parametroCodigo,
                required String unidad,
                required double factorACanonica,
                Value<double> offset = const Value.absent(),
              }) => UnidadesMedidaCompanion.insert(
                id: id,
                parametroCodigo: parametroCodigo,
                unidad: unidad,
                factorACanonica: factorACanonica,
                offset: offset,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UnidadesMedidaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parametroCodigo = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parametroCodigo) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parametroCodigo,
                                referencedTable: $$UnidadesMedidaTableReferences
                                    ._parametroCodigoTable(db),
                                referencedColumn:
                                    $$UnidadesMedidaTableReferences
                                        ._parametroCodigoTable(db)
                                        .codigo,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UnidadesMedidaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnidadesMedidaTable,
      UnidadesMedidaData,
      $$UnidadesMedidaTableFilterComposer,
      $$UnidadesMedidaTableOrderingComposer,
      $$UnidadesMedidaTableAnnotationComposer,
      $$UnidadesMedidaTableCreateCompanionBuilder,
      $$UnidadesMedidaTableUpdateCompanionBuilder,
      (UnidadesMedidaData, $$UnidadesMedidaTableReferences),
      UnidadesMedidaData,
      PrefetchHooks Function({bool parametroCodigo})
    >;
typedef $$LaboratoriosTableCreateCompanionBuilder =
    LaboratoriosCompanion Function({
      Value<int> id,
      required int pacienteId,
      Value<int?> episodioId,
      required String parametroCodigo,
      required double valorOriginal,
      required String unidadOriginal,
      required double valorCanonicoMgDl,
      required DateTime fechaHora,
      Value<String> fuente,
      Value<bool> invalidado,
      Value<String?> notas,
    });
typedef $$LaboratoriosTableUpdateCompanionBuilder =
    LaboratoriosCompanion Function({
      Value<int> id,
      Value<int> pacienteId,
      Value<int?> episodioId,
      Value<String> parametroCodigo,
      Value<double> valorOriginal,
      Value<String> unidadOriginal,
      Value<double> valorCanonicoMgDl,
      Value<DateTime> fechaHora,
      Value<String> fuente,
      Value<bool> invalidado,
      Value<String?> notas,
    });

final class $$LaboratoriosTableReferences
    extends BaseReferences<_$AppDatabase, $LaboratoriosTable, Laboratorio> {
  $$LaboratoriosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.laboratorios.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.laboratorios.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager? get episodioId {
    final $_column = $_itemColumn<int>('episodio_id');
    if ($_column == null) return null;
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ParametrosClinicosTable _parametroCodigoTable(_$AppDatabase db) =>
      db.parametrosClinicos.createAlias(
        $_aliasNameGenerator(
          db.laboratorios.parametroCodigo,
          db.parametrosClinicos.codigo,
        ),
      );

  $$ParametrosClinicosTableProcessedTableManager get parametroCodigo {
    final $_column = $_itemColumn<String>('parametro_codigo')!;

    final manager = $$ParametrosClinicosTableTableManager(
      $_db,
      $_db.parametrosClinicos,
    ).filter((f) => f.codigo.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parametroCodigoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LaboratoriosTableFilterComposer
    extends Composer<_$AppDatabase, $LaboratoriosTable> {
  $$LaboratoriosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorOriginal => $composableBuilder(
    column: $table.valorOriginal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unidadOriginal => $composableBuilder(
    column: $table.unidadOriginal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get valorCanonicoMgDl => $composableBuilder(
    column: $table.valorCanonicoMgDl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fuente => $composableBuilder(
    column: $table.fuente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParametrosClinicosTableFilterComposer get parametroCodigo {
    final $$ParametrosClinicosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parametroCodigo,
      referencedTable: $db.parametrosClinicos,
      getReferencedColumn: (t) => t.codigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametrosClinicosTableFilterComposer(
            $db: $db,
            $table: $db.parametrosClinicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LaboratoriosTableOrderingComposer
    extends Composer<_$AppDatabase, $LaboratoriosTable> {
  $$LaboratoriosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorOriginal => $composableBuilder(
    column: $table.valorOriginal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unidadOriginal => $composableBuilder(
    column: $table.unidadOriginal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get valorCanonicoMgDl => $composableBuilder(
    column: $table.valorCanonicoMgDl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fuente => $composableBuilder(
    column: $table.fuente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParametrosClinicosTableOrderingComposer get parametroCodigo {
    final $$ParametrosClinicosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parametroCodigo,
      referencedTable: $db.parametrosClinicos,
      getReferencedColumn: (t) => t.codigo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametrosClinicosTableOrderingComposer(
            $db: $db,
            $table: $db.parametrosClinicos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LaboratoriosTableAnnotationComposer
    extends Composer<_$AppDatabase, $LaboratoriosTable> {
  $$LaboratoriosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get valorOriginal => $composableBuilder(
    column: $table.valorOriginal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unidadOriginal => $composableBuilder(
    column: $table.unidadOriginal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get valorCanonicoMgDl => $composableBuilder(
    column: $table.valorCanonicoMgDl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaHora =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  GeneratedColumn<String> get fuente =>
      $composableBuilder(column: $table.fuente, builder: (column) => column);

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ParametrosClinicosTableAnnotationComposer get parametroCodigo {
    final $$ParametrosClinicosTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.parametroCodigo,
          referencedTable: $db.parametrosClinicos,
          getReferencedColumn: (t) => t.codigo,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ParametrosClinicosTableAnnotationComposer(
                $db: $db,
                $table: $db.parametrosClinicos,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$LaboratoriosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LaboratoriosTable,
          Laboratorio,
          $$LaboratoriosTableFilterComposer,
          $$LaboratoriosTableOrderingComposer,
          $$LaboratoriosTableAnnotationComposer,
          $$LaboratoriosTableCreateCompanionBuilder,
          $$LaboratoriosTableUpdateCompanionBuilder,
          (Laboratorio, $$LaboratoriosTableReferences),
          Laboratorio,
          PrefetchHooks Function({
            bool pacienteId,
            bool episodioId,
            bool parametroCodigo,
          })
        > {
  $$LaboratoriosTableTableManager(_$AppDatabase db, $LaboratoriosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LaboratoriosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LaboratoriosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LaboratoriosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                Value<String> parametroCodigo = const Value.absent(),
                Value<double> valorOriginal = const Value.absent(),
                Value<String> unidadOriginal = const Value.absent(),
                Value<double> valorCanonicoMgDl = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<String> fuente = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
                Value<String?> notas = const Value.absent(),
              }) => LaboratoriosCompanion(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                parametroCodigo: parametroCodigo,
                valorOriginal: valorOriginal,
                unidadOriginal: unidadOriginal,
                valorCanonicoMgDl: valorCanonicoMgDl,
                fechaHora: fechaHora,
                fuente: fuente,
                invalidado: invalidado,
                notas: notas,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pacienteId,
                Value<int?> episodioId = const Value.absent(),
                required String parametroCodigo,
                required double valorOriginal,
                required String unidadOriginal,
                required double valorCanonicoMgDl,
                required DateTime fechaHora,
                Value<String> fuente = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
                Value<String?> notas = const Value.absent(),
              }) => LaboratoriosCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                parametroCodigo: parametroCodigo,
                valorOriginal: valorOriginal,
                unidadOriginal: unidadOriginal,
                valorCanonicoMgDl: valorCanonicoMgDl,
                fechaHora: fechaHora,
                fuente: fuente,
                invalidado: invalidado,
                notas: notas,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LaboratoriosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pacienteId = false,
                episodioId = false,
                parametroCodigo = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pacienteId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pacienteId,
                                    referencedTable:
                                        $$LaboratoriosTableReferences
                                            ._pacienteIdTable(db),
                                    referencedColumn:
                                        $$LaboratoriosTableReferences
                                            ._pacienteIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (episodioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.episodioId,
                                    referencedTable:
                                        $$LaboratoriosTableReferences
                                            ._episodioIdTable(db),
                                    referencedColumn:
                                        $$LaboratoriosTableReferences
                                            ._episodioIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (parametroCodigo) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parametroCodigo,
                                    referencedTable:
                                        $$LaboratoriosTableReferences
                                            ._parametroCodigoTable(db),
                                    referencedColumn:
                                        $$LaboratoriosTableReferences
                                            ._parametroCodigoTable(db)
                                            .codigo,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$LaboratoriosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LaboratoriosTable,
      Laboratorio,
      $$LaboratoriosTableFilterComposer,
      $$LaboratoriosTableOrderingComposer,
      $$LaboratoriosTableAnnotationComposer,
      $$LaboratoriosTableCreateCompanionBuilder,
      $$LaboratoriosTableUpdateCompanionBuilder,
      (Laboratorio, $$LaboratoriosTableReferences),
      Laboratorio,
      PrefetchHooks Function({
        bool pacienteId,
        bool episodioId,
        bool parametroCodigo,
      })
    >;
typedef $$ImagenesTableCreateCompanionBuilder =
    ImagenesCompanion Function({
      Value<int> id,
      required int episodioId,
      required String tipo,
      required Uint8List bytes,
      Value<String?> descripcion,
      Value<DateTime> fechaHora,
      Value<bool> invalidado,
    });
typedef $$ImagenesTableUpdateCompanionBuilder =
    ImagenesCompanion Function({
      Value<int> id,
      Value<int> episodioId,
      Value<String> tipo,
      Value<Uint8List> bytes,
      Value<String?> descripcion,
      Value<DateTime> fechaHora,
      Value<bool> invalidado,
    });

final class $$ImagenesTableReferences
    extends BaseReferences<_$AppDatabase, $ImagenesTable, Imagene> {
  $$ImagenesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.imagenes.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager get episodioId {
    final $_column = $_itemColumn<int>('episodio_id')!;

    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ImagenesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagenesTable> {
  $$ImagenesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImagenesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagenesTable> {
  $$ImagenesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImagenesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagenesTable> {
  $$ImagenesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<Uint8List> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaHora =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ImagenesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ImagenesTable,
          Imagene,
          $$ImagenesTableFilterComposer,
          $$ImagenesTableOrderingComposer,
          $$ImagenesTableAnnotationComposer,
          $$ImagenesTableCreateCompanionBuilder,
          $$ImagenesTableUpdateCompanionBuilder,
          (Imagene, $$ImagenesTableReferences),
          Imagene,
          PrefetchHooks Function({bool episodioId})
        > {
  $$ImagenesTableTableManager(_$AppDatabase db, $ImagenesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagenesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagenesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagenesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> episodioId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<Uint8List> bytes = const Value.absent(),
                Value<String?> descripcion = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => ImagenesCompanion(
                id: id,
                episodioId: episodioId,
                tipo: tipo,
                bytes: bytes,
                descripcion: descripcion,
                fechaHora: fechaHora,
                invalidado: invalidado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int episodioId,
                required String tipo,
                required Uint8List bytes,
                Value<String?> descripcion = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => ImagenesCompanion.insert(
                id: id,
                episodioId: episodioId,
                tipo: tipo,
                bytes: bytes,
                descripcion: descripcion,
                fechaHora: fechaHora,
                invalidado: invalidado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ImagenesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable: $$ImagenesTableReferences
                                    ._episodioIdTable(db),
                                referencedColumn: $$ImagenesTableReferences
                                    ._episodioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ImagenesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ImagenesTable,
      Imagene,
      $$ImagenesTableFilterComposer,
      $$ImagenesTableOrderingComposer,
      $$ImagenesTableAnnotationComposer,
      $$ImagenesTableCreateCompanionBuilder,
      $$ImagenesTableUpdateCompanionBuilder,
      (Imagene, $$ImagenesTableReferences),
      Imagene,
      PrefetchHooks Function({bool episodioId})
    >;
typedef $$EkgTableCreateCompanionBuilder =
    EkgCompanion Function({
      Value<int> id,
      required int episodioId,
      Value<String?> ritmo,
      Value<String?> frecuencia,
      Value<String?> eje,
      required String hallazgos,
      Value<Uint8List?> adjunto,
      Value<DateTime> fechaHora,
      Value<bool> invalidado,
    });
typedef $$EkgTableUpdateCompanionBuilder =
    EkgCompanion Function({
      Value<int> id,
      Value<int> episodioId,
      Value<String?> ritmo,
      Value<String?> frecuencia,
      Value<String?> eje,
      Value<String> hallazgos,
      Value<Uint8List?> adjunto,
      Value<DateTime> fechaHora,
      Value<bool> invalidado,
    });

final class $$EkgTableReferences
    extends BaseReferences<_$AppDatabase, $EkgTable, EkgData> {
  $$EkgTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) => db.episodios
      .createAlias($_aliasNameGenerator(db.ekg.episodioId, db.episodios.id));

  $$EpisodiosTableProcessedTableManager get episodioId {
    final $_column = $_itemColumn<int>('episodio_id')!;

    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EkgTableFilterComposer extends Composer<_$AppDatabase, $EkgTable> {
  $$EkgTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ritmo => $composableBuilder(
    column: $table.ritmo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frecuencia => $composableBuilder(
    column: $table.frecuencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eje => $composableBuilder(
    column: $table.eje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hallazgos => $composableBuilder(
    column: $table.hallazgos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get adjunto => $composableBuilder(
    column: $table.adjunto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EkgTableOrderingComposer extends Composer<_$AppDatabase, $EkgTable> {
  $$EkgTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ritmo => $composableBuilder(
    column: $table.ritmo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frecuencia => $composableBuilder(
    column: $table.frecuencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eje => $composableBuilder(
    column: $table.eje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hallazgos => $composableBuilder(
    column: $table.hallazgos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get adjunto => $composableBuilder(
    column: $table.adjunto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EkgTableAnnotationComposer extends Composer<_$AppDatabase, $EkgTable> {
  $$EkgTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ritmo =>
      $composableBuilder(column: $table.ritmo, builder: (column) => column);

  GeneratedColumn<String> get frecuencia => $composableBuilder(
    column: $table.frecuencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eje =>
      $composableBuilder(column: $table.eje, builder: (column) => column);

  GeneratedColumn<String> get hallazgos =>
      $composableBuilder(column: $table.hallazgos, builder: (column) => column);

  GeneratedColumn<Uint8List> get adjunto =>
      $composableBuilder(column: $table.adjunto, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaHora =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EkgTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EkgTable,
          EkgData,
          $$EkgTableFilterComposer,
          $$EkgTableOrderingComposer,
          $$EkgTableAnnotationComposer,
          $$EkgTableCreateCompanionBuilder,
          $$EkgTableUpdateCompanionBuilder,
          (EkgData, $$EkgTableReferences),
          EkgData,
          PrefetchHooks Function({bool episodioId})
        > {
  $$EkgTableTableManager(_$AppDatabase db, $EkgTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EkgTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EkgTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EkgTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> episodioId = const Value.absent(),
                Value<String?> ritmo = const Value.absent(),
                Value<String?> frecuencia = const Value.absent(),
                Value<String?> eje = const Value.absent(),
                Value<String> hallazgos = const Value.absent(),
                Value<Uint8List?> adjunto = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => EkgCompanion(
                id: id,
                episodioId: episodioId,
                ritmo: ritmo,
                frecuencia: frecuencia,
                eje: eje,
                hallazgos: hallazgos,
                adjunto: adjunto,
                fechaHora: fechaHora,
                invalidado: invalidado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int episodioId,
                Value<String?> ritmo = const Value.absent(),
                Value<String?> frecuencia = const Value.absent(),
                Value<String?> eje = const Value.absent(),
                required String hallazgos,
                Value<Uint8List?> adjunto = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => EkgCompanion.insert(
                id: id,
                episodioId: episodioId,
                ritmo: ritmo,
                frecuencia: frecuencia,
                eje: eje,
                hallazgos: hallazgos,
                adjunto: adjunto,
                fechaHora: fechaHora,
                invalidado: invalidado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $$EkgTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable: $$EkgTableReferences
                                    ._episodioIdTable(db),
                                referencedColumn: $$EkgTableReferences
                                    ._episodioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EkgTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EkgTable,
      EkgData,
      $$EkgTableFilterComposer,
      $$EkgTableOrderingComposer,
      $$EkgTableAnnotationComposer,
      $$EkgTableCreateCompanionBuilder,
      $$EkgTableUpdateCompanionBuilder,
      (EkgData, $$EkgTableReferences),
      EkgData,
      PrefetchHooks Function({bool episodioId})
    >;
typedef $$VentilacionSavinaTableCreateCompanionBuilder =
    VentilacionSavinaCompanion Function({
      Value<int> id,
      Value<int?> pacienteId,
      Value<int?> episodioId,
      required DateTime timestamp,
      required String modo,
      Value<double?> fio2,
      Value<double?> peep,
      Value<double?> volumenTidal,
      Value<double?> pControl,
      Value<double?> frecRespProgramada,
      Value<double?> relIE,
      Value<double?> pSoporte,
      Value<double?> trigger,
      Value<double?> pPico,
      Value<double?> pMeseta,
      Value<double?> pMedia,
      Value<double?> vtEspirado,
      Value<double?> frecRespTotal,
      Value<double?> volMinuto,
      Value<double?> fuga,
      Value<double?> drivingPressure,
      Value<double?> complianceEstatica,
      Value<double?> indiceoOxigenacion,
      Value<double?> pfRatio,
      Value<String?> ardsBerlin,
      Value<String?> notas,
      Value<bool> invalidado,
    });
typedef $$VentilacionSavinaTableUpdateCompanionBuilder =
    VentilacionSavinaCompanion Function({
      Value<int> id,
      Value<int?> pacienteId,
      Value<int?> episodioId,
      Value<DateTime> timestamp,
      Value<String> modo,
      Value<double?> fio2,
      Value<double?> peep,
      Value<double?> volumenTidal,
      Value<double?> pControl,
      Value<double?> frecRespProgramada,
      Value<double?> relIE,
      Value<double?> pSoporte,
      Value<double?> trigger,
      Value<double?> pPico,
      Value<double?> pMeseta,
      Value<double?> pMedia,
      Value<double?> vtEspirado,
      Value<double?> frecRespTotal,
      Value<double?> volMinuto,
      Value<double?> fuga,
      Value<double?> drivingPressure,
      Value<double?> complianceEstatica,
      Value<double?> indiceoOxigenacion,
      Value<double?> pfRatio,
      Value<String?> ardsBerlin,
      Value<String?> notas,
      Value<bool> invalidado,
    });

final class $$VentilacionSavinaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $VentilacionSavinaTable,
          VentilacionSavinaData
        > {
  $$VentilacionSavinaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.ventilacionSavina.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager? get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id');
    if ($_column == null) return null;
    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.ventilacionSavina.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager? get episodioId {
    final $_column = $_itemColumn<int>('episodio_id');
    if ($_column == null) return null;
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VentilacionSavinaTableFilterComposer
    extends Composer<_$AppDatabase, $VentilacionSavinaTable> {
  $$VentilacionSavinaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modo => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fio2 => $composableBuilder(
    column: $table.fio2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get peep => $composableBuilder(
    column: $table.peep,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volumenTidal => $composableBuilder(
    column: $table.volumenTidal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pControl => $composableBuilder(
    column: $table.pControl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frecRespProgramada => $composableBuilder(
    column: $table.frecRespProgramada,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get relIE => $composableBuilder(
    column: $table.relIE,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pSoporte => $composableBuilder(
    column: $table.pSoporte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pPico => $composableBuilder(
    column: $table.pPico,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pMeseta => $composableBuilder(
    column: $table.pMeseta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pMedia => $composableBuilder(
    column: $table.pMedia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get vtEspirado => $composableBuilder(
    column: $table.vtEspirado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get frecRespTotal => $composableBuilder(
    column: $table.frecRespTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get volMinuto => $composableBuilder(
    column: $table.volMinuto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fuga => $composableBuilder(
    column: $table.fuga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get drivingPressure => $composableBuilder(
    column: $table.drivingPressure,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get complianceEstatica => $composableBuilder(
    column: $table.complianceEstatica,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get indiceoOxigenacion => $composableBuilder(
    column: $table.indiceoOxigenacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pfRatio => $composableBuilder(
    column: $table.pfRatio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ardsBerlin => $composableBuilder(
    column: $table.ardsBerlin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VentilacionSavinaTableOrderingComposer
    extends Composer<_$AppDatabase, $VentilacionSavinaTable> {
  $$VentilacionSavinaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modo => $composableBuilder(
    column: $table.modo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fio2 => $composableBuilder(
    column: $table.fio2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get peep => $composableBuilder(
    column: $table.peep,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volumenTidal => $composableBuilder(
    column: $table.volumenTidal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pControl => $composableBuilder(
    column: $table.pControl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frecRespProgramada => $composableBuilder(
    column: $table.frecRespProgramada,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get relIE => $composableBuilder(
    column: $table.relIE,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pSoporte => $composableBuilder(
    column: $table.pSoporte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get trigger => $composableBuilder(
    column: $table.trigger,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pPico => $composableBuilder(
    column: $table.pPico,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pMeseta => $composableBuilder(
    column: $table.pMeseta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pMedia => $composableBuilder(
    column: $table.pMedia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get vtEspirado => $composableBuilder(
    column: $table.vtEspirado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get frecRespTotal => $composableBuilder(
    column: $table.frecRespTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get volMinuto => $composableBuilder(
    column: $table.volMinuto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fuga => $composableBuilder(
    column: $table.fuga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get drivingPressure => $composableBuilder(
    column: $table.drivingPressure,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get complianceEstatica => $composableBuilder(
    column: $table.complianceEstatica,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get indiceoOxigenacion => $composableBuilder(
    column: $table.indiceoOxigenacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pfRatio => $composableBuilder(
    column: $table.pfRatio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ardsBerlin => $composableBuilder(
    column: $table.ardsBerlin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notas => $composableBuilder(
    column: $table.notas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VentilacionSavinaTableAnnotationComposer
    extends Composer<_$AppDatabase, $VentilacionSavinaTable> {
  $$VentilacionSavinaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get modo =>
      $composableBuilder(column: $table.modo, builder: (column) => column);

  GeneratedColumn<double> get fio2 =>
      $composableBuilder(column: $table.fio2, builder: (column) => column);

  GeneratedColumn<double> get peep =>
      $composableBuilder(column: $table.peep, builder: (column) => column);

  GeneratedColumn<double> get volumenTidal => $composableBuilder(
    column: $table.volumenTidal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pControl =>
      $composableBuilder(column: $table.pControl, builder: (column) => column);

  GeneratedColumn<double> get frecRespProgramada => $composableBuilder(
    column: $table.frecRespProgramada,
    builder: (column) => column,
  );

  GeneratedColumn<double> get relIE =>
      $composableBuilder(column: $table.relIE, builder: (column) => column);

  GeneratedColumn<double> get pSoporte =>
      $composableBuilder(column: $table.pSoporte, builder: (column) => column);

  GeneratedColumn<double> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<double> get pPico =>
      $composableBuilder(column: $table.pPico, builder: (column) => column);

  GeneratedColumn<double> get pMeseta =>
      $composableBuilder(column: $table.pMeseta, builder: (column) => column);

  GeneratedColumn<double> get pMedia =>
      $composableBuilder(column: $table.pMedia, builder: (column) => column);

  GeneratedColumn<double> get vtEspirado => $composableBuilder(
    column: $table.vtEspirado,
    builder: (column) => column,
  );

  GeneratedColumn<double> get frecRespTotal => $composableBuilder(
    column: $table.frecRespTotal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get volMinuto =>
      $composableBuilder(column: $table.volMinuto, builder: (column) => column);

  GeneratedColumn<double> get fuga =>
      $composableBuilder(column: $table.fuga, builder: (column) => column);

  GeneratedColumn<double> get drivingPressure => $composableBuilder(
    column: $table.drivingPressure,
    builder: (column) => column,
  );

  GeneratedColumn<double> get complianceEstatica => $composableBuilder(
    column: $table.complianceEstatica,
    builder: (column) => column,
  );

  GeneratedColumn<double> get indiceoOxigenacion => $composableBuilder(
    column: $table.indiceoOxigenacion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pfRatio =>
      $composableBuilder(column: $table.pfRatio, builder: (column) => column);

  GeneratedColumn<String> get ardsBerlin => $composableBuilder(
    column: $table.ardsBerlin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VentilacionSavinaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VentilacionSavinaTable,
          VentilacionSavinaData,
          $$VentilacionSavinaTableFilterComposer,
          $$VentilacionSavinaTableOrderingComposer,
          $$VentilacionSavinaTableAnnotationComposer,
          $$VentilacionSavinaTableCreateCompanionBuilder,
          $$VentilacionSavinaTableUpdateCompanionBuilder,
          (VentilacionSavinaData, $$VentilacionSavinaTableReferences),
          VentilacionSavinaData,
          PrefetchHooks Function({bool pacienteId, bool episodioId})
        > {
  $$VentilacionSavinaTableTableManager(
    _$AppDatabase db,
    $VentilacionSavinaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VentilacionSavinaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VentilacionSavinaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VentilacionSavinaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String> modo = const Value.absent(),
                Value<double?> fio2 = const Value.absent(),
                Value<double?> peep = const Value.absent(),
                Value<double?> volumenTidal = const Value.absent(),
                Value<double?> pControl = const Value.absent(),
                Value<double?> frecRespProgramada = const Value.absent(),
                Value<double?> relIE = const Value.absent(),
                Value<double?> pSoporte = const Value.absent(),
                Value<double?> trigger = const Value.absent(),
                Value<double?> pPico = const Value.absent(),
                Value<double?> pMeseta = const Value.absent(),
                Value<double?> pMedia = const Value.absent(),
                Value<double?> vtEspirado = const Value.absent(),
                Value<double?> frecRespTotal = const Value.absent(),
                Value<double?> volMinuto = const Value.absent(),
                Value<double?> fuga = const Value.absent(),
                Value<double?> drivingPressure = const Value.absent(),
                Value<double?> complianceEstatica = const Value.absent(),
                Value<double?> indiceoOxigenacion = const Value.absent(),
                Value<double?> pfRatio = const Value.absent(),
                Value<String?> ardsBerlin = const Value.absent(),
                Value<String?> notas = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => VentilacionSavinaCompanion(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                timestamp: timestamp,
                modo: modo,
                fio2: fio2,
                peep: peep,
                volumenTidal: volumenTidal,
                pControl: pControl,
                frecRespProgramada: frecRespProgramada,
                relIE: relIE,
                pSoporte: pSoporte,
                trigger: trigger,
                pPico: pPico,
                pMeseta: pMeseta,
                pMedia: pMedia,
                vtEspirado: vtEspirado,
                frecRespTotal: frecRespTotal,
                volMinuto: volMinuto,
                fuga: fuga,
                drivingPressure: drivingPressure,
                complianceEstatica: complianceEstatica,
                indiceoOxigenacion: indiceoOxigenacion,
                pfRatio: pfRatio,
                ardsBerlin: ardsBerlin,
                notas: notas,
                invalidado: invalidado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                required DateTime timestamp,
                required String modo,
                Value<double?> fio2 = const Value.absent(),
                Value<double?> peep = const Value.absent(),
                Value<double?> volumenTidal = const Value.absent(),
                Value<double?> pControl = const Value.absent(),
                Value<double?> frecRespProgramada = const Value.absent(),
                Value<double?> relIE = const Value.absent(),
                Value<double?> pSoporte = const Value.absent(),
                Value<double?> trigger = const Value.absent(),
                Value<double?> pPico = const Value.absent(),
                Value<double?> pMeseta = const Value.absent(),
                Value<double?> pMedia = const Value.absent(),
                Value<double?> vtEspirado = const Value.absent(),
                Value<double?> frecRespTotal = const Value.absent(),
                Value<double?> volMinuto = const Value.absent(),
                Value<double?> fuga = const Value.absent(),
                Value<double?> drivingPressure = const Value.absent(),
                Value<double?> complianceEstatica = const Value.absent(),
                Value<double?> indiceoOxigenacion = const Value.absent(),
                Value<double?> pfRatio = const Value.absent(),
                Value<String?> ardsBerlin = const Value.absent(),
                Value<String?> notas = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => VentilacionSavinaCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                timestamp: timestamp,
                modo: modo,
                fio2: fio2,
                peep: peep,
                volumenTidal: volumenTidal,
                pControl: pControl,
                frecRespProgramada: frecRespProgramada,
                relIE: relIE,
                pSoporte: pSoporte,
                trigger: trigger,
                pPico: pPico,
                pMeseta: pMeseta,
                pMedia: pMedia,
                vtEspirado: vtEspirado,
                frecRespTotal: frecRespTotal,
                volMinuto: volMinuto,
                fuga: fuga,
                drivingPressure: drivingPressure,
                complianceEstatica: complianceEstatica,
                indiceoOxigenacion: indiceoOxigenacion,
                pfRatio: pfRatio,
                ardsBerlin: ardsBerlin,
                notas: notas,
                invalidado: invalidado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VentilacionSavinaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pacienteId = false, episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable:
                                    $$VentilacionSavinaTableReferences
                                        ._pacienteIdTable(db),
                                referencedColumn:
                                    $$VentilacionSavinaTableReferences
                                        ._pacienteIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable:
                                    $$VentilacionSavinaTableReferences
                                        ._episodioIdTable(db),
                                referencedColumn:
                                    $$VentilacionSavinaTableReferences
                                        ._episodioIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VentilacionSavinaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VentilacionSavinaTable,
      VentilacionSavinaData,
      $$VentilacionSavinaTableFilterComposer,
      $$VentilacionSavinaTableOrderingComposer,
      $$VentilacionSavinaTableAnnotationComposer,
      $$VentilacionSavinaTableCreateCompanionBuilder,
      $$VentilacionSavinaTableUpdateCompanionBuilder,
      (VentilacionSavinaData, $$VentilacionSavinaTableReferences),
      VentilacionSavinaData,
      PrefetchHooks Function({bool pacienteId, bool episodioId})
    >;
typedef $$SesionesHdTableCreateCompanionBuilder =
    SesionesHdCompanion Function({
      Value<int> id,
      Value<int?> pacienteId,
      Value<int?> episodioId,
      required DateTime fechaHoraInicio,
      Value<DateTime?> fechaHoraFin,
      required String tipoAcceso,
      Value<String?> lateralidadAcceso,
      Value<String?> tipoAccesoCateter,
      required int duracionProgramadaMin,
      Value<int?> duracionRealMin,
      required double qb,
      required double qd,
      Value<String?> dializadorTipo,
      Value<double?> dializadorSuperficieM2,
      Value<double?> dializadorKuf,
      Value<double?> banoNa,
      Value<double?> banoK,
      Value<double?> banoCa,
      Value<double?> banoHco3,
      Value<double?> banoGlucosa,
      required double ufTotalProgramadaMl,
      Value<double?> ufTotalRealMl,
      Value<double?> tasaUfMlKgH,
      Value<String?> tipoAnticoagulacion,
      Value<double?> heparinaBoloPorUI,
      Value<double?> heparinaMantenimientoUiH,
      Value<double?> pesoPreHdKg,
      Value<double?> pesoPostHdKg,
      Value<double?> pesoSecoObjetivoKg,
      Value<double?> ktvCalculado,
      Value<double?> urrCalculado,
      Value<String?> eventosDurante,
      Value<bool> invalidado,
    });
typedef $$SesionesHdTableUpdateCompanionBuilder =
    SesionesHdCompanion Function({
      Value<int> id,
      Value<int?> pacienteId,
      Value<int?> episodioId,
      Value<DateTime> fechaHoraInicio,
      Value<DateTime?> fechaHoraFin,
      Value<String> tipoAcceso,
      Value<String?> lateralidadAcceso,
      Value<String?> tipoAccesoCateter,
      Value<int> duracionProgramadaMin,
      Value<int?> duracionRealMin,
      Value<double> qb,
      Value<double> qd,
      Value<String?> dializadorTipo,
      Value<double?> dializadorSuperficieM2,
      Value<double?> dializadorKuf,
      Value<double?> banoNa,
      Value<double?> banoK,
      Value<double?> banoCa,
      Value<double?> banoHco3,
      Value<double?> banoGlucosa,
      Value<double> ufTotalProgramadaMl,
      Value<double?> ufTotalRealMl,
      Value<double?> tasaUfMlKgH,
      Value<String?> tipoAnticoagulacion,
      Value<double?> heparinaBoloPorUI,
      Value<double?> heparinaMantenimientoUiH,
      Value<double?> pesoPreHdKg,
      Value<double?> pesoPostHdKg,
      Value<double?> pesoSecoObjetivoKg,
      Value<double?> ktvCalculado,
      Value<double?> urrCalculado,
      Value<String?> eventosDurante,
      Value<bool> invalidado,
    });

final class $$SesionesHdTableReferences
    extends BaseReferences<_$AppDatabase, $SesionesHdTable, SesionesHdData> {
  $$SesionesHdTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.sesionesHd.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager? get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id');
    if ($_column == null) return null;
    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.sesionesHd.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager? get episodioId {
    final $_column = $_itemColumn<int>('episodio_id');
    if ($_column == null) return null;
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SesionesHdTableFilterComposer
    extends Composer<_$AppDatabase, $SesionesHdTable> {
  $$SesionesHdTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHoraInicio => $composableBuilder(
    column: $table.fechaHoraInicio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHoraFin => $composableBuilder(
    column: $table.fechaHoraFin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoAcceso => $composableBuilder(
    column: $table.tipoAcceso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lateralidadAcceso => $composableBuilder(
    column: $table.lateralidadAcceso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoAccesoCateter => $composableBuilder(
    column: $table.tipoAccesoCateter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duracionProgramadaMin => $composableBuilder(
    column: $table.duracionProgramadaMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duracionRealMin => $composableBuilder(
    column: $table.duracionRealMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get qb => $composableBuilder(
    column: $table.qb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get qd => $composableBuilder(
    column: $table.qd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dializadorTipo => $composableBuilder(
    column: $table.dializadorTipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dializadorSuperficieM2 => $composableBuilder(
    column: $table.dializadorSuperficieM2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dializadorKuf => $composableBuilder(
    column: $table.dializadorKuf,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get banoNa => $composableBuilder(
    column: $table.banoNa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get banoK => $composableBuilder(
    column: $table.banoK,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get banoCa => $composableBuilder(
    column: $table.banoCa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get banoHco3 => $composableBuilder(
    column: $table.banoHco3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get banoGlucosa => $composableBuilder(
    column: $table.banoGlucosa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ufTotalProgramadaMl => $composableBuilder(
    column: $table.ufTotalProgramadaMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ufTotalRealMl => $composableBuilder(
    column: $table.ufTotalRealMl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tasaUfMlKgH => $composableBuilder(
    column: $table.tasaUfMlKgH,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoAnticoagulacion => $composableBuilder(
    column: $table.tipoAnticoagulacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heparinaBoloPorUI => $composableBuilder(
    column: $table.heparinaBoloPorUI,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heparinaMantenimientoUiH => $composableBuilder(
    column: $table.heparinaMantenimientoUiH,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pesoPreHdKg => $composableBuilder(
    column: $table.pesoPreHdKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pesoPostHdKg => $composableBuilder(
    column: $table.pesoPostHdKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pesoSecoObjetivoKg => $composableBuilder(
    column: $table.pesoSecoObjetivoKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ktvCalculado => $composableBuilder(
    column: $table.ktvCalculado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get urrCalculado => $composableBuilder(
    column: $table.urrCalculado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventosDurante => $composableBuilder(
    column: $table.eventosDurante,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SesionesHdTableOrderingComposer
    extends Composer<_$AppDatabase, $SesionesHdTable> {
  $$SesionesHdTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHoraInicio => $composableBuilder(
    column: $table.fechaHoraInicio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHoraFin => $composableBuilder(
    column: $table.fechaHoraFin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoAcceso => $composableBuilder(
    column: $table.tipoAcceso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lateralidadAcceso => $composableBuilder(
    column: $table.lateralidadAcceso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoAccesoCateter => $composableBuilder(
    column: $table.tipoAccesoCateter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duracionProgramadaMin => $composableBuilder(
    column: $table.duracionProgramadaMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duracionRealMin => $composableBuilder(
    column: $table.duracionRealMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get qb => $composableBuilder(
    column: $table.qb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get qd => $composableBuilder(
    column: $table.qd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dializadorTipo => $composableBuilder(
    column: $table.dializadorTipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dializadorSuperficieM2 => $composableBuilder(
    column: $table.dializadorSuperficieM2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dializadorKuf => $composableBuilder(
    column: $table.dializadorKuf,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get banoNa => $composableBuilder(
    column: $table.banoNa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get banoK => $composableBuilder(
    column: $table.banoK,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get banoCa => $composableBuilder(
    column: $table.banoCa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get banoHco3 => $composableBuilder(
    column: $table.banoHco3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get banoGlucosa => $composableBuilder(
    column: $table.banoGlucosa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ufTotalProgramadaMl => $composableBuilder(
    column: $table.ufTotalProgramadaMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ufTotalRealMl => $composableBuilder(
    column: $table.ufTotalRealMl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tasaUfMlKgH => $composableBuilder(
    column: $table.tasaUfMlKgH,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoAnticoagulacion => $composableBuilder(
    column: $table.tipoAnticoagulacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heparinaBoloPorUI => $composableBuilder(
    column: $table.heparinaBoloPorUI,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heparinaMantenimientoUiH => $composableBuilder(
    column: $table.heparinaMantenimientoUiH,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pesoPreHdKg => $composableBuilder(
    column: $table.pesoPreHdKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pesoPostHdKg => $composableBuilder(
    column: $table.pesoPostHdKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pesoSecoObjetivoKg => $composableBuilder(
    column: $table.pesoSecoObjetivoKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ktvCalculado => $composableBuilder(
    column: $table.ktvCalculado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get urrCalculado => $composableBuilder(
    column: $table.urrCalculado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventosDurante => $composableBuilder(
    column: $table.eventosDurante,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SesionesHdTableAnnotationComposer
    extends Composer<_$AppDatabase, $SesionesHdTable> {
  $$SesionesHdTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaHoraInicio => $composableBuilder(
    column: $table.fechaHoraInicio,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaHoraFin => $composableBuilder(
    column: $table.fechaHoraFin,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipoAcceso => $composableBuilder(
    column: $table.tipoAcceso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lateralidadAcceso => $composableBuilder(
    column: $table.lateralidadAcceso,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipoAccesoCateter => $composableBuilder(
    column: $table.tipoAccesoCateter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duracionProgramadaMin => $composableBuilder(
    column: $table.duracionProgramadaMin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get duracionRealMin => $composableBuilder(
    column: $table.duracionRealMin,
    builder: (column) => column,
  );

  GeneratedColumn<double> get qb =>
      $composableBuilder(column: $table.qb, builder: (column) => column);

  GeneratedColumn<double> get qd =>
      $composableBuilder(column: $table.qd, builder: (column) => column);

  GeneratedColumn<String> get dializadorTipo => $composableBuilder(
    column: $table.dializadorTipo,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dializadorSuperficieM2 => $composableBuilder(
    column: $table.dializadorSuperficieM2,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dializadorKuf => $composableBuilder(
    column: $table.dializadorKuf,
    builder: (column) => column,
  );

  GeneratedColumn<double> get banoNa =>
      $composableBuilder(column: $table.banoNa, builder: (column) => column);

  GeneratedColumn<double> get banoK =>
      $composableBuilder(column: $table.banoK, builder: (column) => column);

  GeneratedColumn<double> get banoCa =>
      $composableBuilder(column: $table.banoCa, builder: (column) => column);

  GeneratedColumn<double> get banoHco3 =>
      $composableBuilder(column: $table.banoHco3, builder: (column) => column);

  GeneratedColumn<double> get banoGlucosa => $composableBuilder(
    column: $table.banoGlucosa,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ufTotalProgramadaMl => $composableBuilder(
    column: $table.ufTotalProgramadaMl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ufTotalRealMl => $composableBuilder(
    column: $table.ufTotalRealMl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tasaUfMlKgH => $composableBuilder(
    column: $table.tasaUfMlKgH,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipoAnticoagulacion => $composableBuilder(
    column: $table.tipoAnticoagulacion,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heparinaBoloPorUI => $composableBuilder(
    column: $table.heparinaBoloPorUI,
    builder: (column) => column,
  );

  GeneratedColumn<double> get heparinaMantenimientoUiH => $composableBuilder(
    column: $table.heparinaMantenimientoUiH,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pesoPreHdKg => $composableBuilder(
    column: $table.pesoPreHdKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pesoPostHdKg => $composableBuilder(
    column: $table.pesoPostHdKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pesoSecoObjetivoKg => $composableBuilder(
    column: $table.pesoSecoObjetivoKg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ktvCalculado => $composableBuilder(
    column: $table.ktvCalculado,
    builder: (column) => column,
  );

  GeneratedColumn<double> get urrCalculado => $composableBuilder(
    column: $table.urrCalculado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eventosDurante => $composableBuilder(
    column: $table.eventosDurante,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get invalidado => $composableBuilder(
    column: $table.invalidado,
    builder: (column) => column,
  );

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SesionesHdTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SesionesHdTable,
          SesionesHdData,
          $$SesionesHdTableFilterComposer,
          $$SesionesHdTableOrderingComposer,
          $$SesionesHdTableAnnotationComposer,
          $$SesionesHdTableCreateCompanionBuilder,
          $$SesionesHdTableUpdateCompanionBuilder,
          (SesionesHdData, $$SesionesHdTableReferences),
          SesionesHdData,
          PrefetchHooks Function({bool pacienteId, bool episodioId})
        > {
  $$SesionesHdTableTableManager(_$AppDatabase db, $SesionesHdTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SesionesHdTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SesionesHdTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SesionesHdTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                Value<DateTime> fechaHoraInicio = const Value.absent(),
                Value<DateTime?> fechaHoraFin = const Value.absent(),
                Value<String> tipoAcceso = const Value.absent(),
                Value<String?> lateralidadAcceso = const Value.absent(),
                Value<String?> tipoAccesoCateter = const Value.absent(),
                Value<int> duracionProgramadaMin = const Value.absent(),
                Value<int?> duracionRealMin = const Value.absent(),
                Value<double> qb = const Value.absent(),
                Value<double> qd = const Value.absent(),
                Value<String?> dializadorTipo = const Value.absent(),
                Value<double?> dializadorSuperficieM2 = const Value.absent(),
                Value<double?> dializadorKuf = const Value.absent(),
                Value<double?> banoNa = const Value.absent(),
                Value<double?> banoK = const Value.absent(),
                Value<double?> banoCa = const Value.absent(),
                Value<double?> banoHco3 = const Value.absent(),
                Value<double?> banoGlucosa = const Value.absent(),
                Value<double> ufTotalProgramadaMl = const Value.absent(),
                Value<double?> ufTotalRealMl = const Value.absent(),
                Value<double?> tasaUfMlKgH = const Value.absent(),
                Value<String?> tipoAnticoagulacion = const Value.absent(),
                Value<double?> heparinaBoloPorUI = const Value.absent(),
                Value<double?> heparinaMantenimientoUiH = const Value.absent(),
                Value<double?> pesoPreHdKg = const Value.absent(),
                Value<double?> pesoPostHdKg = const Value.absent(),
                Value<double?> pesoSecoObjetivoKg = const Value.absent(),
                Value<double?> ktvCalculado = const Value.absent(),
                Value<double?> urrCalculado = const Value.absent(),
                Value<String?> eventosDurante = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => SesionesHdCompanion(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                fechaHoraInicio: fechaHoraInicio,
                fechaHoraFin: fechaHoraFin,
                tipoAcceso: tipoAcceso,
                lateralidadAcceso: lateralidadAcceso,
                tipoAccesoCateter: tipoAccesoCateter,
                duracionProgramadaMin: duracionProgramadaMin,
                duracionRealMin: duracionRealMin,
                qb: qb,
                qd: qd,
                dializadorTipo: dializadorTipo,
                dializadorSuperficieM2: dializadorSuperficieM2,
                dializadorKuf: dializadorKuf,
                banoNa: banoNa,
                banoK: banoK,
                banoCa: banoCa,
                banoHco3: banoHco3,
                banoGlucosa: banoGlucosa,
                ufTotalProgramadaMl: ufTotalProgramadaMl,
                ufTotalRealMl: ufTotalRealMl,
                tasaUfMlKgH: tasaUfMlKgH,
                tipoAnticoagulacion: tipoAnticoagulacion,
                heparinaBoloPorUI: heparinaBoloPorUI,
                heparinaMantenimientoUiH: heparinaMantenimientoUiH,
                pesoPreHdKg: pesoPreHdKg,
                pesoPostHdKg: pesoPostHdKg,
                pesoSecoObjetivoKg: pesoSecoObjetivoKg,
                ktvCalculado: ktvCalculado,
                urrCalculado: urrCalculado,
                eventosDurante: eventosDurante,
                invalidado: invalidado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                required DateTime fechaHoraInicio,
                Value<DateTime?> fechaHoraFin = const Value.absent(),
                required String tipoAcceso,
                Value<String?> lateralidadAcceso = const Value.absent(),
                Value<String?> tipoAccesoCateter = const Value.absent(),
                required int duracionProgramadaMin,
                Value<int?> duracionRealMin = const Value.absent(),
                required double qb,
                required double qd,
                Value<String?> dializadorTipo = const Value.absent(),
                Value<double?> dializadorSuperficieM2 = const Value.absent(),
                Value<double?> dializadorKuf = const Value.absent(),
                Value<double?> banoNa = const Value.absent(),
                Value<double?> banoK = const Value.absent(),
                Value<double?> banoCa = const Value.absent(),
                Value<double?> banoHco3 = const Value.absent(),
                Value<double?> banoGlucosa = const Value.absent(),
                required double ufTotalProgramadaMl,
                Value<double?> ufTotalRealMl = const Value.absent(),
                Value<double?> tasaUfMlKgH = const Value.absent(),
                Value<String?> tipoAnticoagulacion = const Value.absent(),
                Value<double?> heparinaBoloPorUI = const Value.absent(),
                Value<double?> heparinaMantenimientoUiH = const Value.absent(),
                Value<double?> pesoPreHdKg = const Value.absent(),
                Value<double?> pesoPostHdKg = const Value.absent(),
                Value<double?> pesoSecoObjetivoKg = const Value.absent(),
                Value<double?> ktvCalculado = const Value.absent(),
                Value<double?> urrCalculado = const Value.absent(),
                Value<String?> eventosDurante = const Value.absent(),
                Value<bool> invalidado = const Value.absent(),
              }) => SesionesHdCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                fechaHoraInicio: fechaHoraInicio,
                fechaHoraFin: fechaHoraFin,
                tipoAcceso: tipoAcceso,
                lateralidadAcceso: lateralidadAcceso,
                tipoAccesoCateter: tipoAccesoCateter,
                duracionProgramadaMin: duracionProgramadaMin,
                duracionRealMin: duracionRealMin,
                qb: qb,
                qd: qd,
                dializadorTipo: dializadorTipo,
                dializadorSuperficieM2: dializadorSuperficieM2,
                dializadorKuf: dializadorKuf,
                banoNa: banoNa,
                banoK: banoK,
                banoCa: banoCa,
                banoHco3: banoHco3,
                banoGlucosa: banoGlucosa,
                ufTotalProgramadaMl: ufTotalProgramadaMl,
                ufTotalRealMl: ufTotalRealMl,
                tasaUfMlKgH: tasaUfMlKgH,
                tipoAnticoagulacion: tipoAnticoagulacion,
                heparinaBoloPorUI: heparinaBoloPorUI,
                heparinaMantenimientoUiH: heparinaMantenimientoUiH,
                pesoPreHdKg: pesoPreHdKg,
                pesoPostHdKg: pesoPostHdKg,
                pesoSecoObjetivoKg: pesoSecoObjetivoKg,
                ktvCalculado: ktvCalculado,
                urrCalculado: urrCalculado,
                eventosDurante: eventosDurante,
                invalidado: invalidado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SesionesHdTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pacienteId = false, episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable: $$SesionesHdTableReferences
                                    ._pacienteIdTable(db),
                                referencedColumn: $$SesionesHdTableReferences
                                    ._pacienteIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable: $$SesionesHdTableReferences
                                    ._episodioIdTable(db),
                                referencedColumn: $$SesionesHdTableReferences
                                    ._episodioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SesionesHdTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SesionesHdTable,
      SesionesHdData,
      $$SesionesHdTableFilterComposer,
      $$SesionesHdTableOrderingComposer,
      $$SesionesHdTableAnnotationComposer,
      $$SesionesHdTableCreateCompanionBuilder,
      $$SesionesHdTableUpdateCompanionBuilder,
      (SesionesHdData, $$SesionesHdTableReferences),
      SesionesHdData,
      PrefetchHooks Function({bool pacienteId, bool episodioId})
    >;
typedef $$CalculosRealizadosTableCreateCompanionBuilder =
    CalculosRealizadosCompanion Function({
      Value<int> id,
      required int pacienteId,
      Value<int?> episodioId,
      required String tipoCalculo,
      required String inputsJson,
      required String resultadoJson,
      Value<DateTime> fechaHora,
    });
typedef $$CalculosRealizadosTableUpdateCompanionBuilder =
    CalculosRealizadosCompanion Function({
      Value<int> id,
      Value<int> pacienteId,
      Value<int?> episodioId,
      Value<String> tipoCalculo,
      Value<String> inputsJson,
      Value<String> resultadoJson,
      Value<DateTime> fechaHora,
    });

final class $$CalculosRealizadosTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CalculosRealizadosTable,
          CalculosRealizado
        > {
  $$CalculosRealizadosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PacientesTable _pacienteIdTable(_$AppDatabase db) =>
      db.pacientes.createAlias(
        $_aliasNameGenerator(db.calculosRealizados.pacienteId, db.pacientes.id),
      );

  $$PacientesTableProcessedTableManager get pacienteId {
    final $_column = $_itemColumn<int>('paciente_id')!;

    final manager = $$PacientesTableTableManager(
      $_db,
      $_db.pacientes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pacienteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EpisodiosTable _episodioIdTable(_$AppDatabase db) =>
      db.episodios.createAlias(
        $_aliasNameGenerator(db.calculosRealizados.episodioId, db.episodios.id),
      );

  $$EpisodiosTableProcessedTableManager? get episodioId {
    final $_column = $_itemColumn<int>('episodio_id');
    if ($_column == null) return null;
    final manager = $$EpisodiosTableTableManager(
      $_db,
      $_db.episodios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CalculosRealizadosTableFilterComposer
    extends Composer<_$AppDatabase, $CalculosRealizadosTable> {
  $$CalculosRealizadosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoCalculo => $composableBuilder(
    column: $table.tipoCalculo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inputsJson => $composableBuilder(
    column: $table.inputsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultadoJson => $composableBuilder(
    column: $table.resultadoJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnFilters(column),
  );

  $$PacientesTableFilterComposer get pacienteId {
    final $$PacientesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableFilterComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableFilterComposer get episodioId {
    final $$EpisodiosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableFilterComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalculosRealizadosTableOrderingComposer
    extends Composer<_$AppDatabase, $CalculosRealizadosTable> {
  $$CalculosRealizadosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoCalculo => $composableBuilder(
    column: $table.tipoCalculo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inputsJson => $composableBuilder(
    column: $table.inputsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultadoJson => $composableBuilder(
    column: $table.resultadoJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaHora => $composableBuilder(
    column: $table.fechaHora,
    builder: (column) => ColumnOrderings(column),
  );

  $$PacientesTableOrderingComposer get pacienteId {
    final $$PacientesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableOrderingComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableOrderingComposer get episodioId {
    final $$EpisodiosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableOrderingComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalculosRealizadosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CalculosRealizadosTable> {
  $$CalculosRealizadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipoCalculo => $composableBuilder(
    column: $table.tipoCalculo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get inputsJson => $composableBuilder(
    column: $table.inputsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultadoJson => $composableBuilder(
    column: $table.resultadoJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaHora =>
      $composableBuilder(column: $table.fechaHora, builder: (column) => column);

  $$PacientesTableAnnotationComposer get pacienteId {
    final $$PacientesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pacienteId,
      referencedTable: $db.pacientes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PacientesTableAnnotationComposer(
            $db: $db,
            $table: $db.pacientes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EpisodiosTableAnnotationComposer get episodioId {
    final $$EpisodiosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodioId,
      referencedTable: $db.episodios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EpisodiosTableAnnotationComposer(
            $db: $db,
            $table: $db.episodios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CalculosRealizadosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CalculosRealizadosTable,
          CalculosRealizado,
          $$CalculosRealizadosTableFilterComposer,
          $$CalculosRealizadosTableOrderingComposer,
          $$CalculosRealizadosTableAnnotationComposer,
          $$CalculosRealizadosTableCreateCompanionBuilder,
          $$CalculosRealizadosTableUpdateCompanionBuilder,
          (CalculosRealizado, $$CalculosRealizadosTableReferences),
          CalculosRealizado,
          PrefetchHooks Function({bool pacienteId, bool episodioId})
        > {
  $$CalculosRealizadosTableTableManager(
    _$AppDatabase db,
    $CalculosRealizadosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalculosRealizadosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalculosRealizadosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalculosRealizadosTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pacienteId = const Value.absent(),
                Value<int?> episodioId = const Value.absent(),
                Value<String> tipoCalculo = const Value.absent(),
                Value<String> inputsJson = const Value.absent(),
                Value<String> resultadoJson = const Value.absent(),
                Value<DateTime> fechaHora = const Value.absent(),
              }) => CalculosRealizadosCompanion(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                tipoCalculo: tipoCalculo,
                inputsJson: inputsJson,
                resultadoJson: resultadoJson,
                fechaHora: fechaHora,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pacienteId,
                Value<int?> episodioId = const Value.absent(),
                required String tipoCalculo,
                required String inputsJson,
                required String resultadoJson,
                Value<DateTime> fechaHora = const Value.absent(),
              }) => CalculosRealizadosCompanion.insert(
                id: id,
                pacienteId: pacienteId,
                episodioId: episodioId,
                tipoCalculo: tipoCalculo,
                inputsJson: inputsJson,
                resultadoJson: resultadoJson,
                fechaHora: fechaHora,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CalculosRealizadosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pacienteId = false, episodioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pacienteId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pacienteId,
                                referencedTable:
                                    $$CalculosRealizadosTableReferences
                                        ._pacienteIdTable(db),
                                referencedColumn:
                                    $$CalculosRealizadosTableReferences
                                        ._pacienteIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (episodioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodioId,
                                referencedTable:
                                    $$CalculosRealizadosTableReferences
                                        ._episodioIdTable(db),
                                referencedColumn:
                                    $$CalculosRealizadosTableReferences
                                        ._episodioIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CalculosRealizadosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CalculosRealizadosTable,
      CalculosRealizado,
      $$CalculosRealizadosTableFilterComposer,
      $$CalculosRealizadosTableOrderingComposer,
      $$CalculosRealizadosTableAnnotationComposer,
      $$CalculosRealizadosTableCreateCompanionBuilder,
      $$CalculosRealizadosTableUpdateCompanionBuilder,
      (CalculosRealizado, $$CalculosRealizadosTableReferences),
      CalculosRealizado,
      PrefetchHooks Function({bool pacienteId, bool episodioId})
    >;
typedef $$AuditLogTableCreateCompanionBuilder =
    AuditLogCompanion Function({
      Value<int> id,
      required String accion,
      Value<String?> entidad,
      Value<int?> entidadId,
      Value<int?> pacienteId,
      Value<int?> usuarioId,
      Value<DateTime> timestamp,
      Value<String?> detalleJson,
      Value<String> institucion,
    });
typedef $$AuditLogTableUpdateCompanionBuilder =
    AuditLogCompanion Function({
      Value<int> id,
      Value<String> accion,
      Value<String?> entidad,
      Value<int?> entidadId,
      Value<int?> pacienteId,
      Value<int?> usuarioId,
      Value<DateTime> timestamp,
      Value<String?> detalleJson,
      Value<String> institucion,
    });

final class $$AuditLogTableReferences
    extends BaseReferences<_$AppDatabase, $AuditLogTable, AuditLogData> {
  $$AuditLogTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosLocalesTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuariosLocales.createAlias(
        $_aliasNameGenerator(db.auditLog.usuarioId, db.usuariosLocales.id),
      );

  $$UsuariosLocalesTableProcessedTableManager? get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id');
    if ($_column == null) return null;
    final manager = $$UsuariosLocalesTableTableManager(
      $_db,
      $_db.usuariosLocales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditLogTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accion => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entidad => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entidadId => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pacienteId => $composableBuilder(
    column: $table.pacienteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detalleJson => $composableBuilder(
    column: $table.detalleJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get institucion => $composableBuilder(
    column: $table.institucion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosLocalesTableFilterComposer get usuarioId {
    final $$UsuariosLocalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuariosLocales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosLocalesTableFilterComposer(
            $db: $db,
            $table: $db.usuariosLocales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accion => $composableBuilder(
    column: $table.accion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entidad => $composableBuilder(
    column: $table.entidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entidadId => $composableBuilder(
    column: $table.entidadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pacienteId => $composableBuilder(
    column: $table.pacienteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detalleJson => $composableBuilder(
    column: $table.detalleJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get institucion => $composableBuilder(
    column: $table.institucion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosLocalesTableOrderingComposer get usuarioId {
    final $$UsuariosLocalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuariosLocales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosLocalesTableOrderingComposer(
            $db: $db,
            $table: $db.usuariosLocales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogTable> {
  $$AuditLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get accion =>
      $composableBuilder(column: $table.accion, builder: (column) => column);

  GeneratedColumn<String> get entidad =>
      $composableBuilder(column: $table.entidad, builder: (column) => column);

  GeneratedColumn<int> get entidadId =>
      $composableBuilder(column: $table.entidadId, builder: (column) => column);

  GeneratedColumn<int> get pacienteId => $composableBuilder(
    column: $table.pacienteId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get detalleJson => $composableBuilder(
    column: $table.detalleJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get institucion => $composableBuilder(
    column: $table.institucion,
    builder: (column) => column,
  );

  $$UsuariosLocalesTableAnnotationComposer get usuarioId {
    final $$UsuariosLocalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuariosLocales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosLocalesTableAnnotationComposer(
            $db: $db,
            $table: $db.usuariosLocales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogTable,
          AuditLogData,
          $$AuditLogTableFilterComposer,
          $$AuditLogTableOrderingComposer,
          $$AuditLogTableAnnotationComposer,
          $$AuditLogTableCreateCompanionBuilder,
          $$AuditLogTableUpdateCompanionBuilder,
          (AuditLogData, $$AuditLogTableReferences),
          AuditLogData,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$AuditLogTableTableManager(_$AppDatabase db, $AuditLogTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> accion = const Value.absent(),
                Value<String?> entidad = const Value.absent(),
                Value<int?> entidadId = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> usuarioId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> detalleJson = const Value.absent(),
                Value<String> institucion = const Value.absent(),
              }) => AuditLogCompanion(
                id: id,
                accion: accion,
                entidad: entidad,
                entidadId: entidadId,
                pacienteId: pacienteId,
                usuarioId: usuarioId,
                timestamp: timestamp,
                detalleJson: detalleJson,
                institucion: institucion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String accion,
                Value<String?> entidad = const Value.absent(),
                Value<int?> entidadId = const Value.absent(),
                Value<int?> pacienteId = const Value.absent(),
                Value<int?> usuarioId = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> detalleJson = const Value.absent(),
                Value<String> institucion = const Value.absent(),
              }) => AuditLogCompanion.insert(
                id: id,
                accion: accion,
                entidad: entidad,
                entidadId: entidadId,
                pacienteId: pacienteId,
                usuarioId: usuarioId,
                timestamp: timestamp,
                detalleJson: detalleJson,
                institucion: institucion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditLogTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$AuditLogTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$AuditLogTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AuditLogTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogTable,
      AuditLogData,
      $$AuditLogTableFilterComposer,
      $$AuditLogTableOrderingComposer,
      $$AuditLogTableAnnotationComposer,
      $$AuditLogTableCreateCompanionBuilder,
      $$AuditLogTableUpdateCompanionBuilder,
      (AuditLogData, $$AuditLogTableReferences),
      AuditLogData,
      PrefetchHooks Function({bool usuarioId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsuariosLocalesTableTableManager get usuariosLocales =>
      $$UsuariosLocalesTableTableManager(_db, _db.usuariosLocales);
  $$PacientesTableTableManager get pacientes =>
      $$PacientesTableTableManager(_db, _db.pacientes);
  $$HistoriasClinicasTableTableManager get historiasClinicas =>
      $$HistoriasClinicasTableTableManager(_db, _db.historiasClinicas);
  $$EpisodiosTableTableManager get episodios =>
      $$EpisodiosTableTableManager(_db, _db.episodios);
  $$DiagnosticosTableTableManager get diagnosticos =>
      $$DiagnosticosTableTableManager(_db, _db.diagnosticos);
  $$SignosVitalesTableTableManager get signosVitales =>
      $$SignosVitalesTableTableManager(_db, _db.signosVitales);
  $$ParametrosClinicosTableTableManager get parametrosClinicos =>
      $$ParametrosClinicosTableTableManager(_db, _db.parametrosClinicos);
  $$CatalogoMetaTableTableManager get catalogoMeta =>
      $$CatalogoMetaTableTableManager(_db, _db.catalogoMeta);
  $$UnidadesMedidaTableTableManager get unidadesMedida =>
      $$UnidadesMedidaTableTableManager(_db, _db.unidadesMedida);
  $$LaboratoriosTableTableManager get laboratorios =>
      $$LaboratoriosTableTableManager(_db, _db.laboratorios);
  $$ImagenesTableTableManager get imagenes =>
      $$ImagenesTableTableManager(_db, _db.imagenes);
  $$EkgTableTableManager get ekg => $$EkgTableTableManager(_db, _db.ekg);
  $$VentilacionSavinaTableTableManager get ventilacionSavina =>
      $$VentilacionSavinaTableTableManager(_db, _db.ventilacionSavina);
  $$SesionesHdTableTableManager get sesionesHd =>
      $$SesionesHdTableTableManager(_db, _db.sesionesHd);
  $$CalculosRealizadosTableTableManager get calculosRealizados =>
      $$CalculosRealizadosTableTableManager(_db, _db.calculosRealizados);
  $$AuditLogTableTableManager get auditLog =>
      $$AuditLogTableTableManager(_db, _db.auditLog);
}
