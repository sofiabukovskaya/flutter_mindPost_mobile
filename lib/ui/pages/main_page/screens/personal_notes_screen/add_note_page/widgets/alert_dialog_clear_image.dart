import 'dart:io';

import 'package:flutter/material.dart';

Widget alertDialogClearImage(BuildContext context, Function clearImage, File image) {
  return GestureDetector(
      onLongPress: () {
        showDialog<dynamic>(
            context: context,
            builder: (_) =>
                AlertDialog(
                  title: const Text('Delete picture'),
                  content: const Text(
                      'Do you wanna delete a picture?'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(
                              color: Colors.red),
                        )),
                    TextButton(
                        onPressed: () {
                          clearImage();
                          // setState(() {
                          //   image = null;
                          // });
                          // Navigator.pop(context);
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                              color: Colors.black87),
                        ))
                  ],
                  elevation: 8.0,
                ));
      },
      child: Container(
          alignment: Alignment.center,
          child: Image.file(
            image,
            height: 130,
            width: 180,
            fit: BoxFit.fill,
          )));
}