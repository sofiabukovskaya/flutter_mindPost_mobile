import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelSignIn(BuildContext context) {
  return RichText(
    text: TextSpan(style: TextStyle(), children: [
      TextSpan(
          text: 'Already have an account? ',
          style: GoogleFonts.poppins(
              color: Colors.black45,
              fontSize: 18.0,
              fontWeight: FontWeight.w600)),
      TextSpan(
          text: 'Sign in',
          style: GoogleFonts.poppins(
              color: Color(0xFF00D1FF),
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