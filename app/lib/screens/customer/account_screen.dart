import 'package:flutter/material.dart';

import 'drawer.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(),
      drawer: CustomerDrawer(),
      body: Container(
        child: Center(child: Text("Account Screen")),
      ),
    );
  }
}
