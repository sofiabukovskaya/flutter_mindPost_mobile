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

    Future<String> currentUserId() async{
      User user = firebaseAuth.currentUser;
     String id = user.uid;
     return id.toString();
   }


 void signUp(String name, String surname, String nickname, String email, String birthday,
      String phone, String password) async {
     return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((result) =>
        collectionReference.doc(result.user.uid).set({
          'id': result.user.uid,
          'name': name,
          'surname': surname,
          'nickname':nickname,
          'email':email,
          'birthday':birthday,
          'phone_number': phone,
          'password':password,
          'notes':null
        }));
  }

Future signIn(String email, String password) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((result) => sharedPreferences.setString('token', result.user.uid));
 }
 Future logoutUser() async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   await firebaseAuth.signOut();
   sharedPreferences.clear();
   sharedPreferences.commit();

 }

 Future getUserData() async {
   return FirebaseFirestore.instance.collection('users').doc((FirebaseAuth.instance.currentUser).uid).get();
 }

  addDataNote(List<Note> note) async {
      await collectionReferenceNotes.doc('ddddd').set({
            'title': 'dfdfd',
            'description': 'dfdfd',
            'photoUrl' : 'dfdfd',
            'public' : 'dfdfd',
            'date_of_publish': 'dfdfd',
            'userId': collectionReference.id.toString()
      }).then((userId) => collectionReference.doc().update({
        'notes': collectionReferenceNotes.id.toString()
      }));
  }

  Future uploadImage(File image, String uploadedFileUrl) async{
   Reference storageReference = FirebaseStorage.instance.ref().child('notesPhoto/${Path.basename(image.path)}}');
   UploadTask uploadTask = storageReference.putFile(image);
   await uploadTask.whenComplete(() => print('Uploaded'));
   storageReference.getDownloadURL().then((fileUrl) => {
   });
  }

}