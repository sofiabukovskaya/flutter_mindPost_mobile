
import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_event.dart';
import 'package:flutter_mindpost/ui/bloc/scan_photo_bloc/scan_photo_state.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/scan_photo_page/widgets/build_image.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/scan_photo_page/widgets/text_area_widget.dart';
import 'buttons_widget.dart';

class TextRecognitionWidget extends StatefulWidget {
  const TextRecognitionWidget({
    Key key,
  }) : super(key: key);

  @override
  _TextRecognitionWidgetState createState() => _TextRecognitionWidgetState();
}

class _TextRecognitionWidgetState extends State<TextRecognitionWidget> {
  String text = '';
  File image;
  ScanPhotoBloc scanPhotoBloc;

  @override
  void initState() {
    super.initState();
    scanPhotoBloc = BlocProvider.of<ScanPhotoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanPhotoBloc, ScanPhotoState>(
        builder: (BuildContext context, ScanPhotoState state) {
      if (state is UpdateTextFieldState) {
        text = state.text;
      }
      if (state is UpdateImageState) {
        image = File(state.file.path);
      } if(state is ClearImageAndTextState) {
          image = null;
          text = '';
      }
      return Expanded(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 60),
            Container(
              height: 300,
              width: 300,
              child: buildImage(context, image),
            ),
            const SizedBox(height: 60),
            ButtonsWidget(
              onClickedPickImage: () async {
                scanPhotoBloc.add(PickImageEvent());
              },
              onClickedScanText: () {
                scanPhotoBloc.add(ScanForTextEvent(image));
              },
              onClickedClear: () {
                scanPhotoBloc.add(ClearImageEvent());
              },
            ),
            const SizedBox(height: 30),
            TextAreaWidget(
              text: text,
              onClickedCopy: copyToClipboard,
            ),
          ],
        ),
      );
    });
  }
  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }
}
