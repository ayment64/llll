import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';

class InputChecker {
  Either<Failure, String> passwordChecker(String password) {
    if (password.length >= 6 && password.length < 255)
      return Right(password);
    else
      return Left(PasswordInputFailure());
  }

  Either<Failure, String> usernameChecker(String username) {
    if (username.length < 255)
      return Right(username);
    else
      return Left(UsernameInputFailure());
  }

  Either<Failure, String> call(Params params) {
    final responseU = usernameChecker(params.username);
    final responseP = passwordChecker(params.password);
    if (responseU is Failure && responseP is Failure) {
      return Left(DoubleFailure());
    } else if (responseU is Failure) {
      return Left(UsernameInputFailure());
    } else if (responseP is Failure) {
      return Left(PasswordInputFailure());
    } else {
      return Right("all good");
    }
  }
}

