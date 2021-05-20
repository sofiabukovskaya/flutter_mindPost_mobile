import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotesScreenState();
  }

}

class NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notes  screen'),
      ),
    );
  }
}