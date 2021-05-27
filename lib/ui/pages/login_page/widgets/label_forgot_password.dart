import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';


Widget labelForgotPassword(BuildContext context) {
  return GestureDetector(
      onTap: () async {
        await Navigator.push<dynamic>(context, ScaleRoute(page: ForgotPasswordPage()));
      },
      child: Text(
        AppLocalizations.of(context).translate('forgot_password_string'),
        style: textStyle(
            18.0, FontWeight.w600, const Color(0xFF004280))
      )
  );
}