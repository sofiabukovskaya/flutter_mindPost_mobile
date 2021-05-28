import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_bloc.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/label_welcome.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/widgets/register_forms.dart';

class RegistrationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RegistrationPageState();
  }
}

class RegistrationPageState extends State<RegistrationPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(create: (BuildContext context) => RegistrationBloc(),
    child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: labelWelcomeText(context),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RegistrationForm()),
          ],
        ),
      ),
    ),
    );

  }
}
