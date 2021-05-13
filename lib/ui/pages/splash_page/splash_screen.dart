import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
              color: Color(0x99008B83),
              elevation: 8.0,
              height: 45.0,
              minWidth: 282.0,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                'Get started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
