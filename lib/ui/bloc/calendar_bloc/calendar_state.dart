import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarState {}

class AddingCalendarDataState extends CalendarState {}

class DeletingCalendarDataState extends CalendarState {}

class SelectDayCalendarState extends CalendarState {
  SelectDayCalendarState({@required this.selectDay, @required this.focusDay});

  final DateTime selectDay;
  final DateTime focusDay;
}
class SelectTimeCalendarState extends CalendarState{
  SelectTimeCalendarState(this.pickedTime);
  final TimeOfDay pickedTime;
}
class EmptyState extends CalendarState {}

class FailCalendarState extends CalendarState {}

class SuccessesCalendarState extends CalendarState {}
