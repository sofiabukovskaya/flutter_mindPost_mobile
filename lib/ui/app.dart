import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: SplashScreen(),
   );
  }
}