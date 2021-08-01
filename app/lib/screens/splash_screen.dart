import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  late final String title;

  SplashScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
