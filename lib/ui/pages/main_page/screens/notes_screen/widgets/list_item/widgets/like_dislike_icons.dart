
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget likeDislikeIcons(QueryDocumentSnapshot<Object> snapshot) {
  return Row(
    children: <Widget>[
      const SizedBox(
        width: 20,
      ),
      Column(
        children: <Widget>[
          const Icon(
            Icons.favorite,
          ),
          Text('${snapshot['like'].toString()}')
        ],
      ),
      const SizedBox(
        width: 200,
      ),
      Column(
        children: <Widget>[
          const Icon(
            Icons.cancel_outlined,
          ),
          Text('${snapshot['dislike'].toString()}')
        ],
      )
    ],
  );
}