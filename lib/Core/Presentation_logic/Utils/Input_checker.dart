

class InputChecker {
bool passwordChecker(String password) {
    print("password length" + password.length.toString());
    if (password.length >= 6 && password.length < 255&&password!=null)
   return true;
   else return false;
     
  }

  bool usernameChecker(String username) {
    if (username.length < 255 && username!=null)
    return true;
    else return false;
  }

}

