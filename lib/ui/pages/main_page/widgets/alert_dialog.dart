import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';

Widget alertDialog(BuildContext context) {
  return  AlertDialog(
    title: const Text('Logout'),
    content: const Text('Do you wanna logout?'),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'No',
            style: TextStyle(color: Colors.red),
          )),
      TextButton(
          onPressed: () {
            FirestoreRepositoryImpl().logout().then((_) async {   //потом эту херню заменить на норм блок, это для теста
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => LoginPage()));
            });
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.black87),
          ))
    ],
    elevation: 8.0,
  );
}