import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget alertDialog(Function deleteEvent, Function shareGoogleCalendar,
    Event event, TimeOfDay time) {
  return AlertDialog(
    title: Text('You can delete or share to Google calendar your event',
        style: textStyle(18.0, FontWeight.w500, Colors.black87)),
    actions: <Widget>[
      Row(
        children: <Widget>[
          TextButton(
            onPressed: () {
              deleteEvent();
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: Colors.red[300],
            ),
            child: const Icon(Icons.delete),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              primary: Colors.green[100],
            ),
            onPressed: () {
              shareGoogleCalendar();
            },
            child: const Icon(Icons.share),
          )
        ],
      )
    ],
  );
}
