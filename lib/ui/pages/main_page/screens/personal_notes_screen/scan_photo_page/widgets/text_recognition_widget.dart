import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/services/api/firebase_ml_api.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/scan_photo_page/widgets/controls_widget.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/scan_photo_page/widgets/text_area_widget.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            const SizedBox(height: 60),
           Container(
             height: 300,
            width: 300,
            child: buildImage() ,
        ),
            const SizedBox(height: 60),
            ControlsWidget(
              onClickedPickImage: pickImage,
              onClickedScanText: scanText,
              onClickedClear: clear,
            ),
            const SizedBox(height: 30),
            TextAreaWidget(
              text: text,
              onClickedCopy: copyToClipboard,
            ),
          ],
        ),
      );

  Widget buildImage() => Container(
        child: image != null
            ? Container(
                height: 150,
                width: 150,
                child: Image.file(image, fit: BoxFit.cover,),
              )
            : Icon(Icons.photo, size: 50, color: Colors.black26),
      );

  Future pickImage() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setImage(File(file.path));
  }

  Future scanText() async {
    final text = await FirebaseMLApi.recogniseText(image);
    print(text);
    setText(text);
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
