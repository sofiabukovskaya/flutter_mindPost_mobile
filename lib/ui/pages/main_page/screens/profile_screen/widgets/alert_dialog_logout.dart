import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogLogout extends StatelessWidget{
   const AlertDialogLogout({Key key, @required this.onClickedYesButton}) : super(key: key);
  final VoidCallback onClickedYesButton;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            onPressed: onClickedYesButton,
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.black87),
            ))
      ],
      elevation: 8.0,
    );
  }

}