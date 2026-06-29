import 'package:intl/intl.dart';

class NumberFormatHelper {
  /// Parsea un string numérico aceptando tanto punto como coma decimal.
  static double? parseDouble(String raw) {
    if (raw.trim().isEmpty) return null;
    final normalized = raw.trim().replaceAll(',', '.');
    return double.tryParse(normalized);
  }

  /// Formatea un double según el locale activo (coma en es/fr, punto en en).
  static String format(double value, {int decimals = 2, String? locale}) {
    final fmt = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: decimals,
    );
    return fmt.format(value);
  }

  /// Formatea con símbolo de unidad.
  static String formatWithUnit(
    double value,
    String unit, {
    int decimals = 2,
    String? locale,
  }) {
    return '${format(value, decimals: decimals, locale: locale)} $unit';
  }
}
