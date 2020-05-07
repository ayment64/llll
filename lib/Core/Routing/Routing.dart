import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Pages/ProfileEditingPage.dart';



class GoToProfileEditing extends MaterialPageRoute<Null> {
  GoToProfileEditing(String token)
      : super(builder: (BuildContext ctx) {
          return new ProfileEditingPage(token: token,);
        });
}
