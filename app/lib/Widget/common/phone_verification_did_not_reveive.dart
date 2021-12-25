import 'package:flutter/material.dart';


class DidnotReceiveCode extends StatelessWidget {
  const DidnotReceiveCode({
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final Function() onPressed; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't receive the code? ",
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text( 
            
            "RESEND",
            style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}