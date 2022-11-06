// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'drawer.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Center(child: Text("Account Screen")),
      ),
    );
  }
}
