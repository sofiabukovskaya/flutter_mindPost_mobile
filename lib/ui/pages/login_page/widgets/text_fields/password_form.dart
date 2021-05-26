import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

import 'package:google_fonts/google_fonts.dart';

Widget passwordFormField(BuildContext context,  bool passwordVisible, Function setState, TextEditingController passwordController) {
  return TextFormField(
    obscureText: passwordVisible,
    controller: passwordController,
    decoration: InputDecoration(
      filled: true,
      labelText: AppLocalizations.of(context).translate('password_string'),
      fillColor:const Color(0x1A008B83),
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
          color: const Color(0x99008B83),
        )
    ),
    keyboardType: TextInputType.text,
    cursorColor: const Color(0x99008B83),
  );
}