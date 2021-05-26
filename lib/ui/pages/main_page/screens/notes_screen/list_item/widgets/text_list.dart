import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textList(QueryDocumentSnapshot<Object> snapshot, BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Text('${snapshot['title']}',
            textAlign: TextAlign.center,
            style: textStyle(20.0, FontWeight.w600, Colors.black87)),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          child: GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, '/detailPublicNote',
                  arguments: snapshot)
            },
            child: Center(
              child: Text('${snapshot['description'].toString()}',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: textStyle(18.0, FontWeight.w400, Colors.black87)),
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text('${snapshot['user_nickname']}',
                maxLines: 3,
                style: textStyle(14.0, FontWeight.w400, Colors.black87)),
          ))
    ],
  );
}
