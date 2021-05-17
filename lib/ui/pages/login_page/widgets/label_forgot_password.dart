import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelForgotPassword(BuildContext context) {
  return GestureDetector(
      onTap: () {
        print('hey');
      },
      child: Text(
        AppLocalizations.of(context).translate('forgot_password_string'),
        style: GoogleFonts.poppins(
            color: Color(0xFF004280),
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      )
  );
}