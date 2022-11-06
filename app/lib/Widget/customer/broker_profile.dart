import 'package:app/model/broker/broker.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class BrokerImage extends StatelessWidget {
  final Broker broker;
  BrokerImage({required this.broker});
  @override
  Widget build(BuildContext context) {
    // Category category =
    //     [].firstWhere((element) => element.id == broker.category!.categoryId);
    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
      child: Stack(
        children: [
          // Text("Broker Information",
          //     style: TextStyle(
          //       fontSize: 15,
          //       color: Theme.of(context).primaryColor.withOpacity(0.5),
          //       fontWeight: FontWeight.bold,
          //     )),
          Positioned(
            top: 0,
            child: Card(
              elevation: 1,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.87,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.03,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(LocaleKeys.broker_information_label_text.tr(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor.withOpacity(0.95),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width * 0.15,
                  // minRadius: MediaQuery.of(context).size.width * 0.4,
                  // backgroundImage:  NetworkImage(
                  //     "${Ip.ip}/api/users/get/?fileName=${this.broker.user!.picture as String}"),
                  backgroundImage: AssetImage("assets/images/16.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${broker.user!.fullName}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor.withOpacity(0.95),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${LocaleKeys.broker_category_label_text.tr()}  ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${LocaleKeys.communicative_skills_label_text.tr()}:  ${broker.skills!.communicationSkill}",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${LocaleKeys.broking_skills_label_text.tr()}:  ${broker.skills!.brokingSkill!}",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "${LocaleKeys.Work_in_progress_label_text.tr()}:  ${broker.skills!.workInProgress!}",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("${LocaleKeys.work_done_label_text.tr()}: ${broker.skills!.workDone!}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
