import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class FirebaseProvider {
  final CollectionReference<dynamic> collectionReference =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference<dynamic> collectionReferenceNotes =
      FirebaseFirestore.instance.collection('notes');

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<String> notesId = <String>[];

  Future<String> currentUserId() async {
    final User user = firebaseAuth.currentUser;
    final String id = user.uid;
    return id.toString();
  }

  String userId;

  Future<UserCredential> signUp(String name, String surname, String nickname,
      String email, String birthday, String phone, String password) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then<dynamic>((UserCredential result) =>
            collectionReference.doc(result.user.uid).set(<String, dynamic>{
              'id': result.user.uid,
              'name': name,
              'surname': surname,
              'nickname': nickname,
              'email': email,
              'birthday': birthday,
              'phone_number': phone,
              'password': password,
              'notes': null
            }));
  }

  Future<String> getId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString('token');
    return userId;
  }

  Future<bool> signIn(String email, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential result) =>
            sharedPreferences.setString('token', result.user.uid));
  }

  Future<void> logoutUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await firebaseAuth.signOut();
    sharedPreferences.clear();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc((FirebaseAuth.instance.currentUser).uid)
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPublicNotes() {
    return FirebaseFirestore.instance
        .collection('notes')
        .where('public', isEqualTo: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPrivateNotes() {
    getId().then((String id) => userId = id);
    return FirebaseFirestore.instance
        .collection('notes')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> addDataNote(String title, String description,
      String uploadedFileUrl, bool switched, String dateformat) async {
    await currentUserId().then((String result) => userId = result);

    final DocumentReference<dynamic> documentReference =
        collectionReferenceNotes.doc();
    notesId.add(documentReference.id);
    await collectionReferenceNotes.add(<String, dynamic>{
      'title': title,
      'description': description,
      'photoUrl': uploadedFileUrl,
      'public': switched,
      'publish': dateformat,
      'userId': userId,
      'like': 0,
      'dislike': 0,
      'user_nickname': 'sonya543'
    }).then((DocumentReference<dynamic> doc) => collectionReference
        .doc(userId)
        .update(<String, dynamic>{'notes': FieldValue.arrayUnion(notesId)}));
  }

  Future<void> uploadImage(File image, String uploadedFileUrl) async {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('notesPhoto/${path.basename(image.path)}}');
    final UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => print('Uploaded'));
  }

  Future<void> updateLikeCount(String id, int like) async => await collectionReferenceNotes.doc(id).update(<String, dynamic>{'like': like});


  Future<void> updateDislikeCount(String id, int dislike) async => await collectionReferenceNotes.doc(id).update(<String, dynamic>{'dislike': dislike});

  Future<void> updateNote(
      String noteId, String title, String description) async {
    await collectionReferenceNotes
        .doc(noteId)
        .update(<String, dynamic>{'title': title, 'description': description});
  }

  Future<void> deleteNote(String noteId) async {
    await collectionReferenceNotes.doc(noteId).delete().then((_) =>
        collectionReference
            .doc(userId)
            .collection('notes')
            .doc(noteId)
            .delete());
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return userCredential.user;
      }
    } else {
      throw FirebaseAuthException(
        message: 'Sign in aborded by user',
        code: 'ERROR_ABORDER_BY_USER',
      );
    }
  }

  Future<void> signOutFromGoogleAcc() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
