import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DispPdf extends StatelessWidget {
  final File file;
  DispPdf({this.file});
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.file(file);
  }
}