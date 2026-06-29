import 'package:drift/drift.dart';

class CatalogoMeta extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get version => integer()();
  DateTimeColumn get seededAt => dateTime().withDefault(currentDateAndTime)();
}
