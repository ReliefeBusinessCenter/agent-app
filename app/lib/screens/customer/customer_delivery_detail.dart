import 'package:app/Widget/Broker-profile/Broker-background-image.dart';
import 'package:app/Widget/customer/broker_profile.dart';
import 'package:app/Widget/customer/delivery/mark_as_done_button.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/delivery.dart';
import 'package:flutter/material.dart';

class CustomerDeliveryDetails extends StatelessWidget {
  final Delivery delivery;
  CustomerDeliveryDetails({required this.delivery});
  static const routeName = "/customer-delivery-details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Delivery Detail',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BrokerImage(
              broker: this.delivery.broker as Broker,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              // color: Colors.red,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Location : ",
                      style: TextStyle(
                        fontSize: 19,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Delivery Status : ${delivery.deliveryStatus}",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            MarkAsDone(
              onPressed: () {
                print("mark as done button have been clicked");
              },
            ),
          ],
        ));
  }
}
