import 'package:app/Widget/Broker-profile/custome_circular_step_progress.dart';
import 'package:app/Widget/Broker-profile/work-detail.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Service/fireabse_service.dart';

class BrokerProfile extends StatelessWidget {
  final Broker broker;
    String? imageUrl;
   BrokerProfile({required this.broker, Key? key}) : super(key: key);
  

   Future<String> getImage(String? imageName) async {
    String imageUrl = await FirebaseService.loadImage(
        (imageName.toString().substring(8)), 'brokers/');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

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
          FutureBuilder(
                      future: getImage(broker.user!.picture),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Text('none');
                          case ConnectionState.waiting:
                            return Center(
                                child: Column(
                              children: [
                                Text("Future builder"),
                                Center(
                                    child: SpinKitCircle(
                                  color: primaryColor,
                                )),
                              ],
                            ));
                          case ConnectionState.active:
                            return Text('');
                          case ConnectionState.done:
                            imageUrl = snapshot.data;
                            return CachedNetworkImage(
                              fit: BoxFit.fill,
                              height: 120.0,
                              width: 120.0,
                              imageUrl: snapshot.data,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 120.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                  child: SpinKitCircle(
                                color: primaryColor,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
                        }
                      }),
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
                        text: LocaleKeys.work_tab_label_text.tr(),
                      ),
                      Tab(text: LocaleKeys.skiils_label_text.tr(),),
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
                                      currentStep: broker
                                          .skills!.communicationSkill!
                                          .toInt()),
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
          )
        ],
      ),
    );
  }
}
