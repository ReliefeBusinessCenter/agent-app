import 'package:flutter/material.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.verified,
          color: Colors.blue,
          size: 20.0,
        ),
      ),
    );
  }
}
