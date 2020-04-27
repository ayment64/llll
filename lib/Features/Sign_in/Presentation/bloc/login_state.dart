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
  Error({@required this.username,@required  this.password,@required  this.confirmPassword,@required this.message}) {
    print(message);
    
  }
}
