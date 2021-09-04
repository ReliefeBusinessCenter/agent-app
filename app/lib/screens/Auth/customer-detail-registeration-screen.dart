import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({Key? key}) : super(key: key);

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
