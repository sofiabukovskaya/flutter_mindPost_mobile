
import 'package:flutter/material.dart';

Widget floatingActionButton(BuildContext context) {
  return FloatingActionButton(child: const Icon(
    Icons.add,
    color: Colors.white,
    size: 45.0,
  ),
    backgroundColor: const Color(0xFF157C76),
    onPressed: () {
      Navigator.pushNamed(context, '/addNote');
    },);
}