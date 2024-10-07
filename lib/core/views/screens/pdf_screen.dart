import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/material.dart';

import '../../models/content.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  PdfScreen({
    super.key,
    // required this.content
  });

  // Content? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Dimensions.width(context) * 0.02,
        title: TextStyleNoor(
          size: Dimensions.width(context) * 0.06,
          text: 'عنوان الكتاب',
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SfPdfViewer.asset("assets/pdfFiles/f.pdf"),
    );
  }
}
