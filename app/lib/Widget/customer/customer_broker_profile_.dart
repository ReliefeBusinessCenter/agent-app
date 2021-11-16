import 'package:app/Widget/Broker-profile/custome_circular_step_progress.dart';
import 'package:app/Widget/Broker-profile/work-detail.dart';
import 'package:app/constants.dart';
import 'package:app/model/broker/broker.dart';
import 'package:flutter/material.dart';

class BrokerProfile extends StatelessWidget {
  final Broker broker;
  const BrokerProfile({required this.broker, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
          ),
          CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width * 0.15,
            // minRadius: MediaQuery.of(context).size.width * 0.4,
            // backgroundImage:  NetworkImage(
            //     "${Ip.ip}/api/users/get/?fileName=${this.broker.user!.picture as String}"),
            backgroundImage: AssetImage("assets/images/16.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${broker.user!.fullName}",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor.withOpacity(0.95),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.place,
                size: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Addis Ababa, Ethiopia",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "Worker, AAiT",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            height: size.height * 0.3,
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
                        text: "Works",
                      ),
                      Tab(text: "Skills"),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Center(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
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
                              Text("progress")
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                broker.skills!.workDone.toString(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w500),
                              ),
                              Text("completed")
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
                                      currentStep: broker
                                          .skills!.communicationSkill!
                                          .toInt()),
                              label: 'Communication ',
                            ),
                            WorkDetail(
                              circularStepProgressIndicator:
                                  CustomeCircularStepProgress(
                                      currentStep:
                                          broker.skills!.brokingSkill!.toInt()),
                              label: 'Broking',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
