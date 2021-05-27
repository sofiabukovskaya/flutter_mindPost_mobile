import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/personal_detail.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetailNotePage extends StatefulWidget {
  const PersonalDetailNotePage({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<dynamic> snapshot;

  @override
  State<StatefulWidget> createState() {
    return PersonalDetailNotePageState();
  }
}

class PersonalDetailNotePageState extends State<PersonalDetailNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PersonalDetail(snapshot: widget.snapshot));
  }
}
