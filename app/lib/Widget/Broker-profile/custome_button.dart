import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;
  final String brokerName;

  const CustomButton(
      {required this.onTap,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.brokerName,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(label,
                style: TextStyle(
                  color: foregroundColor,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        onTap: this.onTap);
  }
}
