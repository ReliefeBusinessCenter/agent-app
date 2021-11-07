import 'package:app/constants/customer-page/categories.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';

// import 'package:app/model/category.dart';
import 'package:flutter/material.dart';

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
                  child: Text("           Broker Information",
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
                  child: Text("Broker yared solomon",
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
                      child: Text("Broker Category: ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Communication Skill: ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Broking Skill: ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Work In Progress: ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Completed Works: ",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
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
