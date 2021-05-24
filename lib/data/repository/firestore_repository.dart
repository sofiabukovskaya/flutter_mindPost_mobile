
import 'dart:io';

import 'package:flutter_mindpost/data/repository/repository.dart';
import 'package:flutter_mindpost/services/firebase_provider.dart';

class FirestoreRepository implements Repository {
  final firebaseProvider = FirebaseProvider();

  signUp(String name, String surname, String nickname, String email,
          String birthday, String phone, String password) =>
      firebaseProvider.signUp(
          name, surname, nickname, email, birthday, phone, password);

  Future signIn(String email, String password) async =>
      await firebaseProvider.signIn(email, password);

  logout() async => await firebaseProvider.logoutUser();

  @override
  Future getUserData() async => await firebaseProvider.getUserData();

  @override
  addDataNote(String title, String description, String uploadedFileUrl, bool switched, String dateformat) async => await firebaseProvider.addDataNote(title, description, uploadedFileUrl, switched, dateformat);

  @override
   Future uploadImage(File image, String uploadedFileUrl) async => await firebaseProvider.uploadImage(image, uploadedFileUrl);

  @override
  getPublicNotes()  =>  firebaseProvider.getPublicNotes();


}
