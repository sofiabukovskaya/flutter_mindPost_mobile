import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNotePageState();
  }
}

class AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add note',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white38,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Color(0xFF00847c),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 85, right: 85, bottom: 15),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(500),
                ],
                style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    color: Color(0xFF00847c),
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Title',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0x4D00847c),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            )),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
                width: 350,
                height: 300,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 300,
                  maxLength: 500,
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write about your day thoughts, day, desires...',
                      hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0x4D00847c),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600)),
                      isDense: true,
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 10.0)),
                ),
            )
        ),
      ]),
    );
  }
}
