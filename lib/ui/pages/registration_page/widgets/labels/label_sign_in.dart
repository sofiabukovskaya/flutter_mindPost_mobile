import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelSignIn(BuildContext context) {
  return RichText(
    text: TextSpan(style: const TextStyle(), children: <TextSpan>[
      TextSpan(
          text:AppLocalizations.of(context).translate('already_have_account_string'),
          style: GoogleFonts.poppins(
              color: Colors.black45,
              fontSize: 18.0,
              fontWeight: FontWeight.w600)),
      TextSpan(
          text: AppLocalizations.of(context).translate('sign_in_string'),
          style: GoogleFonts.poppins(
              color: const Color(0xFF00D1FF),
              fontSize: 18.0,
              fontWeight: FontWeight.w600),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              // await Navigator.push(context, ScaleRoute(page: LoginPage()));
              await Navigator.pushNamed(context, '/signIn');
            })
    ]),
  );
}
