import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

Widget titleList(String labelText, String item) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 28, left: 10),
        child: Text(labelText,
            style: GoogleFonts.poppins(
                color: Colors.black87, fontSize: 18)),
      ),
      Container(
        width: 150,
        margin:const  EdgeInsets.only(top: 28, left: 10),
        decoration: boxDecoration(), //
        child: Text(
          item,
          style: GoogleFonts.poppins(
              color: Colors.black87, fontSize: 18),
        ),
      )
    ],
  );
}