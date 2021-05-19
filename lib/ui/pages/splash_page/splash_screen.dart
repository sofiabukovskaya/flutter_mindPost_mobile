import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/notes_page/notes_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences sharedPreferences;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: animation,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/Icon.png',
                  width: 440.0,
                  height: 377.0,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            MaterialButton(
              onPressed: () async {
                sharedPreferences = await SharedPreferences.getInstance();
                String token = sharedPreferences.getString('token');
               await Navigator.push(context, MaterialPageRoute(builder: (context) => token == null? LoginPage():NotesPage()));
              },
              color: Color(0x99008B83),
              elevation: 8.0,
              height: 45.0,
              minWidth: 282.0,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                'Get started',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600
                  )
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
