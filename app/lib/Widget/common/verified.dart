import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Center(
        child: Icon(
          Icons.check,
          color: lightColor,
          size: 15.0,
        ),
      ),
    );
  }
}
