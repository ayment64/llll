part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends LoginState {}

class Loading extends LoginState {}

class EmptySignUpDisplay extends LoginState {}

class Loaded extends LoginState {
  final String token;
  Loaded({@required this.token}) : super([token]);
}

class Error extends LoginState {
  final String message;
  final String username;
  final String password;
  final String confirmPassword;
  final String email;

  Error(
      {@required this.email,
      @required this.username,
      @required this.password,
      @required this.confirmPassword,
      @required this.message});
}

class SignUpError extends LoginState {
  final String message;
  final String firstname;
  final String lastname;
  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  final bool usernameErrorVisibility;
  final bool passwordErrorVisibility;
  final bool emailErrorVisibility;
  final bool confirmPasswordErrorVisibility;
  final bool serverErrorVisibility;
  final bool firstnameErrorVisibility;
  final bool lastnameErrorVisibility;
  SignUpError(
      {@required this.firstnameErrorVisibility,
      @required this.lastnameErrorVisibility,
      @required this.firstname,
      @required this.lastname,
      @required this.serverErrorVisibility,
      @required this.usernameErrorVisibility,
      @required this.passwordErrorVisibility,
      @required this.emailErrorVisibility,
      @required this.confirmPasswordErrorVisibility,
      @required this.email,
      @required this.username,
      @required this.password,
      @required this.confirmPassword,
      @required this.message});
}
