
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/forgot_password_page/widgets/button_reset_password.dart';
import 'package:flutter_mindpost/ui/pages/forgot_password_page/widgets/email_form_reset.dart';
import 'package:flutter_mindpost/ui/pages/forgot_password_page/widgets/label_text.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordState();
  }

}

class ForgotPasswordState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white38,
        leading: GestureDetector (
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black87, ),
        )
      ),
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 225, left: 120, right: 120), child: labelTextResetPassword(context),),
            Padding(padding:  EdgeInsets.only(top: 35, left: 38, right: 39), child: emailFormResetPassword(context),),
            Padding(padding:  EdgeInsets.only(top: 40, left: 38, right: 39), child: buttonResetPassword(context),),
          ],
        ),
      ),
    );
  }

}