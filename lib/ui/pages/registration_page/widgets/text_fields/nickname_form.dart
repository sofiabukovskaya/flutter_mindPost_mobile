import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget nicknameFormField(BuildContext context, TextEditingController nicknameController) {
  return TextFormField(
    controller: nicknameController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Nickname',
      fillColor: const Color(0x1A008B83),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
      labelStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    ),
    keyboardType: TextInputType.text,
    cursorColor: const Color(0x99008B83),
  );
}