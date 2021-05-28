import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

Widget dateOfBirthForm(BuildContext context, TextEditingController dateOfBirthdayController) {

  return TextFormField(
    controller: dateOfBirthdayController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Date of birth',
      fillColor: const Color(0x1A008B83),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
      labelStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
            color: Colors.black45, fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
    ),
    onTap: () async {
      final DateTime date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100));
      dateOfBirthdayController.text = date.toString().substring(0, 10);
    },
    cursorColor: const Color(0x99008B83),
  );
}
