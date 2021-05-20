

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }

}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    AppBar(
    actions: [
    IconButton(
    icon: Icon(
      Icons.logout,
      color: Colors.black87,
    ),
    onPressed: () {
    showDialog(
    context: context,
    builder: (_) =>
    alertDialog(context, firestoreRepository));
    })
    ],
    backgroundColor: Colors.white38,
    elevation: 0,
    title: Text(
    'Profile',
    style: TextStyle(color: Colors.black87),
    ),
    centerTitle: true,
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child:Container(
                height: 240,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white70,Color(0x33157C76)]
                    )
                ),
                child: Center (
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 45)),
                      CircleAvatar(
                        radius: 60.0,
                        child: Image.asset('assets/user_photo.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text('Name user', style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 18
                      ),)
                    ],
                  ),
                )
              ) ,
            )
          ],
        ),
      )
    );
  }

}