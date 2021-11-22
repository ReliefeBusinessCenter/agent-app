import 'package:app/model/broker/broker.dart';
import 'package:flutter/material.dart';

import 'custome_circular_step_progress.dart';
import 'work-detail.dart';

class WorkSection extends StatelessWidget {
  final Broker broker;
  WorkSection({required this.broker});
  @override
  Widget build(BuildContext context) {
    print("Broker Skills: ${broker.skills}");
    print("Broker Category: ${broker.category!.catigoryName}");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 120,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // WorkDetail(
            //   circularStepProgressIndicator: CustomeCircularStepProgress(
            //       currentStep: broker.skills!.workDone!.toInt()),
            //   label: 'Completed \nworks',
            // ),
            // WorkDetail(
            //   circularStepProgressIndicator: CustomeCircularStepProgress(
            //       currentStep: broker.skills!.workInProgress!.toInt()),
            //   label: 'Work In \n Progress',
            // ),
            // WorkDetail(
            //   circularStepProgressIndicator: CustomeCircularStepProgress(
            //       currentStep: broker.skills!.communicationSkill!.toInt()),
            //   label: 'Communication \Skill',
            // ),
            // WorkDetail(
            //   circularStepProgressIndicator: CustomeCircularStepProgress(
            //       currentStep: broker.skills!.brokingSkill!.toInt()),
            //   label: 'Broking\n Skill',
            // ),
          ],
        ),
      ),
    );
  }
}
