import 'package:flutter/material.dart';

class BrokerChat extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  BrokerChat({required this.scaffoldKey});

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
        child: Text("Broker Chat Room"),
      ),
    );
  }
}
