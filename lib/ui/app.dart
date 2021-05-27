import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_mindpost/ui/pages/splash_page/splash_screen.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';
import 'package:flutter_mindpost/utils/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme:  ThemeData(primaryColor: Colors.green),
     initialRoute: '/',
     onGenerateRoute: routes,
     supportedLocales: [
       const Locale('en', 'US'),
       const Locale('uk', ''),
       const  Locale('ru', 'RU')
     ],
     localizationsDelegates: [
       AppLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalMaterialLocalizations.delegate
     ],
     localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
       for(Locale supportedLocale in supportedLocales) {
         if(supportedLocale.languageCode == locale.languageCode && supportedLocale.countryCode == locale.countryCode) {
           return supportedLocale;
         }
       }
       return supportedLocales.first;
     },
   );
  }
}