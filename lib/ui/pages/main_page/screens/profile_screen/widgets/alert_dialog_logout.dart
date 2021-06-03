import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

class AlertDialogLogout extends StatelessWidget{
   const AlertDialogLogout({Key key, @required this.onClickedYesButton}) : super(key: key);
  final VoidCallback onClickedYesButton;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(AppLocalizations.of(context).translate('logout_string')),
      content:  Text(AppLocalizations.of(context).translate('logout_question_string')),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:  Text(
              AppLocalizations.of(context).translate('no_string'),
              style: const TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: onClickedYesButton,
            child:  Text(
              AppLocalizations.of(context).translate('yes_string'),
              style: const TextStyle(color: Colors.black87),
            ))
      ],
      elevation: 8.0,
    );
  }

}