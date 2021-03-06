import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/utils/validators.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonsFacebookGoogle(
    {@required Function onTappedFacebookButton,
    @required Function onTappedGoogleButton}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        height: 50,
        width: 120,
        child: TextButton(
          onPressed: () {
            onTappedFacebookButton();
          },
          child: Center(
            child: Container(
              child: Image.asset('assets/Facebook_icon.png'),
            ),
          ),
          style: TextButton.styleFrom(
            primary: const Color(0x1A008B83),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 120,
        child: TextButton(
          onPressed: () {
            onTappedGoogleButton();
          },
          child: Center(
            child: Container(
              child: Image.asset('assets/Google_icon.png'),
            ),
          ),
          style: TextButton.styleFrom(
            primary: const Color(0x1A008B83),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      )
    ],
  );
}

Widget button(
    BuildContext context, String label, Color color, Function onTapButton) {
  return Container(
    height: 45.0,
    width: 282.0,
    child: TextButton(
      onPressed: () {
        onTapButton();
      },
      style: TextButton.styleFrom(
        primary: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child:
          Text(label, style: textStyle(18.0, FontWeight.w600, Colors.black87)),
    ),
  );
}

Widget searchTextField(
    TextEditingController controller, Icon icon, Color color, String label) {
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
      labelStyle: textStyle(18.0, FontWeight.w400, Colors.black87),
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
    style: textStyle(20.0, FontWeight.w500, Colors.black87),
  );
}

TextStyle textStyle(double size, FontWeight fontWeight, Color color) {
  return GoogleFonts.poppins(
      fontSize: size, fontWeight: fontWeight, color: color);
}

Center circularProgress() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    ),
  );
}

Widget textField(TextEditingController textEditingController, String labelText, TextInputType textInputType, {Function function}) {
  return TextFormField(
    controller: textEditingController,
    decoration: InputDecoration(
      filled: true,
      labelText: labelText,
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
    onTap: function,
    keyboardType: textInputType,
    cursorColor: const Color(0x99008B83),
  );
}

Widget passwordTextField(TextEditingController passwordController, String labelText, TextInputType textInputType, Function changeState, bool
    passwordVisibility) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.always,
    obscureText: passwordVisibility,
    validator: (String input) {
      return !Validators().isValidPassword(input) ? 'Invalid password, please write with numbers''\n'' and less not less 6 symbols' : null;
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
              passwordVisibility ? Icons.visibility_off
                  : Icons.visibility
          ),
          onPressed: () {
            changeState();
          },
          color: const Color(0x99008B83),
        )
    ),
    keyboardType: TextInputType.text,
    cursorColor: const Color(0x99008B83),
  );
}

void showSnackBar(BuildContext context, String title) {
  final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(title),
      action: SnackBarAction(
          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}




