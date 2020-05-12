import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/ProfileEditingPage.dart';
import 'package:llll/Features/home/Presentation/Pages/Home_page.dart';



class ToHome extends MaterialPageRoute<Null> {
  ToHome(String token)
      : super(builder: (BuildContext ctx) {
          return new HomePage(token: token,);
        });
}

class ToProfile extends MaterialPageRoute<Null> {
  ToProfile(String token)
      : super(builder: (BuildContext ctx) {
          return new ProfileEditingPage(token: token,fromHome: true,);
        });
}