import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/calendar_screen/widgets/box_decoration.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle calendarStyle (){
  return CalendarStyle(
      isTodayHighlighted: true,
      selectedDecoration: boxDecorationCalendar(Colors.teal[200], BoxShape.rectangle, BorderRadius.circular(5.0)),
      selectedTextStyle: const TextStyle(color: Colors.white),
      todayDecoration: boxDecorationCalendar(Colors.purpleAccent, BoxShape.rectangle, BorderRadius.circular(5.0)),
      defaultDecoration: boxDecorationCalendar(null, BoxShape.rectangle, BorderRadius.circular(5.0)),
      weekendDecoration: boxDecorationCalendar(null, BoxShape.rectangle, BorderRadius.circular(5.0))
  );
}