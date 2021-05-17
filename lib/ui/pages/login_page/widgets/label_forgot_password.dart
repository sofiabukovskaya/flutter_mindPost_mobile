import 'package:flutter/material.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:flutter_mindpost/ui/pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelForgotPassword(BuildContext context) {
  return GestureDetector(
      onTap: () async {
        await Navigator.push(context, ScaleRoute(page: ForgotPasswordPage()));
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