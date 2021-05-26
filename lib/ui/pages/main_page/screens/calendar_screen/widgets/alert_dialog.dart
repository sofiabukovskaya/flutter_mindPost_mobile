
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/services/api/calendar_service.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget alertDialog(Function deleteEvent, CalendarService calendarService, Event event, TimeOfDay time) {
  return AlertDialog(
    title: Text('You can delete or share to Google calendar your event', style:  textStyle(18.0, FontWeight.w500, Colors.black87)),
    actions: <Widget>[
      Row(
        children: <Widget> [
          FlatButton(onPressed:() {
            deleteEvent();
          },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            color: Colors.red[300],
            child: const Icon(Icons.delete),),
          FlatButton(onPressed:() {
            calendarService.insert(event.title, DateTime(time.hour, time.minute),  DateTime(time.hour, time.minute));
          },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            color: Colors.green[100],
            child:const Icon(Icons.share),)
        ],
      )
    ],
  );
}