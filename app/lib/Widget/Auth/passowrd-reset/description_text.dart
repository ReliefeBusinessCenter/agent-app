import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        "Provide your account email for which you want to reset your passowrd",
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: Colors.grey.withOpacity(0.7)),
      ),
    );
  }
}
