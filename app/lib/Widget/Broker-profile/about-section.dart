import 'package:app/model/broker.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final Broker broker;
  AboutSection({required this.broker});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'About',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${broker.about}"),
          ),
        ],
      ),
    );
  }
}
