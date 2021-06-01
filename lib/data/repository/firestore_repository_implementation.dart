
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/services/firebase_provider.dart';

class FirestoreRepositoryImpl implements FirestoreRepository {
  factory FirestoreRepositoryImpl() => _singleton;
  FirestoreRepositoryImpl._internal();

  final FirebaseProvider firebaseProvider = FirebaseProvider();

  static final FirestoreRepository _singleton = FirestoreRepositoryImpl._internal();

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
  Stream<QuerySnapshot<Map<String, dynamic>>> getPublicNotes(String orderBy)  =>  firebaseProvider.getPublicNotes(orderBy);

  @override
   Stream<QuerySnapshot<Map<String, dynamic>>> getPrivateNotes() => firebaseProvider.getPrivateNotes();

  @override
  Future<void> updateDislikeCount(String id, int dislike) async => firebaseProvider.updateDislikeCount(id, dislike);

  @override
  Future<void> updateLikeCount(String id, int like) async => await firebaseProvider.updateLikeCount(id, like);

  @override
  Future<void> deleteNote(String noteId) async => await firebaseProvider.deleteNote(noteId);

  @override
  Future<void> updateNote(String noteId, String title, String description) async => await firebaseProvider.updateNote(noteId, title, description);

  @override
  Future<void> signInWithGoogle() async => await firebaseProvider.signInWithGoogle();

  @override
  Future<void> signOutFromGoogleAcc() async => await firebaseProvider.signOutFromGoogleAcc();

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getFilteredPublicNotes(bool public)  =>  firebaseProvider.getFilteredPublicNotes(public);

}
