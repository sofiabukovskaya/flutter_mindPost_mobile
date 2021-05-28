import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Event {
  Event({@required this.title});
  final String title;


  @override
  String toString() => title;
}