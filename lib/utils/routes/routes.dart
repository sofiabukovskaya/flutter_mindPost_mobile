
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/note_detail_screen/note_detail_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/scan_photo_page/scan_photo_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/personal_detail_note_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/registartion_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/splash_screen.dart';

import '../../ui/pages/main_page/screens/personal_notes_screen/add_note_page/add_note_page.dart';
import 'scale_route.dart';



Route<dynamic> routes(RouteSettings routeSettings){
  switch(routeSettings.name) {
    case '/' :
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return SplashScreen();
      });
      break;
    case '/home_page':
      final Object argument = routeSettings.arguments;
      return MaterialPageRoute<dynamic>(builder: (BuildContext context) => argument == null ? LoginPage():MainPage());
      break;
    case '/login':
      return ScaleRoute(
          page: MainPage()
      );
      break;
    case '/signUp':
      return ScaleRoute(
          page: RegistrationPage()
      );
      break;
    case '/signIn':
      return ScaleRoute(
          page: LoginPage()
      );
      break;
    case '/addNote':
      return ScaleRoute(
          page: AddNotePage()
      );
      break;
    case '/scanImage':
      return ScaleRoute(
          page: ScanPhotoPage()
      );
      break;
    case '/detailPublicNote':
      final Object snapshot = routeSettings.arguments;
      return ScaleRoute(page: NoteDetailScreen(snapshot: snapshot));
      break;
    case '/detailPrivateNote':
      final Object snapshot = routeSettings.arguments;
      return ScaleRoute(page: PersonalDetailNotePage(snapshot: snapshot,));
      break;
    case '/goBackAfterDeleteNote':
      return ScaleRoute(page: PersonalNotesScreen());
      break;
    default:
      return null;
  }
}