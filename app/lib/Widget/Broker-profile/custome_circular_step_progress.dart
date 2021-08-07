import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CustomeCircularStepProgress extends StatelessWidget {
  final int currentStep;
  CustomeCircularStepProgress({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    var circleHeight = MediaQuery.of(context).size.width / 6;
    var circleWidth = MediaQuery.of(context).size.width / 6;
    return CircularStepProgressIndicator(
      currentStep: currentStep,
      totalSteps: 100,
      startingAngle: 360,
      unselectedColor: Colors.white,
      selectedColor: Theme.of(context).primaryColor,
      child: Center(child: Text('$currentStep%')),
      height: circleHeight,
      width: circleWidth,
    );
  }
}
