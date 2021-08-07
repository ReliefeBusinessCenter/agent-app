import 'package:flutter/material.dart';

import 'custome_circular_step_progress.dart';
import 'work-detail.dart';

class WorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 120,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WorkDetail(
              circularStepProgressIndicator:
                  CustomeCircularStepProgress(currentStep: 20),
              label: 'Completed \nworks',
            ),
            WorkDetail(
              circularStepProgressIndicator:
                  CustomeCircularStepProgress(currentStep: 40),
              label: 'Work In \n Progress',
            ),
            WorkDetail(
              circularStepProgressIndicator:
                  CustomeCircularStepProgress(currentStep: 60),
              label: 'Communication \Skill',
            ),
            WorkDetail(
              circularStepProgressIndicator:
                  CustomeCircularStepProgress(currentStep: 80),
              label: 'Broking\n Skill',
            ),
          ],
        ),
      ),
    );
  }
}
