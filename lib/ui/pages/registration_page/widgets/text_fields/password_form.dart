import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget passwordFormField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      labelText: 'Password',
      fillColor: Color(0x1A008B83),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
      labelStyle: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    ),

    keyboardType: TextInputType.text,
    cursorColor: Color(0x99008B83),
  );
}