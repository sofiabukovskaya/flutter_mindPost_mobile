import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget labelWelcomeText(BuildContext context){
  return Column(
    children: <Widget>[
    Text(
        AppLocalizations.of(context).translate('welcome_mindpost_string'),
    style: textStyle(
    20.0, FontWeight.w600, Colors.black87)
    ),
      Padding(padding: const EdgeInsets.only(top: 10),
      child: Text(
          'Enter your details',
          style: textStyle(
              18.0, FontWeight.w400, Colors.black87)
      ),
      )
    ],
  );

}