import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/description_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/image_item.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/lock_icons.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/publishDate_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/title_text.dart';

Widget personalNotesList(bool public,
    AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
  return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: snapshot.data.docs.length,
      itemBuilder: (BuildContext context, int index) {
        public = snapshot.data.docs[index]['public'];
        return Container(
          height: 150,
          width: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Stack(
                children: <Widget>[
                imageItem(),
            publishDateText(snapshot, index),
            titleText(snapshot, index),
            descriptionText(context, snapshot, index),
            lockIcon(public)
            ],
          ),
        ));
      });
}
