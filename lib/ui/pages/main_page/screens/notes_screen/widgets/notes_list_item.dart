import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/list_item/widgets/text_list.dart';

import 'list_item/widgets/like_dislike_icons.dart';


Widget notesListItem(QueryDocumentSnapshot<Object> snapshot, BuildContext context) {
  return Card(
      elevation: 0,
      color: const Color(0x99d3edfa),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Column(
              children: <Widget>[
                textList(snapshot, context),
                likeDislikeIcons(snapshot)
              ],
            ),
          ]));
}
