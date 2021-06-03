import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_mindpost/ui/pages/login_page/widgets/login_form.dart';

import 'widgets/labels/label_welcome.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 150, left: 120, right: 120),
                  child: labelText(context)),
               Padding(
                padding: const EdgeInsets.only(top: 30),
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
