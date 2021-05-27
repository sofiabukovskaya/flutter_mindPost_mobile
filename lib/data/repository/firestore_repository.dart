
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mindpost/data/repository/repository.dart';
import 'package:flutter_mindpost/services/firebase_provider.dart';

class FirestoreRepository implements Repository {
  final FirebaseProvider firebaseProvider = FirebaseProvider();

  @override
  Future<UserCredential> signUp(String name, String surname, String nickname, String email,
          String birthday, String phone, String password) =>
      firebaseProvider.signUp(
          name, surname, nickname, email, birthday, phone, password);

  @override
   Future<bool> signIn(String email, String password) async =>
      await firebaseProvider.signIn(email, password);

  @override
  Future<void> logout() async => await firebaseProvider.logoutUser();

  @override
   Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async => await firebaseProvider.getUserData();

  @override
  Future<void> addDataNote(String title, String description, String uploadedFileUrl, bool switched, String dateformat) async => await firebaseProvider.addDataNote(title, description, uploadedFileUrl, switched, dateformat);

  @override
    Future<void> uploadImage(File image, String uploadedFileUrl) async => await firebaseProvider.uploadImage(image, uploadedFileUrl);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getPublicNotes()  =>  firebaseProvider.getPublicNotes();

  @override
   Stream<QuerySnapshot<Map<String, dynamic>>> getPrivateNotes() => firebaseProvider.getPrivateNotes();

  @override
  Future<void> updateDislikeCount(String id, int dislike) async => firebaseProvider.updateDislikeCount(id, dislike);

  @override
  Future<void> updateLikeCount(String id, int like) async => await firebaseProvider.updateLikeCount(id, like);

}
