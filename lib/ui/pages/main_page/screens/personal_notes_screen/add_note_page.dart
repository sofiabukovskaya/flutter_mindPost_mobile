import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/data/models/note.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
  FirestoreRepository firestoreRepository = FirestoreRepository();
  String dateformat = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  List<Note> note = [];
  final TextEditingController titleNote = TextEditingController();
  final TextEditingController descriptionNote = TextEditingController();
  File image;
  String uploadedFileUrl;
  bool switched = false;
  Icon lockedIcon;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      image = selected;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lockedIcon = Icon(
      Icons.lock_outline,
      color: Colors.black54,
      size: 30,
    );
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
            onPressed: () async {
              await Center(
                child: CircularProgressIndicator(),
              );
              await firestoreRepository.addDataNote(titleNote.text.toString(), descriptionNote.text.toString(), uploadedFileUrl, switched,
                  dateformat);
             await firestoreRepository.uploadImage(image, uploadedFileUrl);
            },
          ),
          IconButton(
            icon: Icon(Icons.scatter_plot),
            color: Color(0xFF00847c),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pushNamed(context, '/scanImage');
    }
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
              children: [
                Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 85, right: 85, bottom: 15),
                      child: TextField(
                        controller: titleNote,
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
                        controller: descriptionNote,
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
                  padding: EdgeInsets.only(left: 100, right: 90),
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
                image == null
                    ? Padding(
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
                )
                    : GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Delete picture'),
                            content: Text('Do you wanna delete a picture?'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(color: Colors.red),
                                  )),
                              FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      image = null;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(color: Colors.black87),
                                  ))
                            ],
                            elevation: 8.0,
                          ));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Image.file(
                          image,
                          height: 130,
                          width: 180,
                          fit: BoxFit.fill,
                        ))),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    'Privacy setting',
                    style:
                    GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 40),
                      child: lockedIcon,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Public note',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 150, top: 12),
                        child: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              value: switched,
                              onChanged: (value) {
                                setState(() {
                                  switched = value;
                                  switched == false
                                      ? lockedIcon = Icon(
                                    Icons.lock_outline,
                                    color: Colors.black54,
                                    size: 30,
                                  )
                                      : lockedIcon = Icon(
                                    Icons.lock_open_sharp,
                                    color: Colors.black54,
                                    size: 30,
                                  );
                                });
                              }),
                        ))
                  ],
                )
              ]),
        ],
      )
    );
  }
}
