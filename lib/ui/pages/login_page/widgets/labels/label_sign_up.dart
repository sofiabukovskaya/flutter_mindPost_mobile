import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';


Widget labelSignUp(BuildContext context) {
  return RichText(
    text: TextSpan(style: const TextStyle(), children: <TextSpan>[
      TextSpan(
          text: AppLocalizations.of(context).translate('dont_have_acc_string'),
          style: textStyle(18.0, FontWeight.w600, Colors.black87)),
      TextSpan(
          text: AppLocalizations.of(context).translate('sign_up_string'),
          style: textStyle(18.0, FontWeight.w600, const Color(0xFF00D1FF)),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              await Navigator.pushNamed(context, '/signUp');
            })
    ]),
  );
}