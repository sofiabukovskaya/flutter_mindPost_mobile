import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/registration_page/widgets/label_sign_in.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/label_welcome.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/register_forms.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistrationPageState();
  }
}

class RegistrationPageState extends State<RegistrationPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 75.0),
              child: labelWelcomeText(context),
            ),

            Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: textFormField(context)),

            Padding(
                padding: EdgeInsets.only(top: 20.0, left: 25.0),
                child: CheckboxListTile(
                  activeColor: Colors.white,
                  checkColor: Colors.green,
                  value: isChecked,
                  title: Text(
                    'I am over 14 years old',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12, left: 38, right: 48),
                child: Container(
                    child: Image.asset('assets/Or.png', height: 23.0, width: 282.0))),
            Padding(
                padding: EdgeInsets.only(top: 10, left: 53, right: 53),
                child: buttonsFacebookGoogle(onTappedFacebookButton: (){}, onTappedGoogleButton: (){})
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, left: 38, right: 40),
                child: button(context, 'Sign up',
                    Color(0x80008B83), (){})
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, left: 38, right: 40),
                child: labelSignIn(context)
            ),
          ],
        ),
      ),
    );
  }
}
