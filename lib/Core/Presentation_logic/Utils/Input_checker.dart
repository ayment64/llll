import 'package:dartz/dartz.dart';
import 'package:llll/Core/Error/Failure.dart';
import 'package:llll/Features/Sign_in/Domain/UseCaces/Login.dart';

class InputChecker {
bool passwordChecker(String password) {
    print("password length" + password.length.toString());
    if (password.length >= 6 && password.length < 255)
   return true;
   else return false;
     
  }

  bool usernameChecker(String username) {
    if (username.length < 255)
    return true;
    else return false;
  }

}

