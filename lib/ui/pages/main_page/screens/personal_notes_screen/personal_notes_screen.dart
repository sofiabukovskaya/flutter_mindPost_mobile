
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_bloc.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/floating_action_button.dart';


import 'personal_notes_list.dart';

class PersonalNotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalNotesScreenState();
  }
}

class PersonalNotesScreenState extends State<PersonalNotesScreen> {
  TextEditingController searchController = TextEditingController();
  bool public;
  bool publicOrNot;
  String queryTextTitle;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        queryTextTitle = searchController.text.toString();
      });
        print('$queryTextTitle');
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton(context),
        body: BlocProvider<PersonalNotesBloc>(create: (BuildContext context) => PersonalNotesBloc(),
          child:  PersonalNotesList(),)
    );
  }
}
