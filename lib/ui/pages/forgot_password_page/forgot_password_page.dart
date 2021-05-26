
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/forgot_password_page/widgets/email_form_reset.dart';
import 'package:flutter_mindpost/ui/pages/forgot_password_page/widgets/label_text.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';


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
          child: const Icon(Icons.arrow_back, color: Colors.black87, ),
        )
      ),
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 225, left: 100, right: 100), child: labelTextResetPassword(context),),
            Padding(padding:  const EdgeInsets.only(top: 35, left: 38, right: 39), child: emailFormResetPassword(context),),
            Padding(padding:  const EdgeInsets.only(top: 40, left: 38, right: 39), child: button(context, AppLocalizations.of(context).translate('reset_password_string'),
                const Color(0x80008B83), (){}),),
          ],
        ),
      ),
    );
  }

}