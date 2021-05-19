import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase_io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_mindpost/data/models/user.dart';

class FirebaseProvider {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('users');
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;

 signUp(String name, String surname, String nickname, String email, String birthday,
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
}