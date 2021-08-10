import 'package:flutter/material.dart';

class BrokerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Text("Orders History"),
      ),
    );
  }
}
