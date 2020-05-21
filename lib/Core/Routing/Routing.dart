import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/ProfileEditingPage.dart';
import 'package:llll/Features/Sign_in/Presentation/Pages/signin.dart';
import 'package:llll/Features/home/Presentation/Pages/Home_page.dart';
import 'package:llll/Features/maps/Presentation/Pages/maps_page.dart';




class ToHome extends MaterialPageRoute<Null> {
  ToHome(String token)
      : super(builder: (BuildContext ctx) {
          return new HomePage(token: token,);
        });
}
class ToCategories extends MaterialPageRoute<Null> {
  ToCategories(String token)
      : super(builder: (BuildContext ctx) {
          return new HomePage(token: token,from:'cat');
        });
}
class ToMaps extends MaterialPageRoute<Null> {
  ToMaps(String token)
      : super(builder: (BuildContext ctx) {
          return new MapsPage(token: token,);
        });
}
class ToProfile extends MaterialPageRoute<Null> {
  ToProfile(String token)
      : super(builder: (BuildContext ctx) {
          return new ProfileEditingPage(token: token,fromHome: true,);
        });
}
//SigninPage
class ToLogin extends MaterialPageRoute<Null> {
  ToLogin()
      : super(builder: (BuildContext ctx) {
          return new SigninPage();
        });
}