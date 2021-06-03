import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget alertDialogClearImage(BuildContext context, Function clearImage, File image) {
  return GestureDetector(
      onLongPress: () {
        showDialog<dynamic>(
            context: context,
            builder: (_) =>
                AlertDialog(
                  title:  Text(AppLocalizations.of(context)
                      .translate('delete_note_string')),
                  content:  Text(
                      AppLocalizations.of(context)
                          .translate('delete_picture_question')),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:  Text(
                          AppLocalizations.of(context)
                              .translate('no_string'),
                          style: const TextStyle(
                              color: Colors.red),
                        )),
                    TextButton(
                        onPressed: () {
                          clearImage();
                        },
                        child:  Text(
                          AppLocalizations.of(context)
                              .translate('yes_string'),
                          style: const TextStyle(
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