import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
      Padding(
      padding: EdgeInsets.only(top: 94, left: 120, right: 120),
      child: Text(
        'Welcome Back!',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
             Padding(
             padding: EdgeInsets.only(top: 30, left: 38, right: 39),
             child: TextFormField(
            decoration: InputDecoration(
              filled: true,
               labelText: 'Enter your email',
                fillColor: Color(0x1A008B83),
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none),
              labelStyle: GoogleFonts.poppins(
           textStyle: TextStyle(
             color: Colors.black45,
           fontSize: 18.0,
             fontWeight: FontWeight.w600),
       ),
    ),
    keyboardType: TextInputType.text,
    cursorColor: Color(0x99008B83),
    )),
           Padding(
              padding: EdgeInsets.only(top: 20.0, left: 38, right: 39),
              child: TextFormField(
             decoration: InputDecoration(
               filled: true,
              labelText: 'Enter password',
                  fillColor: Color(0x1A008B83),
              border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15.0),
             borderSide: BorderSide.none),
             labelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
             color: Colors.black45,
              fontSize: 18.0,
            fontWeight: FontWeight.w600),
          ),
          ),
            keyboardType: TextInputType.text,
            cursorColor: Color(0x99008B83),
             )
          ),
           Padding(
           padding: EdgeInsets.only(top: 15, left: 111, right: 111),
           child: GestureDetector(
            onTap: (){
              print('hey');
            },
             child: Text(
             'Forgot password?',
               style: GoogleFonts.poppins(
               color: Color(0xFF004280),
               fontSize: 18.0,
               fontWeight: FontWeight.w600
               ),
               )
                )
             ),
            Padding(padding: EdgeInsets.only(top: 50, left:38 , right: 48) ,
            child: Container( child: Image.asset('assets/Or.png', height: 23.0, width: 282.0)
              )
            ),
            Padding(padding: EdgeInsets.only(top: 15, left: 53, right: 53), child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  FlatButton(
                      onPressed: () {}, height: 39.0, minWidth: 91.0, child: Center(
                        child: Container(
                          child: Image.asset('assets/Facebook_icon.png'),
                    ),
                  ),
                  color: Color(0x1A008B83), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                FlatButton(onPressed: () {},height: 39.0, minWidth: 91.0 , child: Center(
                  child: Container(
                    child: Image.asset('assets/Google_icon.png'),
                  ),
                ),
                    color: Color(0x1A008B83),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                )
              ],
            ),
            ),
            Padding(padding: EdgeInsets.only(top: 36, left: 38, right: 40),
              child: FlatButton(
                onPressed: (){},
                color: Color(0x80008B83),
                height: 45.0,
                minWidth: 282.0,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600
                        )
                    )
                ),
               ),
            ), 
            Padding(padding: EdgeInsets.only(top: 10, left: 40, right: 40), child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                      color: Colors.white10,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                  ),
                children: [
                  TextSpan(
                    text: 'Don\'t have an account?'
                  ),
                  TextSpan(
                    style:GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600
                    ), recognizer: TapGestureRecognizer()
                   ..onTap = () {
                    print('Next lala');
                     }
                  )
                ]
              ),
            ),)
       ]
    )
    );
  }
}
