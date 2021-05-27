import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/registration_page/registartion_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

Widget labelSignUp(BuildContext context) {
  return RichText(
    text: TextSpan(style: TextStyle(), children: [
      TextSpan(
          text: AppLocalizations.of(context).translate('dont_have_acc_string'),
          style: textStyle(18.0, FontWeight.w600, Colors.black87)),
      TextSpan(
          text: AppLocalizations.of(context).translate('sign_up_string'),
          style: textStyle(18.0, FontWeight.w600, const Color(0xFF00D1FF)),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              // await Navigator.push(context, ScaleRoute(page: RegistrationPage()));
              await Navigator.pushNamed(context, '/signUp');
            })
    ]),
  );
}