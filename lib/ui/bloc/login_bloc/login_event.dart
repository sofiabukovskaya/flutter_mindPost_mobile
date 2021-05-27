class LoginEvent{}

class ForgotPasswordEvent extends LoginEvent {}
class LoginGoogleEvent extends LoginEvent {}
class LoginFacebookEvent extends LoginEvent {}
class SignInEvent extends LoginEvent {
  SignInEvent(this.email, this.password);
  final String email;
  final String password;
}

class LogoutEvent extends LoginEvent {}

class SessionEvent extends LoginEvent {}
