
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget publishDateText(AsyncSnapshot<QuerySnapshot<dynamic>> snapshot, int index){
  return Positioned(
    top: 20,
    left: 150,
    child: Text(
        '${snapshot.data.docs[index]['publish'].toString()}',
        style:
        textStyle(18.0, FontWeight.w400, Colors.black87)),
  );
}