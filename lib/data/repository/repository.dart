import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mindpost/data/models/note.dart';

abstract class Repository {
  void signUp(String name, String surname, String nickname, String email,
      String birthday, String phone, String password);

  Future<void> signIn(String email, String password);

  Future<void> logout();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData();

  Future<void> addDataNote(String title, String description,
      String uploadedFileUrl, bool switched, String dateformat);

  Future<void> uploadImage(File image, String uploadedFileUrl);

  Stream<QuerySnapshot<Map<String, dynamic>>> getPublicNotes();

  Stream<QuerySnapshot<Map<String, dynamic>>> getPrivateNotes();
}
