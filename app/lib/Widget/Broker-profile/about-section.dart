import 'package:app/model/broker/broker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  final Broker broker;
  AboutSection({required this.broker});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                child: Text("About page"),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: IconButton(
              icon: Icon(
                Icons.call,
                color: Colors.blue,
                size: 30.0,
              ),
              onPressed: () async {
                if (await canLaunch('tel:+${broker.user!.phone}')) {
                 await launch('tel:+${broker.user!.phone}');
                } else {
                  throw "Could not launch ";
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
