import 'dart:io';

import 'package:flutter_mindpost/data/models/note.dart';

abstract class Repository {
  void signUp(String name, String surname, String nickname, String email,
      String birthday, String phone, String password);

  Future signIn(String email, String password);

   logout();

   Future getUserData();

   addDataNote(List<Note> note);

    Future uploadImage(File image, String uploadedFileUrl);

  // Future<String> getUserId();
}
