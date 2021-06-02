

import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/models/event.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

Widget alertDialogAddEvent(BuildContext context, TextEditingController eventController, Map<DateTime, List<Event>> selectedEvents,
    DateTime selectedDay, Function selectTime, Function addEvent) {
  return AlertDialog(
    title: Text(
      '🤩 Event 🤩 ',
      style: textStyle(22.0, FontWeight.w600, Colors.black87),
    ),
    content: TextFormField(
      controller: eventController,
    ),
    actions: <Widget>[
      TextButton(
        child: Text(
          'Cancel',
          style: textStyle(18.0, FontWeight.w600, Colors.red),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      TextButton(
        child: Text('Ok',
            style: textStyle(18.0, FontWeight.w400, Colors.blueGrey)),
        onPressed: () {
          addEvent();
          Navigator.pop(context);
          selectTime();
          eventController.clear();
        },
      ),
    ],
  );
}