import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNotePageState();
  }
}

class AddNotePageState extends State<AddNotePage> {
  File _image;
  String _uploadedFileUrl;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add note',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white38,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Color(0xFF00847c),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        Center(
            child: Padding(
          padding: EdgeInsets.only(top: 10, left: 85, right: 85, bottom: 15),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(500),
            ],
            style: GoogleFonts.poppins(
                fontSize: 20.0,
                color: Color(0xFF00847c),
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterText: '',
              hintText: 'Title',
              hintStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0x4D00847c),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        )),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              width: 350,
              height: 250,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 250,
                maxLength: 500,
                style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write about your day thoughts, day, desires...',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0x4D00847c),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10.0)),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 120, right: 90),
          child: Row(
            children: [
              Text(
                'Attach a picture',
                style: GoogleFonts.poppins(
                    fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
              IconButton(
                  icon: Icon(
                    Icons.photo,
                    color: Color(0x9900847c),
                    size: 33,
                  ),
                  onPressed: () => _pickImage(ImageSource.gallery)),
            ],
          ),
        ),
        _image == null ?
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.grey,
              height: 130,
              width: 180,
              child: GestureDetector(
                child: Image.asset(
                  'assets/camera.png',
                  color: Colors.white,
                ),
              ),
            ),
          ) : Container(
          alignment: Alignment.center,
          child: Image.file(_image, height: 130, width: 180, fit: BoxFit.fill,)
        )
      ]
      ),
    );
  }
}
