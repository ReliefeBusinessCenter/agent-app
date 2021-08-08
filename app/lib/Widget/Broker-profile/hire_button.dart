import 'package:app/model/broker.dart';
import 'package:app/screens/home_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'custome_button.dart';

class HireButton extends StatelessWidget {
  late final Broker broker;
  HireButton({required this.broker});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        child: CustomButton(
            brokerName: broker.name,
            label: 'Hire ${broker.name}',
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
            onTap: () {
              print("hire yared");
              // Navigator.pop(context);
            }),
      ),
    );
  }
}
