import 'package:flutter/material.dart';

Widget defaultImage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      color: Colors.grey,
      height: 130,
      width: 180,
      child: GestureDetector(
        child: Image.asset(
          'assets/camera.png',
          color: Colors.white,
        ),
      ),
    ),
  );
}