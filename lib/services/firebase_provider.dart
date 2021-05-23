import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseProvider {
  final CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('users');
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;


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

}