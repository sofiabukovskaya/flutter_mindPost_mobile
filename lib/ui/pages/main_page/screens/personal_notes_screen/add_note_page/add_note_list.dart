import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_event.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/alert_dialog_clear_image.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/default_image.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/description_textField.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/switcher.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/title_textField.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/widgets/upload_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddNoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNoteListState();
}

class _AddNoteListState extends State<AddNoteList> {
  String dateFormat = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  final TextEditingController titleNote = TextEditingController();
  final TextEditingController descriptionNote = TextEditingController();
  File image;
  String uploadedFileUrl;
  bool switched = false;
  Icon lockedIcon;
  AddNoteBloc addNoteBloc;

  Future<void> pickImage(ImageSource source) async {
    final File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      image = selected;
    });
  }

  @override
  void initState() {
    super.initState();
    addNoteBloc = BlocProvider.of<AddNoteBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Add note',
            style: textStyle(20.0, FontWeight.w500, Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white38,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              color: const Color(0xFF00847c),
              iconSize: 30.0,
              onPressed: () async {
                Navigator.pop(context);
                circularProgress();
                addNoteBloc.add(AddNoteTextEvent(
                    titleNote.text.toString(),
                    descriptionNote.text.toString(),
                    uploadedFileUrl,
                    switched,
                    dateFormat));
                addNoteBloc.add(UploadImageEvent(image, uploadedFileUrl));
              },
            ),
            IconButton(
                icon: const Icon(Icons.scatter_plot),
                color: const Color(0xFF00847c),
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/scanImage');
                })
          ],
        ),
        body: BlocBuilder<AddNoteBloc, AddNoteState>(
            bloc: addNoteBloc,
            builder: (BuildContext context, AddNoteState state) {
              if (state is SuccessfulAddNoteState) {
                Timer.run(() {
                  showSnackBar(context, 'You add this note');
                });
              } if(state is FailAddNoteState) {
                Timer.run(() {
                  showSnackBar(context, 'Fill in all fields, please!');
                });
              }
              return ListView(
                children: <Widget>[
                  Column(children: <Widget>[
                    titleTextField(context, titleNote),
                    descriptionTextField(context, descriptionNote),
                    uploadImage(context, () {
                      pickImage(ImageSource.gallery);
                    }),
                    image == null
                        ? defaultImage(context)
                        : alertDialogClearImage(context, () {
                            setState(() {
                              image = null;
                            });
                            Navigator.pop(context);
                          }, image),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        'Privacy setting',
                        style: textStyle(18.0, FontWeight.w400, Colors.black87),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 40),
                          child: lockedIcon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Public note',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                        switchItem(context, switched, lockedIcon,
                            (bool selectedValue) {
                          setState(() {
                            switched = selectedValue;
                            switched == false
                                ? lockedIcon = const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black54,
                                    size: 30,
                                  )
                                : lockedIcon = const Icon(
                                    Icons.lock_open_sharp,
                                    color: Colors.black54,
                                    size: 30,
                                  );
                          });
                        })
                      ],
                    )
                  ]),
                ],
              );
            }));
  }

}
