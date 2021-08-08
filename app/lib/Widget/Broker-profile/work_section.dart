import 'package:app/model/broker.dart';
import 'package:flutter/material.dart';

import 'custome_circular_step_progress.dart';
import 'work-detail.dart';

class WorkSection extends StatelessWidget {
  final Broker broker;
  WorkSection({required this.broker});
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
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep: broker.completedWorks.toInt()),
              label: 'Completed \nworks',
            ),
            WorkDetail(
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep: broker.workInProgress.toInt()),
              label: 'Work In \n Progress',
            ),
            WorkDetail(
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep: broker.communicationSkill.toInt()),
              label: 'Communication \Skill',
            ),
            WorkDetail(
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep: broker.brokingSkill.toInt()),
              label: 'Broking\n Skill',
            ),
          ],
        ),
      ),
    );
  }
}
