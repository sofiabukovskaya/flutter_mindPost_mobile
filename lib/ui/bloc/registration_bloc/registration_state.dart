import 'package:flutter/cupertino.dart';

abstract class RegistrationState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  RegistrationState({@required this.isEmailValid, @required this.isPasswordValid, @required this.isSubmitting, @required this.isSuccess, @required this.isFailure});
}

class RegistrationEmptyState implements RegistrationState {
  @override
  // TODO: implement isEmailValid
  bool get isEmailValid => true;

  @override
  // TODO: implement isFailure
  bool get isFailure => false;

  @override
  // TODO: implement isPasswordValid
  bool get isPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement isSubmitting
  bool get isSubmitting => throw UnimplementedError();

  @override
  // TODO: implement isSuccess
  bool get isSuccess => throw UnimplementedError();

}

class RegistrationLoadingState {}
class RegistrationSuccessState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState{}
class RegistrationOpenPageState extends RegistrationState{}

