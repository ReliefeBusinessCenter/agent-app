import 'package:app/screens/broker/broker_drawer.dart';
import 'package:app/screens/drawer.dart';
import 'package:flutter/material.dart';

class SavingAndLoan extends StatelessWidget {
  static const routeName = '/saving-loan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(),
      drawer: BrokerDrawer(),
      body: Container(
        child: Center(child: Text("Saving and Loans")),
      ),
    );
  }
}
