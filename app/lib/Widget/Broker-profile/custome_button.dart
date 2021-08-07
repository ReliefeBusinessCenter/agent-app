import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;

  const CustomButton(
      {required this.onTap,
      required this.backgroundColor,
      required this.foregroundColor,
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
        onTap: () {
          Navigator.pop(context);
        });
  }
}
