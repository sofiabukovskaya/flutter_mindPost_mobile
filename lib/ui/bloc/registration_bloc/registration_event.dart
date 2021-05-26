import 'package:flutter/cupertino.dart';

class RegistrationEvent {}

class Submitted extends RegistrationEvent {
  Submitted({@required this.email,  @required this.phone, @required this.name, @required  this.surname, @required  this.nickname, @required  this.birthday, @required  this.password, this.confirmPassword});
  final String name;
  final String surname;
  final String email;
  final String nickname;
  final String birthday;
  final String phone;
  final String password;
  final String confirmPassword;


  @override
  String toString() {
    return 'Submitted $name, $surname';
  }
}

class GoogleButtonIsPressed extends RegistrationEvent {}
class FacebookButtonIsPressed extends RegistrationEvent {}
