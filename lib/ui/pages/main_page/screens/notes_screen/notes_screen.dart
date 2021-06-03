
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/notes_list.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotesScreenState();
  }
}

class _NotesScreenState extends State<NotesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PublicNotesBloc>(
        create: (BuildContext context) => PublicNotesBloc(),
        child: NotesList(),
      ),
    );
  }
}
