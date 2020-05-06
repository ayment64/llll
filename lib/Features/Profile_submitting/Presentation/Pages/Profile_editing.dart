import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Widgets/Profile_Page.dart';
import 'package:llll/main.dart';

class ProfileEditing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorlightblue,
      child: Stack(
        children: <Widget>[
                ProfilePage(),
        ],
      ),
    );
  }
}
