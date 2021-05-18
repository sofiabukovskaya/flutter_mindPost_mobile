import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelWelcomeText(BuildContext context){
  return Column(
    children: <Widget>[
    Text(
        AppLocalizations.of(context).translate('welcome_mindpost_string'),
    style: GoogleFonts.poppins(
      textStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600),
    )
    ),
      Padding(padding: EdgeInsets.only(top: 10),
      child: Text(
          'Enter your details',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'Poppins',
            ),
          )
      ),
      )
    ],
  );

}