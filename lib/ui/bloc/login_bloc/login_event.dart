class LoginEvent{}

class ForgotPasswordEvent extends LoginEvent {}
class LoginGoogleEvent extends LoginEvent {}
class LoginFacebookEvent extends LoginEvent {}
class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);

}

class LogoutEvent extends LoginEvent {}