import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';


import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_forgot_password.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_sign_up.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_welcome.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/email_form.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/password_form.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}



class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
              Widget>[
            Padding(
                padding: EdgeInsets.only(top: 150, left: 120, right: 120),
                child: labelText(context)),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 38, right: 39),
                child: emailFormField(context)
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 38, right: 39),
                child: passwordFormField(context)
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 111, right: 111),
                child: labelForgotPassword(context)
            ),
            Padding(
                padding: EdgeInsets.only(top: 30, left: 38, right: 48),
                child: Container(
                    child: Image.asset('assets/Or.png', height: 23.0, width: 282.0))),
            Padding(
                padding: EdgeInsets.only(top: 15, left: 53, right: 53),
                child: buttonsFacebookGoogle(onTappedFacebookButton: (){}, onTappedGoogleButton: (){})
            ),
            Padding(
                padding: EdgeInsets.only(top: 36, left: 38, right: 40),
                child: button(context, AppLocalizations.of(context).translate('sign_in_string'),
                    Color(0x80008B83), (){})
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              child: labelSignUp(context),
            )
          ]
          ),
        )
    );
  }
}
