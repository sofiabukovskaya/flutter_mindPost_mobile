import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget titleText(AsyncSnapshot<QuerySnapshot<dynamic>> snapshot, int index) {
  return Positioned(
    top: 46,
    left: 150,
    child: Text('${snapshot.data.docs[index]['title']}',
        style:
        textStyle(18.0, FontWeight.w600, Colors.black87)),
  );
}