import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_event.dart';
import 'package:flutter_mindpost/ui/bloc/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is ForgotPasswordEvent) {
      try {
        LoginLoadingState();
      } catch(e) {
        yield LoginErrorInternetConnectionState();
      }
    }
  }

}