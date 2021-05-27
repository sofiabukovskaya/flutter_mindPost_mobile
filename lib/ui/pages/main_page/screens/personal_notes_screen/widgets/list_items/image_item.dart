import 'package:flutter/material.dart';

Widget imageItem() {
  return Positioned(
      top: 20,
      child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 100,
            width: 132,
            child: Image.asset('assets/giraffe.png'),
          )));
}
