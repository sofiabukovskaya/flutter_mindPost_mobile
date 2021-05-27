import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_event.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/confirm_password.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/date_of_birth_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/email_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/name_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/nickname_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/password_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/phone_number_form.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/text_fields/surname_form.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'label_sign_in.dart';

class RegistrationForm extends StatefulWidget {

  RegistrationForm({@required FirestoreRepository firestoreRepository});

  @override
  State<StatefulWidget> createState() {
    return RegistrationFormState();
  }
}

class RegistrationFormState extends State<RegistrationForm> {
  bool isChecked = false;
  bool passwordVisible = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateOfBirthdayController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegistrationBloc _registrationBloc;

  @override
  void initState() {
    super.initState();
    _registrationBloc = BlocProvider.of<RegistrationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _registrationBloc,
        builder: (BuildContext context, RegistrationState state) {
          if(state is RegistrationLoadingState) {
            circularProgress();
          }
          if(state is RegistrationSuccessState) {
           Navigator.push<dynamic>(context, ScaleRoute(page: MainPage()));
          }
          return Column(
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0x33008B83),
                      ),
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 275.0,
                  width: 350,
                  child: Scrollbar(
                      showTrackOnHover: true,
                      thickness: 5.0,
                      child: ListView(
                        children: <Widget>[
                          nameFormField(context, nameController),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: surnameFormField(context, surnameController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child:
                                nicknameFormField(context, nicknameController),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: emailFormField(context, emailController)),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: dateOfBirthForm(
                                context, dateOfBirthdayController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: phoneNumberFormField(
                                context, phoneNumberController),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child:
                                passwordFormField(context, passwordController, passwordVisible, (){
                                  setState(() {
                                  passwordVisible =!passwordVisible;
                                });}),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: confirmPasswordFormField(
                                context, confirmPasswordController),
                          ),
                        ],
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 25.0),
                child: CheckboxListTile(
                  activeColor: Colors.white,
                  checkColor: Colors.green,
                  value: isChecked,
                  title: Text(
                    AppLocalizations.of(context).translate('checkbox_string'),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      isChecked = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12, left: 38, right: 48),
                  child: Container(
                      child: Image.asset('assets/Or.png',
                          height: 23.0, width: 282.0))),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 53, right: 53),
                  child: buttonsFacebookGoogle(
                      onTappedFacebookButton: () {},
                      onTappedGoogleButton: () {})),
              Padding(
                  padding: const EdgeInsets.only(top: 15, left: 38, right: 40),
                  child: button(
                      context,
                      AppLocalizations.of(context).translate('sign_up_string'),
                      const Color(0x80008B83), ()  {
                        if(isChecked == false) {
                          final snackBar = SnackBar(content: const Text('Please, select a checkbox'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: (){},
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          _registrationBloc.add(Submitted
                            (email: emailController.text.trim(), phone: phoneNumberController.text.trim(), name: nameController.text.trim(), surname: surnameController.text.trim(), nickname: nicknameController.text.trim(), birthday: dateOfBirthdayController.text.trim(), password: passwordController.text.trim()));
                        }
                  })),
              Padding(
                  padding:const  EdgeInsets.only(top: 15, left: 38, right: 40),
                  child: labelSignIn(context)),
            ],
          );
        });
  }
}
