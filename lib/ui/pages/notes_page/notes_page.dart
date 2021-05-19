import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';

class NotesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return NotesPageState();
  }

}

class NotesPageState extends State<NotesPage> {
  FirestoreRepository firestoreRepository = FirestoreRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () {
            setState(() {
              firestoreRepository.logout().then((ff) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              });
            });
          })
        ],
      ),
      body:  Text('Hey'),
    );
  }

}