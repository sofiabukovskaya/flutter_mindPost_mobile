import 'dart:io';

import 'package:flutter_mindpost/data/models/note.dart';

abstract class Repository {
  void signUp(String name, String surname, String nickname, String email,
      String birthday, String phone, String password);

  Future signIn(String email, String password);

   logout();

   Future getUserData();

   addDataNote(String title, String description, String uploadedFileUrl, bool switched, String dateformat);

    Future uploadImage(File image, String uploadedFileUrl);

  // Future<String> getUserId();
}
