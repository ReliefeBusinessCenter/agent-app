import 'package:app/constants/constants.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'custome_circular_step_progress.dart';
import 'work-detail.dart';

class WorkSection extends StatelessWidget {
  final Broker broker;
  WorkSection({required this.broker});
  @override
  Widget build(BuildContext context) {
    print("Broker Data skills is ${broker.skills}");
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: lightColor,
          appBar: AppBar(
            backgroundColor: lightColor,
            elevation: 0.0,
            toolbarHeight: 10.0,
            bottom: TabBar(
              indicatorColor: primaryColor,
              indicatorWeight: 4.0,
              labelColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.only(top: 10.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: LocaleKeys.work_tab_label_text.tr(),
                ),
                Tab(
                  text: LocaleKeys.skiils_label_text.tr(),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          broker.skills!.workInProgress.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                        Text(LocaleKeys.progress_label_text.tr())
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          broker.skills!.workDone.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w500),
                        ),
                        Text(LocaleKeys.completed_label_text.tr())
                      ],
                    ),
                  ],
                ),
              )),
              Center(
                child: Container(
                  child: Row(
                    children: [
                      WorkDetail(
                        circularStepProgressIndicator:
                            CustomeCircularStepProgress(
                                currentStep:
                                    broker.skills!.communicationSkill!.toInt()),
                        label: LocaleKeys.communication_label_text.tr(),
                      ),
                      WorkDetail(
                        circularStepProgressIndicator:
                            CustomeCircularStepProgress(
                                currentStep:
                                    broker.skills!.brokingSkill!.toInt()),
                        label: LocaleKeys.broking_label_text.tr(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
