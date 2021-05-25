import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/scan_photo_page/widgets/text_recognition_widget.dart';

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