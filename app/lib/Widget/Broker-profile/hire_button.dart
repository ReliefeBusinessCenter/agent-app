import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'custome_button.dart';

class HireButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        child: CustomButton(
            label: 'Hire Yared Solomon',
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
