

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget titleAndDatePublishText(String title, QueryDocumentSnapshot<dynamic> snapshot) {
  return  Padding(
    padding: const EdgeInsets.only(top: 30, left: 20),
    child: ListTile(
      title: Text(
        '$title',
        style: textStyle(18.0, FontWeight.w600, Colors.black87),
        textAlign: TextAlign.center,
      ),
      subtitle: Text(
        '${snapshot.get('publish').toString()}',
        style: textStyle(18.0, FontWeight.w500, Colors.black87),
        textAlign: TextAlign.center,
      ),
    ),
  );
}