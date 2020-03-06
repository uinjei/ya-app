import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';

class YaLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Loading(
            indicator: BallScaleIndicator(), color: Colors.lightBlue),
      ),
    );
  }
}
