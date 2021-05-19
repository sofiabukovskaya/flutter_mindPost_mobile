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
import 'package:flutter_mindpost/ui/pages/login_page/widgets/login_form.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/email_form.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/text_fields/password_form.dart';
import 'package:flutter_mindpost/ui/pages/notes_page/notes_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  FirestoreRepository firestoreRepository = FirestoreRepository();
  LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(firestoreRepository: firestoreRepository),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 150, left: 120, right: 120),
                  child: labelText(context)),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: LoginForm(firestoreRepository: firestoreRepository),
              )
            ],
          ),
        ),
      ),
    );
  }
}
