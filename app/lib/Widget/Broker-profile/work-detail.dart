import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'custome_circular_step_progress.dart';

class WorkDetail extends StatelessWidget {
  CustomeCircularStepProgress circularStepProgressIndicator;
  String label;

  WorkDetail(
      {required this.circularStepProgressIndicator, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          circularStepProgressIndicator,
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
