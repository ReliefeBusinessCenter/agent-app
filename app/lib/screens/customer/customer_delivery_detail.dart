import 'package:app/Widget/Broker-profile/Broker-background-image.dart';
import 'package:app/Widget/customer/broker_profile.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Delivery Detail',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BrokerImage(
              broker: this.delivery.broker as Broker,
            ),
          ],
        ));
  }
}
