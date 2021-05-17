import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonResetPassword(BuildContext context) {
  return FlatButton(
    onPressed: () {},
    color: Color(0x80008B83),
    height: 45.0,
    minWidth: 282.0,
    textColor: Colors.white,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Text(AppLocalizations.of(context).translate('reset_password_string'),
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600))),
  );
}