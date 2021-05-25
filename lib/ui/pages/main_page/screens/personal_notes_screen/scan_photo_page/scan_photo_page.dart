import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/scan_photo_page/widgets/text_recognition_widget.dart';
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
        iconTheme: IconThemeData(color: Colors.black54, size: 30.0),
        title: Text('Text recognition with ML',maxLines: 2, textAlign: TextAlign.center, style:  GoogleFonts.poppins(
          color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
              TextRecognitionWidget()
          ],
        ),
      )
    );
  }
}