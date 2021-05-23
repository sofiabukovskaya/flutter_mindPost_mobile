import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      ),
      body: Text('ddd'),
    );
  }
}
