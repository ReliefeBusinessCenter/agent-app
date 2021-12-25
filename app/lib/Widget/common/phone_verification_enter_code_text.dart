import 'package:flutter/material.dart';


class EnterCodeText extends StatelessWidget {
  const EnterCodeText({
    Key? key,
    required this.phone,
  }) : super(key: key);

 
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: RichText(
        text: TextSpan(
            text: "Enter the code sent to ",
            children: [
              TextSpan(
                  text: phone,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ],
            style: const TextStyle(color: Colors.black54, fontSize: 15)),
        textAlign: TextAlign.center,
      ),
    );
  }
}