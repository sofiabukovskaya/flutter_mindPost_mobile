import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreRepository {
  void signUp(String name, String surname, String nickname, String email,
      String birthday, String phone, String password);

  Future<void> signIn(String email, String password);

  Future<void> logout();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData();

  Future<void> addDataNote(String title, String description,
      String uploadedFileUrl, bool switched, String dateformat);

  Future<void> uploadImage(File image, String uploadedFileUrl);

  Stream<QuerySnapshot<Map<String, dynamic>>> getPublicNotes(String orderBy);

  Stream<QuerySnapshot<Map<String, dynamic>>> getPrivateNotes();

  Future<void> updateLikeCount(String id, int like);

  Future<void> updateDislikeCount(String id, int dislike);

  Future<void> updateNote(String noteId, String title, String description);

  Future<void> deleteNote(String noteId);

  Future<void> signInWithGoogle();

  Future<void> signOutFromGoogleAcc();

  Stream<QuerySnapshot<Map<String, dynamic>>> getFilteredPublicNotes(bool public);
}
