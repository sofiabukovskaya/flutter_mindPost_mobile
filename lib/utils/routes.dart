
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/main_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/note_detail_screen/note_detail_screen.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/add_note_page/scan_photo_page/scan_photo_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_notes_screen.dart';
import '../ui/pages/main_page/screens/personal_notes_screen/add_note_page/add_note_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/personal_detail_note_page/personal_detail_note_page.dart';
import 'package:flutter_mindpost/ui/pages/registration_page/registartion_page.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/scale_transition.dart';
import 'package:flutter_mindpost/ui/pages/splash_page/splash_screen.dart';



Route routes(RouteSettings routeSettings){
  if(routeSettings.name == '/') {
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) {
      return SplashScreen();
    });
  } else if(routeSettings.name == '/home_page') {
    final Object argument = routeSettings.arguments;
    return MaterialPageRoute<dynamic>(builder: (BuildContext context) => argument == null ? LoginPage():MainPage());
  } else if(routeSettings.name== '/login') {
    return ScaleRoute(
      page: MainPage()
    );
  } else if(routeSettings.name == '/signUp') {
    return ScaleRoute(
      page: RegistrationPage()
    );
  } else if(routeSettings.name == '/signIn') {
    return ScaleRoute(
        page: LoginPage()
    );
  } else if(routeSettings.name == '/addNote') {
    return ScaleRoute(
      page: AddNotePage()
    );
  } else if(routeSettings.name == '/scanImage'){
    return ScaleRoute(
      page: ScanPhotoPage()
    );
  } else if(routeSettings.name == '/detailPublicNote') {
    final Object snapshot = routeSettings.arguments;
    return ScaleRoute(page: NoteDetailScreen(snapshot: snapshot,));
  } else if(routeSettings.name == '/detailPrivateNote'){
    final Object snapshot = routeSettings.arguments;
    return ScaleRoute(page: PersonalDetailNotePage(snapshot: snapshot,));
  } else if(routeSettings.name == '/goBackAfterDeleteNote'){
    return ScaleRoute(page: PersonalNotesScreen());
  }
  return null;
}