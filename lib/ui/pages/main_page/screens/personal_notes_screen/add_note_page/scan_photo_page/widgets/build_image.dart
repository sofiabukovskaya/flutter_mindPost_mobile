import 'dart:io';

import 'package:flutter/material.dart';

Widget buildImage(BuildContext context, File image) => Container(
  child: image != null
      ? Container(
    height: 150,
    width: 150,
    child: Image.file(image, fit: BoxFit.cover,),
  )
      : const Icon(Icons.photo, size: 50, color: Colors.black26),
);