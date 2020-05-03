import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:llll/main.dart';

class RegisterEmptyDisplay extends StatefulWidget {
  final String message;
  final String username;
  final String password;
  final String email;
  final String confirmPassword;
  final String firstname;
  final String lastname;
  final bool usernameErrorVisibility;
  final bool passwordErrorVisibility;
  final bool emailErrorVisibility;
  final bool confirmPasswordErrorVisibility;
  final bool serverErrorVisibility;
  final bool firstnameErrorVisibility;
  final bool lastnameErrorVisibility;

  const RegisterEmptyDisplay({
    Key key,
    @required this.username,
    @required this.password,
    @required this.email,
    @required this.confirmPassword,
    @required this.usernameErrorVisibility,
    @required this.passwordErrorVisibility,
    @required this.emailErrorVisibility,
    @required this.confirmPasswordErrorVisibility,
    @required this.serverErrorVisibility,
    @required this.firstname,
    @required this.lastname,
    @required this.firstnameErrorVisibility,
    @required this.lastnameErrorVisibility,
    @required this.message,
  }) : super(key: key);

  @override
  _RegisterEmptyDisplayState createState() => _RegisterEmptyDisplayState();
}

class _RegisterEmptyDisplayState extends State<RegisterEmptyDisplay> {
  String username;
  String password;
  String email;
  String confirmPassword;
  String firstname;
  String lastname;
  String message;
  bool usernameErrorVisibility;
  bool passwordErrorVisibility;
  bool emailErrorVisibility;
  bool confirmPasswordErrorVisibility;
  bool serverErrorVisibility;
  bool firstnameErrorVisibility;
  bool lastnameErrorVisibility;

  @override
  Widget build(BuildContext context) {
    message = widget.message;
    firstnameErrorVisibility = widget.firstnameErrorVisibility;
    lastnameErrorVisibility = widget.firstnameErrorVisibility;
    firstname = widget.firstname;
    lastname = widget.lastname;
    username = widget.username;
    password = widget.password;
    email = widget.email;
    confirmPassword = widget.confirmPassword;
    usernameErrorVisibility = widget.usernameErrorVisibility;
    passwordErrorVisibility = widget.passwordErrorVisibility;
    emailErrorVisibility = widget.emailErrorVisibility;
    confirmPasswordErrorVisibility = widget.confirmPasswordErrorVisibility;
    serverErrorVisibility = widget.serverErrorVisibility;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 220),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x77333333),
          blurRadius: 0.5,
          spreadRadius: 0.0,
          offset: Offset(1.0, -1.0), // shadow direction: bottom right
        )
      ], borderRadius: BorderRadius.circular(20), color: colorwhite),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Container(
                    color: colorwhite,
                    child: TextFormField(
                      initialValue: firstname,
                      onChanged: (value) {
                        firstname = value;
                      },
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First name',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Center(
                        child: Text(
                      USERNAME_INPUT_FAILURE,
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                  visible: firstnameErrorVisibility,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    color: colorwhite,
                    child: TextFormField(
                      initialValue: lastname,
                      onChanged: (value) {
                        lastname = value;
                      },
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last name',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Center(
                        child: Text(
                      USERNAME_INPUT_FAILURE,
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                  visible: lastnameErrorVisibility,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    color: colorwhite,
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Center(
                        child: Text(
                      PASSWORD_INPUT_FAILURE,
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                  visible: passwordErrorVisibility,
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    color: colorwhite,
                    child: TextFormField(
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Center(
                        child: Text(
                      PASSWORD_CONFIRMATION_INPUT_FAILURE,
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                  visible: confirmPasswordErrorVisibility,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Column(
                children: <Widget>[
                  Container(
                    color: colorwhite,
                    child: TextFormField(
                      initialValue: email,
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                  Center(
                    child: Visibility(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Center(
                            child: Text(
                          EMAIL_INPUT_FAILURE,
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                      visible: emailErrorVisibility,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Center(
                        child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        message,
                        style: TextStyle(color: Colors.red),
                      ),
                    )),
                  ),
                  visible: serverErrorVisibility,
                ),
                MaterialButton(
                  onPressed: () {
                    dispatchRegister();
                  }, //since this is only a UI app
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: colorlightblue,
                  elevation: 0,
                  minWidth: 400,
                  height: 50,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void dispatchRegister() {
    print(email);
    BlocProvider.of<LoginBloc>(context).dispatch(SignUp(
      confirmPassword: confirmPassword,
      email: email,
      username: email,
      password: password,
      firstname: firstname,
      lastname: lastname,
    ));
  }
}
