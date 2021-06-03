import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/add_note_list.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNotePageState();
  }
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AddNoteBloc>(
        create: (BuildContext context) => AddNoteBloc(),
        child: AddNoteList(),
      ),
    );
  }
}
