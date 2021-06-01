import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/icon_buttons.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/notes_list_item.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/popup_menu_button_widget.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/search_textField.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotesScreenState();
  }
}

class NotesScreenState extends State<NotesScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedItemSorting = 'dislike';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            // iconButtons(() {
            //   showDialog<dynamic>(
            //       context: context, builder: (_) => alertDialog(context));
            // }),
            PopupMenuButtonWidget(
              selectedItem: (String item) {
                setState(() {
                  selectedItemSorting = item;
                });
              },
            ),
            const SizedBox(width: 15)
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
          title: titleAppBar('Notes feed'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot<Object>>(
          stream: FirestoreRepositoryImpl().getPublicNotes(selectedItemSorting),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    textFieldSearch(searchController),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 50, right: 50),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 229,
                              child: notesListItem(
                                  snapshot.data.docs[index], context),
                            );
                          }),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}
