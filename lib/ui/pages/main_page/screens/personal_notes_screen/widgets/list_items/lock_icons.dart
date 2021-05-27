
import 'package:flutter/material.dart';

Widget lockIcon(bool public) {
  return  Positioned(
      top: 50,
      left: 300,
      child: public == true
          ? const Icon(
        Icons.lock_open,
        color: Colors.black38,
      )
          : const Icon(
        Icons.lock_outline,
        color: Colors.black38,
      ));
}