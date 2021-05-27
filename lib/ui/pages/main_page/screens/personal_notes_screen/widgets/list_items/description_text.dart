

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget descriptionText(BuildContext context, AsyncSnapshot<QuerySnapshot<dynamic>> snapshot, int index){
  return Positioned(
      top: 70,
      left: 150,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, '/detailPrivateNote',
            arguments: snapshot.data.docs[index]),
        child: Container(
            height: 150,
            width: 200,
            child: Text(
                '${snapshot.data.docs[index]['description'].toString()}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle(
                    18.0, FontWeight.w400, Colors.black87))),
      ));
}