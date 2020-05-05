import 'package:flutter/material.dart';
import 'package:llll/Core/Routing/Routing.dart';
import 'package:llll/main.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingWidgetDisplay extends StatelessWidget {
  const LoadingWidgetDisplay({
    Key key,
  }) : super(key: key);

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
      child: Container(
        color: Colors.white,
        child: Center(
          child: Loading(
              indicator: BallPulseIndicator(), size: 80.0, color: colorlightblue),
        ),
      ),
    );
  }
}
