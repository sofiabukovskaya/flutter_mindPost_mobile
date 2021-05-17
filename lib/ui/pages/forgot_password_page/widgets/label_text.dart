
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelTextResetPassword(BuildContext context){
  return Text(
    AppLocalizations.of(context).translate('reset_password_label_string'),
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600),
    ),
  );
}