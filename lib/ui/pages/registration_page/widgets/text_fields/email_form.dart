import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';

Widget emailFormField(BuildContext context, TextEditingController emailController) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.always, validator: (String input) {
      return !Validators.isValidEmail(input) ? 'Invalid email' : null;
    },
    controller: emailController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Email',
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