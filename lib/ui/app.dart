import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mindpost/app_localizations.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: SplashScreen(),
     supportedLocales: [
       Locale('en', 'US'),
       Locale('uk', ''),
       Locale('ru', 'RU')
     ],
     localizationsDelegates: [
       AppLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalMaterialLocalizations.delegate
     ],
     localeResolutionCallback: (locale, supportedLocales) {
       for(var supportedLocale in supportedLocales) {
         if(supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
           return supportedLocale;
         }
       }
       return supportedLocales.first;
     },
   );
  }
}