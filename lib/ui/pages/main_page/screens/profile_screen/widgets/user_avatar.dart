import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget userAvatar(String  snapshot) {
  return Center(
    child: Container(
        height: 250,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white70, Color(0x33157C76)])),
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 45)),
              CircleAvatar(
                radius: 70.0,
                child: Image.asset('assets/user_photo.png'),
                backgroundColor: Colors.transparent,
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                '${snapshot.toString()}',
                style: GoogleFonts.poppins(color: Colors.black87, fontSize: 18),
              )
            ],
          ),
        )),
  );
}
