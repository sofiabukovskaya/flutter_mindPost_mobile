import 'package:flutter/cupertino.dart';

abstract class RegistrationState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  RegistrationState({@required this.isEmailValid, @required this.isPasswordValid, @required this.isSubmitting, @required this.isSuccess, @required this.isFailure});
}

class RegistrationEmptyState extends RegistrationState {}

class RegistrationLoadingState {}
class RegistrationSuccessState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState{}
class RegistrationOpenPageState extends RegistrationState{}

