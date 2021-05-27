import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/pages/scan_photo_page/widgets/text_recognition_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanPhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScanPhotoPageState();
  }
}

class ScanPhotoPageState extends State<ScanPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        iconTheme: const IconThemeData(color: Colors.black54, size: 30.0),
        title: Text('Text recognition with ML',maxLines: 2, textAlign: TextAlign.center, style:  textStyle(18.0, FontWeight.w500, Colors.black87),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
              const TextRecognitionWidget()
          ],
        ),
      )
    );
  }
}