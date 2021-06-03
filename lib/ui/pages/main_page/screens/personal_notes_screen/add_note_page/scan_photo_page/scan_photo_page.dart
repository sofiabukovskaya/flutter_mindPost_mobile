import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_bloc.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/scan_photo_page/widgets/text_recognition_widget.dart';

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
          title: Text(
            'Text recognition with ML',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: textStyle(18.0, FontWeight.w500, Colors.black87),
          ),
          centerTitle: true,
        ),
        body: BlocProvider<ScanPhotoBloc>(
          create: (BuildContext context) => ScanPhotoBloc(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const <Widget>[TextRecognitionWidget()],
            ),
          ),
        ));
  }
}
