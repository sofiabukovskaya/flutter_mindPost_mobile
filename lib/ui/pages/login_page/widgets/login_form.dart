import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_event.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_forgot_password.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_sign_up.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/label_welcome.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/email_form.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/password_form.dart';
import 'package:flutter_mindpost/ui/pages/notes_page/notes_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  LoginForm({@required FirestoreRepository firestoreRepository});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  FirestoreRepository firestoreRepository = FirestoreRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = true;
  LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginSuccessfulState) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
           // Navigator.push(context, ScaleRoute(page: NotesPage()));
            Navigator.pushNamed(context, '/login');
          });
        } else if (state is LoginLoadingState) {
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        Text("Loading"),
                      ],
                    ),
                  );
                },
              );
            });
          });
        }
        if (state is LoginInvalidState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Invalid data!'),
                    Text("Invalid email or password"),
                  ],
                ),
              );
            },
          );
          new Future.delayed(new Duration(seconds: 3), () {
            Navigator.pop(context); //pop dialog
          });
        }
        return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 38, right: 39),
                    child: emailFormField(context, emailController)),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 38, right: 39),
                    child: passwordFormField(context, passwordVisible, () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }, passwordController)),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 111, right: 111),
                    child: labelForgotPassword(context)),
                Padding(
                    padding: EdgeInsets.only(top: 30, left: 38, right: 48),
                    child: Container(
                        child: Image.asset('assets/Or.png',
                            height: 23.0, width: 282.0))),
                Padding(
                    padding: EdgeInsets.only(top: 15, left: 53, right: 53),
                    child: buttonsFacebookGoogle(
                        onTappedFacebookButton: () {},
                        onTappedGoogleButton: () {})),
                Padding(
                    padding: EdgeInsets.only(top: 36, left: 38, right: 40),
                    child: button(
                        context,
                        AppLocalizations.of(context)
                            .translate('sign_in_string'),
                        Color(0x80008B83), () {
                          if(emailController.text == '' && passwordController.text == '' || passwordController.text == '' || emailController.text == '') {
                            final snackBar = SnackBar(content: Text('Please, enter all details'),
                                action: SnackBarAction(
                                  textColor: Colors.teal,
                                  label: 'Ok',
                                  onPressed: (){},
                                ));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            loginBloc.add(SignInEvent(emailController.text.trim(),
                                passwordController.text.trim()));
                          }
                    })),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: labelSignUp(context),
                )
              ]),
        );
      },
    );
  }
}
