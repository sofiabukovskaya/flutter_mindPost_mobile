import 'package:flutter/material.dart';

Widget tabBar() {
  return const TabBar(
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.person),
      ),
      Tab(
        icon: Icon(Icons.dynamic_feed),
      ),
      Tab(
        icon: Icon(Icons.sticky_note_2),
      ),
      Tab(
        icon: Icon(Icons.event),
      )
    ],
    unselectedLabelColor: Colors.black87,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Color(0x80008B83),
    labelColor: Color(0x80008B83),
  );
}
