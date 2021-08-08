import 'package:flutter/material.dart';

class CustomeList extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon icon;
  final VoidCallback onPressed;

  CustomeList(
      {required this.title,
      required this.subTitle,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.icon,
      title: Text(
        this.title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        this.subTitle,
        style: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.w300,
          // fontSize: 15
        ),
      ),
      onTap: this.onPressed,
    );
  }
}
