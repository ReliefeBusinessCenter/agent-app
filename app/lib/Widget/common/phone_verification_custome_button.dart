import 'package:flutter/material.dart';


class CustomeButton extends StatelessWidget {
  const CustomeButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.lightBlue,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}