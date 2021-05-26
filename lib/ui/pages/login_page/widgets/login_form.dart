import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';

import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({@required FirestoreRepository firestoreRepository});

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
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  Future<void> signInWithGoogle() async {

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final UserCredential userCredential = await firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: 'Sign in aborded by user',
        code: 'ERROR_ABORDER_BY_USER',
      );
    }
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
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
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              showDialog<dynamic>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const CircularProgressIndicator(),
                        const Text('Loading'),
                      ],
                    ),
                  );
                },
              );
            });
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
                    const Text('Invalid data!'),
                    const Text("Invalid email or password"),
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding:const EdgeInsets.only(top: 20, left: 38, right: 39),
                    child: emailFormField(context, emailController)),
                Padding(
                    padding:const EdgeInsets.only(top: 20, left: 38, right: 39),
                    child: passwordFormField(context, passwordVisible, () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }, passwordController)),
                Padding(
                    padding: const EdgeInsets.only(top: 10, left: 111, right: 111),
                    child: labelForgotPassword(context)),
                Padding(
                    padding:const  EdgeInsets.only(top: 30, left: 38, right: 48),
                    child: Container(
                        child: Image.asset('assets/Or.png',
                            height: 23.0, width: 282.0))),
                Padding(
                    padding:const  EdgeInsets.only(top: 15, left: 53, right: 53),
                    child: buttonsFacebookGoogle(
                        onTappedFacebookButton: () {},
                        onTappedGoogleButton: () {
                          signInWithGoogle().then<dynamic>((value) => Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(builder: (context)=> MainPage())));

                        })),
                Padding(
                    padding:const  EdgeInsets.only(top: 36, left: 38, right: 40),
                    child: button(
                        context,
                        AppLocalizations.of(context)
                            .translate('sign_in_string'),
                        const  Color(0x80008B83), () {
                          if(emailController.text == '' && passwordController.text == '' || passwordController.text == '' || emailController.text == '') {
                            final SnackBar snackBar = SnackBar(content: const Text('Please, enter all details'),
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: labelSignUp(context),
                )
              ]),
        );
      },
    );
  }
}
