import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';

import '../../main_page.dart';

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
      appBar:  AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black87,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) =>
                        alertDialog(context, firestoreRepository));
              }),  IconButton(
              icon: Icon(
                Icons.filter_alt_sharp,
                color: Colors.black87,
              ),
              onPressed: () {
              })
        ],
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text(
          'Notes feed',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Notes  screen'),
      ),
    );
  }
}