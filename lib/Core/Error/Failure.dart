import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super(properties);
}

class ServerFailure extends Failure {}

class LoginFailure extends Failure {}

class CacheFailure extends Failure {}

class PasswordInputFailure extends Failure {}

class UsernameInputFailure extends Failure {}

class EmailInputFailure extends Failure {}

class AllInputFailure extends Failure {}

class Emptyfield extends Failure {}

class DoubleFailure extends Failure {}

class DoubleFailureUP extends Failure {}

class DoubleFailureUE extends Failure {}

class DoubleFailureEP extends Failure {}

class PassswordConfiramtionError extends Failure {}
