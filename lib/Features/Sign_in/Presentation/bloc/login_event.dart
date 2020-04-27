part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class Signin extends LoginEvent {
  final String username;
  final String password;

  Signin({@required this.username, @required this.password})
      : super([username, password]);
}
class SignUp extends LoginEvent {
  final String username;
  final String password;
  final String confirmPassword;
  final String email;

  SignUp({@required this.confirmPassword,@required this.email, @required this.username, @required this.password})
      : super([username, password,confirmPassword,email]);
}
class GotoSignup extends LoginEvent{}



