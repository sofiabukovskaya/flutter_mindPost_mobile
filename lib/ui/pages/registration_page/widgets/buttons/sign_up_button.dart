import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget signUpButton(BuildContext context) {

  return FlatButton(
    onPressed: () {
    },
    color: Color(0x80008B83),
    height: 55,
    minWidth: 320,
    textColor: Colors.white,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Text('Sign up',
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600))),
  );
}