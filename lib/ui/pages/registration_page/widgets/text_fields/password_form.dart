import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';


Widget passwordFormField(BuildContext context, TextEditingController passwordController, bool passwordVisible, Function setState) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.always,
    obscureText: passwordVisible,
    validator: (String input) {
      return !Validators.isValidPassword(input) ? 'Invalid password, please write with numbers''\n'' and less not less 6 symbols' : null;
    },
    controller: passwordController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Password',
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
      suffixIcon: IconButton(
        icon: Icon(
          passwordVisible ? Icons.visibility_off
              : Icons.visibility
        ),
        onPressed: () {
          setState();
        },
        color: Color(0x99008B83),
      )
    ),
    keyboardType: TextInputType.text,
    cursorColor: Color(0x99008B83),
  );
}