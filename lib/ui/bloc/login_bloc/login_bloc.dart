import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_event.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginEmptyState());
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
      await FirestoreRepositoryImpl().signInWithGoogle();
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
        await FirestoreRepositoryImpl().signIn(email, password);
        yield LoginSuccessfulState();
      } catch(e){
        yield LoginInvalidState();
      }
    }
  }

}