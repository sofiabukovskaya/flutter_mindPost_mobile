import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_event.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/routes/scale_route.dart';
import 'labels/label_sign_in.dart';

class RegistrationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationFormState();
  }
}

class _RegistrationFormState extends State<RegistrationForm> {
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

  //RegistrationBloc registrationBloc;

  @override
  void initState() {
    super.initState();
    context.read<RegistrationBloc>();
    //registrationBloc = BlocProvider.of<RegistrationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        bloc: context.read<RegistrationBloc>(),
        builder: (BuildContext context, RegistrationState state) {
          if (state is RegistrationLoadingState) {
            circularProgress();
          }
          if (state is RegistrationSuccessState) {
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
                          textField(nameController,  AppLocalizations.of(context).translate('name_string'), TextInputType.name),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: textField(surnameController,  AppLocalizations.of(context).translate('surname_string'),
                                TextInputType.name),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: textField(nicknameController,  AppLocalizations.of(context).translate('nickname_string'),
                                TextInputType.text),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: textField(emailController,  AppLocalizations.of(context).translate('email_enter_string'),
                                  TextInputType.emailAddress)),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: textField(dateOfBirthdayController, AppLocalizations.of(context).translate('date_birthday_string'),
                            TextInputType.datetime, function: () async {
                                  final DateTime date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  dateOfBirthdayController.text = date.toString().substring(0, 10);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: textField(phoneNumberController,
                                AppLocalizations.of(context).translate('phone_number_string'), TextInputType.phone),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: passwordTextField(passwordController,
                                AppLocalizations.of(context).translate('password_enter_string'), TextInputType.visiblePassword, () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            }, passwordVisible),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: textField(confirmPasswordController,  AppLocalizations.of(context).translate('confirm_password_string'), TextInputType.visiblePassword),
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
                      const Color(0x80008B83), () {
                    if (isChecked == false) {
                      showSnackBar(context,  AppLocalizations.of(context).translate('please_select_checkbox_string'));
                    } else {
                      context.read<RegistrationBloc>().add(Submitted(
                          email: emailController.text.trim(),
                          phone: phoneNumberController.text.trim(),
                          name: nameController.text.trim(),
                          surname: surnameController.text.trim(),
                          nickname: nicknameController.text.trim(),
                          birthday: dateOfBirthdayController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  })),
              Padding(
                  padding: const EdgeInsets.only(top: 15, left: 38, right: 40),
                  child: labelSignIn(context)),
            ],
          );
        });
  }
}
