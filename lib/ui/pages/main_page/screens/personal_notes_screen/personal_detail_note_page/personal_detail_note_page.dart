import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_detail_bloc/personal_note_detail_bloc.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/personal_detail.dart';

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
    return Scaffold(
        body: BlocProvider<PersonalNoteDetailBloc>(
            create: (BuildContext context) => PersonalNoteDetailBloc(),
            child: PersonalDetail(snapshot: widget.snapshot)));
  }
}
