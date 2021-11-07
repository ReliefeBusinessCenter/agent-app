import 'package:app/model/deals.dart';
import 'package:flutter/material.dart';

class CustomerDealsDetail extends StatelessWidget {
  final Deals deals;
  CustomerDealsDetail({required this.deals});
  static const routeName = "/customer-deals-details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text("Customer deals detail page")));
  }
}
