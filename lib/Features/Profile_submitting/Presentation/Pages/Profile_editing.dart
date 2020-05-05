import 'package:flutter/material.dart';
import 'package:llll/Features/Profile_submitting/Presentation/Widgets/Company_info.dart';
import 'package:llll/main.dart';

class ProfileEditing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorlightblue,
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  "Please enter your company info",
                  style: TextStyle(
                      color: colorwhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      textBaseline: TextBaseline.ideographic),
                ),
              ),
            ),
          ),
          CompanyInfo(),
        ],
      ),
    );
  }
}
