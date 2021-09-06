import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatelessWidget {
  static const routeName = '/customer-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Detail Screen"),
      ),
      body: Container(
        child: Text("Customer Detail Screen"),
      ),
    );
  }
}
