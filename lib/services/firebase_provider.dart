import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_mindpost/data/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as Path;

class FirebaseProvider {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference collectionReferenceNotes =
  FirebaseFirestore.instance.collection('notes');

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<String> notesId = [];

  Future<String> currentUserId() async {
    User user = firebaseAuth.currentUser;
    String id = user.uid;
    return id.toString();
  }

  String userId;


  void signUp(String name, String surname, String nickname, String email,
      String birthday,
      String phone, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password).then((result) =>
        collectionReference.doc(result.user.uid).set({
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
  getId() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString('token');
    return userId;
  }
  Future signIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
        .then((result) =>
        sharedPreferences.setString('token', result.user.uid));

  }

  Future logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await firebaseAuth.signOut();
    sharedPreferences.clear();
    sharedPreferences.commit();
  }

  Future getUserData() async {
    return FirebaseFirestore.instance.collection('users').doc(
        (FirebaseAuth.instance.currentUser).uid).get();
  }

   getPublicNotes() {
    return FirebaseFirestore.instance.collection('notes').where('public', isEqualTo: true).snapshots();
  }
  
  getPrivateNotes() {
    getId();
    return FirebaseFirestore.instance.collection('notes').where('userId', isEqualTo: userId).snapshots();
  }

  void addDataNote(String title, String description, String uploadedFileUrl,
      bool switched, String dateformat) async {
    await currentUserId().then((String result) => userId = result);
    DocumentReference documentReference = collectionReferenceNotes.doc();
    notesId.add(documentReference.id);
    await collectionReferenceNotes.add({
      'title': title,
      'description': description,
      'photoUrl': uploadedFileUrl,
      'public': switched,
      'publish': dateformat,
      'userId': userId,
      'like': 0,
      'dislike': 0
    }).then((doc) =>
        collectionReference.doc(userId).update({
          'notes': FieldValue.arrayUnion(notesId)
        }));
  }

  Future uploadImage(File image, String uploadedFileUrl) async {
    Reference storageReference = FirebaseStorage.instance.ref().child(
        'notesPhoto/${Path.basename(image.path)}}');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => print('Uploaded'));
    storageReference.getDownloadURL().then((fileUrl) =>
    {
    });
  }

}