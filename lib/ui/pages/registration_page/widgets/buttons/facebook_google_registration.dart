import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonsFacebookGoogleRegistration() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FlatButton(
        onPressed: () {},
        height: 50,
        minWidth: 120,
        child: Center(
          child: Container(
            child: Image.asset('assets/Facebook_icon.png'),
          ),
        ),
        color: Color(0x1A008B83),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
      ),
      FlatButton(
        onPressed: () {},
        height: 50,
        minWidth: 120,
        child: Center(
          child: Container(
            child: Image.asset('assets/Google_icon.png'),
          ),
        ),
        color: Color(0x1A008B83),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
      )
    ],
  );
}