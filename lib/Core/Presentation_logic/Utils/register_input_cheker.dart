import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Register.dart';

class RegisterInputChecker {
  Either<Failure, String> passwordChecker(String password) {
    if (password != null) {
      if (password.length >= 6 && password.length < 255)
        return Right(password);
      else
        return Left(PasswordInputFailure());
    } else {
      return Left(Emptyfield());
    }
  }

  Either<Failure, String> usernameChecker(String username) {
    if (username != null) {
      if (username.length < 255)
        return Right(username);
      else
        return Left(UsernameInputFailure());
    } else {
      return Left(Emptyfield());
    }
  }

  Either<Failure, String> emailChecker(String email) {
    if (email != null) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (emailValid)
        return Right(email);
      else
        return Left(EmailInputFailure());
    } else {
      return Left(Emptyfield());
    }
  }

  Either<Failure, String> call(Paramsre params) {
    final responseU = usernameChecker(params.username);
    final responseP = passwordChecker(params.password);
    final responseE = emailChecker(params.email);
    if (params.password == params.passwordconfirmation) {
      if (responseU is Failure &&
          responseP is Failure &&
          responseE is Failure) {
        return Left(AllInputFailure());
      } else if (responseU is Failure && responseP is Failure) {
        return Left(DoubleFailureUP());
      } else if (responseE is Failure && responseP is Failure) {
        return Left(DoubleFailureEP());
      } else if (responseU is Failure && responseE is Failure) {
        return Left(DoubleFailureUE());
      } else if (responseP is Failure) {
        return Left(PasswordInputFailure());
      } else if (responseU is Failure) {
        return Left(UsernameInputFailure());
      } else if (responseE is Failure) {
        return Left(EmailInputFailure());
      } else {
        return Right("all good");
      }
    } else {
      return Left(EmailInputFailure());
    }
  }
}
