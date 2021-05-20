

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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