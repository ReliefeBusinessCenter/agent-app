import 'package:app/Widget/agent/order_item.dart';
import 'package:flutter/material.dart';

class WorkDeals extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  WorkDeals({required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Trust Brokers'),
          backgroundColor: Theme.of(context).primaryColor,
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: Container(
              height: 5.0,
              width: 5.0,
              child: ImageIcon(
                AssetImage('assets/images/left-align.png'),
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: Center(
          child: Text("Deals List will come here"),
        ));
  }
}
