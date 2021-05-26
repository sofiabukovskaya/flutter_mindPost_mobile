import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_event.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({ @required FirestoreRepository firestoreRepository}) : super(LoginEmptyState());

  final FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is ForgotPasswordEvent) {
      yield LoginLoadingState();
      try {
        yield  LoginForgotPasswordState();
      } catch(e) {
        yield LoginErrorInternetConnectionState();
      }
    }  if(event is LoginGoogleEvent) {
      yield LoginLoadingState();
      try {
        yield LoginSuccessfulState();
      } catch(e) {
        yield LoginErrorInternetConnectionState();
      }
    }  if( event is LoginFacebookEvent) {
      yield LoginLoadingState();
      try {
        yield LoginSuccessfulState();
      } catch(e) {
        yield LoginErrorInternetConnectionState();
      }
    }  if(event is SignInEvent) {
      yield LoginLoadingState();
      try {
        final String email = event.email;
        final String password = event.password;
        await firestoreRepository.signIn(email, password);
        yield LoginSuccessfulState();
      } catch(e){
        yield LoginInvalidState();
      }
    }
  }

}