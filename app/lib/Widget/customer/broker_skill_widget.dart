import 'package:app/Widget/Broker-profile/custome_circular_step_progress.dart';
import 'package:app/Widget/Broker-profile/work-detail.dart';
import 'package:app/model/deals.dart';
import 'package:flutter/material.dart';

class BrokerSkills extends StatelessWidget {
  const BrokerSkills({
    Key? key,
    required this.deals,
  }) : super(key: key);

  final Deals deals;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          children: [
            WorkDetail(
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep:
                      deals.broker!.skills!.communicationSkill!.toInt()),
              label: 'Communication ',
            ),
            WorkDetail(
              circularStepProgressIndicator: CustomeCircularStepProgress(
                  currentStep: deals.broker!.skills!.brokingSkill!.toInt()),
              label: 'Broking',
            ),
          ],
        ),
      ),
    );
  }
}
