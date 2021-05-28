import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';

Widget phoneNumberFormField(BuildContext context, TextEditingController phoneNumberController) {

  return TextFormField(
    validator: (String input) {
      return !Validators.isValidPhoneNumber(input) ? 'Invalid phone number' : null;
    },
    controller: phoneNumberController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Phone number',
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
    keyboardType: TextInputType.phone,
    cursorColor: const Color(0x99008B83),
  );
}