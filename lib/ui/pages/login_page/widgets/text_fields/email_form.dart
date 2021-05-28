import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

Widget emailFormField(BuildContext context, TextEditingController emailController) {
  return TextFormField(
    controller: emailController,
    validator: (String email) {
      if (email.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    decoration: InputDecoration(
      filled: true,
      labelText: AppLocalizations.of(context).translate('email_string'),
      fillColor:  const Color(0x1A008B83),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
      labelStyle: textStyle(18.0, FontWeight.w600, Colors.black45),
    ),
    keyboardType: TextInputType.text,
    cursorColor:const Color(0x99008B83),
  );

}
