import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/notes_page/widgets/alert_dialog.dart';
import 'package:flutter_mindpost/ui/pages/notes_page/widgets/tab_bar.dart';

FirestoreRepository firestoreRepository =
    FirestoreRepository(); //и эту херню убрать

class NotesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotesPageState();
  }
}

class NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
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
                })
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.green,
            ),
            Container(color: Colors.teal),
            Container(
              color: Colors.orangeAccent,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
        bottomNavigationBar: tabBar(),
      ),
    );
  }
}
