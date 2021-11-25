import 'package:flutter/material.dart';


import 'package:app/constants.dart';

class ErrorIndicator extends StatelessWidget {
  final String name;
  
  const ErrorIndicator({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      child: AlertDialog(
        backgroundColor: Colors.transparent.withOpacity(0.5),
        content: SingleChildScrollView(
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.red,),
              SizedBox(
                width: 10.0,
              ),
              Text(
                name,
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}