import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

HeaderStyle headerStyle() {
  return HeaderStyle(
    formatButtonVisible: true,
    titleCentered: true,
    formatButtonShowsNext: false,
    formatButtonDecoration: BoxDecoration(
      color: const Color(0xFF00847c),
      borderRadius: BorderRadius.circular(5.0),
    ),
    formatButtonTextStyle: const TextStyle(
      color: Colors.white,
    ),
  );
}