import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonsFacebookGoogle({@required Function onTappedFacebookButton, @required Function onTappedGoogleButton}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      FlatButton(
        onPressed: () {
          onTappedFacebookButton();
        },
        height: 50,
        minWidth: 120,
        child: Center(
          child: Container(
            child: Image.asset('assets/Facebook_icon.png'),
          ),
        ),
        color: Color(0x1A008B83),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
      ),
      FlatButton(
        onPressed: () {onTappedGoogleButton();},
        height: 50,
        minWidth: 120,
        child: Center(
          child: Container(
            child: Image.asset('assets/Google_icon.png'),
          ),
        ),
        color: const Color(0x1A008B83),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
      )
    ],
  );
}

Widget button(BuildContext context, String label, Color color, Function onTapButton) {
  return FlatButton(
    onPressed: () {onTapButton();},
    color: color,
    height: 45.0,
    minWidth: 282.0,
    textColor: Colors.white,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Text(label,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600))),
  );
}

Widget textField(TextEditingController controller, Icon icon, Color color, String label) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: icon,
      filled: true,
      labelText: label,
      fillColor: color,
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
    cursorColor: color,
  );
}

BoxDecoration boxDecoration() {
  return const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0x4D157C76),
        width: 2.0,
      ),
    ),
  );
}

Widget titleAppBar(String title) {
  return Text(
    title,
    style: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black87),
  );
}

TextStyle textStyle(double size, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
    fontSize:  size,
    fontWeight: fontWeight,
    color: color
  );
}