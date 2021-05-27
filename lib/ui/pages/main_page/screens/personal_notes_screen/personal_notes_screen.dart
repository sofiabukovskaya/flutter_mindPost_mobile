import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/icon_buttons.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/search_textField.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/floating_action_button.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';

import 'widgets/personal_notes_list.dart';


class PersonalNotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonalNotesScreenState();
  }
}

class PersonalNotesScreenState extends State<PersonalNotesScreen> {
  TextEditingController searchController = TextEditingController();
  FirestoreRepository firestoreRepository = FirestoreRepository();
  bool public;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            iconButtons(() {
              showDialog<dynamic>(
                  context: context,
                  builder: (_) => alertDialog(context, firestoreRepository));
            })
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
          title: titleAppBar('Personal notes'),
          centerTitle: true,
        ),
        floatingActionButton: floatingActionButton(context),
        body: StreamBuilder<QuerySnapshot<Object>>(
          stream: firestoreRepository.getPrivateNotes(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              circularProgress();
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    textFieldSearch(searchController),
                    Padding(
                      padding:const  EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: personalNotesList(public, snapshot)
                    ),
                  ],
                ),
              );
            }
            return circularProgress();
          },
        ));
  }
}
