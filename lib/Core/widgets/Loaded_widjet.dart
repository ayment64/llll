import 'package:flutter/material.dart';
import 'package:llll/main.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LodaedWidgetDisplay extends StatelessWidget {
  const LodaedWidgetDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-450,
      child: Center(
        child: Loading(
            indicator: BallPulseIndicator(),
            size: 80.0,
            color: Colors.lightGreen),
      ),
    );
  }
}
