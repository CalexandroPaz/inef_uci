import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class PdfExportService {
  static final PdfColor _primary = PdfColor.fromHex('#1B3A5C');
  static final PdfColor _medium = PdfColor.fromHex('#4A8FB8');
  static final PdfColor _divider = PdfColor.fromHex('#B8CFE0');

  /// Genera un PDF con header INEF y disclaimer localizado.
  Future<Uint8List> generateCalculatorPdf({
    required String titulo,
    required String subtituloInstitucion,
    required String disclaimer,
    required String exclusiveUseNotice,
    required String nombrePaciente,
    required String numerohc,
    required DateTime fechaHora,
    required List<PdfTableRow> inputs,
    required List<PdfTableRow> resultados,
    String? notas,
  }) async {
    final pdf = pw.Document(
      title: titulo,
      author: 'INEF UCI',
    );

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (context) => _buildHeader(subtituloInstitucion),
        footer: (context) => _buildFooter(disclaimer, exclusiveUseNotice, context),
        build: (context) => [
          pw.SizedBox(height: 12),
          pw.Text(titulo,
              style: pw.TextStyle(
                  fontSize: 16, fontWeight: pw.FontWeight.bold, color: _primary)),
          pw.SizedBox(height: 8),
          pw.Row(children: [
            pw.Text('Paciente: $nombrePaciente',
                style: pw.TextStyle(fontSize: 11, color: _primary)),
            pw.Spacer(),
            pw.Text('HC: $numerohc', style: pw.TextStyle(fontSize: 11, color: _primary)),
            pw.Spacer(),
            pw.Text(
                'Fecha: ${_fmtDate(fechaHora)}',
                style: pw.TextStyle(fontSize: 11, color: _primary)),
          ]),
          pw.SizedBox(height: 16),
          pw.Text('Variables de entrada',
              style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: _medium)),
          pw.SizedBox(height: 6),
          _buildTable(inputs),
          pw.SizedBox(height: 16),
          pw.Text('Resultados',
              style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold, color: _medium)),
          pw.SizedBox(height: 6),
          _buildTable(resultados),
          if (notas != null) ...[
            pw.SizedBox(height: 12),
            pw.Text('Notas: $notas',
                style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic)),
          ],
        ],
      ),
    );
    return pdf.save();
  }

  pw.Widget _buildHeader(String subtitulo) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Row(
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('INEF UCI',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold, color: _primary)),
                pw.Text(subtitulo,
                    style: pw.TextStyle(fontSize: 9, color: _medium)),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 6),
        pw.Divider(color: _divider, thickness: 1.5),
      ],
    );
  }

  pw.Widget _buildFooter(
      String disclaimer, String exclusiveUse, pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Divider(color: _divider, thickness: 1),
        pw.SizedBox(height: 4),
        pw.Text(
          disclaimer,
          style: pw.TextStyle(
              fontSize: 8, fontStyle: pw.FontStyle.italic, color: _medium),
          textAlign: pw.TextAlign.center,
        ),
        pw.Text(
          exclusiveUse,
          style: pw.TextStyle(
              fontSize: 7, fontStyle: pw.FontStyle.italic, color: _medium),
          textAlign: pw.TextAlign.center,
        ),
        pw.Text(
          'Página ${context.pageNumber} / ${context.pagesCount}',
          style: pw.TextStyle(fontSize: 8, color: _medium),
        ),
      ],
    );
  }

  pw.Widget _buildTable(List<PdfTableRow> rows) {
    return pw.Table(
      border: pw.TableBorder.all(color: _divider, width: 0.5),
      columnWidths: {
        0: const pw.FlexColumnWidth(3),
        1: const pw.FlexColumnWidth(2),
        2: const pw.FlexColumnWidth(3),
      },
      children: rows.map((row) {
        return pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(row.label, style: pw.TextStyle(fontSize: 10)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(row.value,
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold, color: _primary)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(row.origin ?? '',
                  style: pw.TextStyle(
                      fontSize: 9, fontStyle: pw.FontStyle.italic, color: _medium)),
            ),
          ],
        );
      }).toList(),
    );
  }

  String _fmtDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/'
        '${dt.month.toString().padLeft(2, '0')}/'
        '${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }
}

class PdfTableRow {
  final String label;
  final String value;
  final String? origin;

  const PdfTableRow({
    required this.label,
    required this.value,
    this.origin,
  });
}
