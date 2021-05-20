import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';

Widget alertDialog(BuildContext context, FirestoreRepository firestoreRepository) {
  return  AlertDialog(
    title: Text('Logout'),
    content: Text('Do you wanna logout?'),
    actions: [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: TextStyle(color: Colors.red),
          )),
      FlatButton(
          onPressed: () {
            firestoreRepository.logout().then((ff) {   //потом эту херню заменить на норм блок, это для теста
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));
            });
          },
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.black87),
          ))
    ],
    elevation: 8.0,
  );
}