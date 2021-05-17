import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/confirm_password.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/date_of_birth_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/email_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/name_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/nickname_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/password_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/phone_number_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/surname_form.dart';


Widget textFormField(BuildContext context){
  return Column(
    children: <Widget>[
      Center(
        child:Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:   Color(0x33008B83),
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          height: 275.0,
          width: 350,
          child: Scrollbar(
              showTrackOnHover: true,
              thickness: 5.0,
              child: ListView(
                children: <Widget>[
                  nameFormField(context),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: surnameFormField(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: nicknameFormField(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: emailFormField(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: dateOfBirthForm(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: phoneNumberFormField(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: passwordFormField(context),),
                  Padding(padding: EdgeInsets.only(top: 14.0), child: confirmPasswordFormField(context),),
                ],
              )
          ),
        ) ,
      )
    ],
  );

}