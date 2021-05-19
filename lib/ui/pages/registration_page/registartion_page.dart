import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_bloc.dart';
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
  FirestoreRepository firestoreRepository;
  RegistrationBloc registrationBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc(firestoreRepository: firestoreRepository),
    child: Scaffold(
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
                child: RegistrationForm(firestoreRepository:  firestoreRepository,)),
          ],
        ),
      ),
    ),
    );

  }
}
