import 'package:flutter/material.dart';

class BrokerDetailScreen extends StatelessWidget {
  const BrokerDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Broker Detail Screen")),
      body: Container(
        child:Text("Broker detail screen")
      ),
    );
  }
}