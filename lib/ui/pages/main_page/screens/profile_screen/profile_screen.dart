
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/iconButton_logout.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/list_title.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/user_avatar.dart';

import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
 FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            iconButtonLogout(() {
              showDialog<dynamic>(
                  context: context,
                  builder: (_) =>
                      alertDialog(context, firestoreRepository));
            })
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
          title: titleAppBar('Profile'),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
          future: firestoreRepository.getUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(!snapshot.hasData) {
              return circularProgress();
            } else if(snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    userAvatar(snapshot.data['name']),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          width: 309,
                          height: 298,
                          child: Column(
                            children: <Widget>[
                              titleList('Name: ', '${snapshot.data['name'].toString()}'),
                              titleList('Surname: ', '${snapshot.data['surname'].toString()}'),
                              titleList('Nickname: ', '${snapshot.data['nickname'].toString()}'),
                              titleList('Date of birth: ', '${snapshot.data['birthday'].toString()}'),
                              titleList('Account: ', '${snapshot.data['account_type'].toString()}')
                            ],
                          )),
                    )
                  ],
                ),
              );
            }
            return circularProgress();
          },
        )
        );
  }
}
