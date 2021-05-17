import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

Widget dateOfBirthForm(BuildContext context) {
  final dateController = TextEditingController();
  return TextFormField(
    controller: dateController,
    decoration: InputDecoration(
      filled: true,
      labelText: 'Date of birth',
      fillColor: Color(0x1A008B83),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
      labelStyle: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: Colors.black45, fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
    ),
    onTap: () async {
      var date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100));
      dateController.text = date.toString().substring(0, 10);
    },
    cursorColor: Color(0x99008B83),
  );
}
