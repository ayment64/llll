import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:llll/main.dart';

class LoginEmptyDisplay extends StatefulWidget {
  const LoginEmptyDisplay({
    Key key,
  }) : super(key: key);

  @override
  _LoginEmptyDisplayState createState() => _LoginEmptyDisplayState();
}

class _LoginEmptyDisplayState extends State<LoginEmptyDisplay> {
  String username;
  String password;
  bool passwordChecker = false;
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                color: colorwhite,
                child: TextFormField(
                  onChanged: (value) {
                    username = value;
                  },
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_outline),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
            ),
            Container(
              color: colorwhite,
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                  if (password.length < 6)
                    passwordChecker = true;
                  else
                    passwordChecker = false;
                },
                obscureText: true,
                style:
                    TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    labelStyle: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: MaterialButton(
                onPressed: () {
                  if (passwordChecker == false) dispatchLogin();
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'SFUIDisplay',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Color((0xFF0c5677)),
                elevation: 0,
                minWidth: 400,
                height: 50,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    TextSpan(
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => dispatchgotoRegister(),
                        text: "sign up",
                        style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Color((0xff184e85)),
                          fontSize: 15,
                        ))
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void dispatchLogin() {
    BlocProvider.of<LoginBloc>(context)
        .dispatch(Signin(username: username, password: password));
  }

  void dispatchgotoRegister() {
    BlocProvider.of<LoginBloc>(context).dispatch(GotoSignup());
  }
}
