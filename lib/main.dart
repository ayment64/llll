import 'package:flutter/material.dart';

import 'Features/Sign_in/Presentation/Pages/signin.dart';
import 'Injection_container.dart' as di;

void main() async {
  di.init();
  runApp(MyApp());
}

const colorlightblue = Color(0xFF29ABE2);
const colordarkblue = Color(0xFF0c5677);
const colorwhite = Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          primaryColor: colorlightblue,
          accentColor: colordarkblue,
          textSelectionHandleColor: colorwhite,
          primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white))),
      home: SigninPage(),
    );
  }
}
