import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_event.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

import 'labels/label_forgot_password.dart';
import 'labels/label_sign_up.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  LoginBloc loginBloc;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginSuccessfulState) {
          WidgetsBinding.instance
              .addPostFrameCallback((Duration timeStamp) async {
            Navigator.pushNamed(context, '/login');
          });
        } else if (state is LoginLoadingState) {
          Timer.run(() {
            circularProgress();
          });
        }
        if (state is LoginInvalidState) {
          showDialog<dynamic>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(AppLocalizations.of(context)
                        .translate('invalid_data_string')),
                    Text(AppLocalizations.of(context)
                        .translate('invalid_email_or_password_string')),
                  ],
                ),
              );
            },
          );
          Future<dynamic>.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context); //pop dialog
          });
        }
        return SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 38, right: 39),
                child: textField(
                    emailController,
                    AppLocalizations.of(context)
                        .translate('email_enter_string'),
                    TextInputType.emailAddress)),
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 38, right: 39),
                child: passwordTextField(
                    passwordController,
                    AppLocalizations.of(context)
                        .translate('password_enter_string'),
                    TextInputType.visiblePassword, () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                }, passwordVisible)),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 111, right: 111),
                child: labelForgotPassword(context)),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 38, right: 48),
                child: Container(
                    child: Image.asset('assets/Or.png',
                        height: 23.0, width: 282.0))),
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 53, right: 53),
                child: buttonsFacebookGoogle(
                    onTappedFacebookButton: () {},
                    onTappedGoogleButton: () {
                      loginBloc.add(LoginGoogleEvent());
                    })),
            Padding(
                padding: const EdgeInsets.only(top: 36, left: 38, right: 40),
                child: button(
                    context,
                    AppLocalizations.of(context).translate('sign_in_string'),
                    const Color(0x80008B83), () {
                  if (emailController.text == '' &&
                          passwordController.text == '' ||
                      passwordController.text == '' ||
                      emailController.text == '') {
                    showSnackBar(
                        context,
                        AppLocalizations.of(context)
                            .translate('enter_all_details_string'));
                  } else {
                    loginBloc.add(SignInEvent(emailController.text.trim(),
                        passwordController.text.trim()));
                  }
                })),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              child: labelSignUp(context),
            )
          ]),
        );
      },
    );
  }
}
