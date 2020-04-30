import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llll/Features/Sign_in/Presentation/bloc/login_bloc.dart';
import 'package:llll/main.dart';

class RegisterErrorDisplayUsername extends StatefulWidget {
  const RegisterErrorDisplayUsername({
    Key key,
  }) : super(key: key);

  @override
  _RegisterErrorDisplayUsernameState createState() => _RegisterErrorDisplayUsernameState();
}

class _RegisterErrorDisplayUsernameState extends State<RegisterErrorDisplayUsername> {
  String username;
  String password;
  String email;
  String confirmPassword;
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
              padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: Column(
                children: <Widget>[
                  Container(
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
                ],
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Container(
                color: colorwhite,
                child: TextFormField(
                  onChanged: (value) {
                    password = value;
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Container(
                color: colorwhite,
                child: TextFormField(
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  obscureText: true,
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Container(
                color: colorwhite,
                child: TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.lock_outline),
                      labelStyle: TextStyle(fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: MaterialButton(
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
            ),
          ],
        ),
      ),
    );
  }

  void dispatchRegister() {
    BlocProvider.of<LoginBloc>(context)
        .dispatch(SignUp(confirmPassword: confirmPassword ,email: email, username: username, password: password));
  }
}
