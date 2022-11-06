import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final String name;
  const LoadingIndicator({required this.name, Key? key}) : super(key: key);

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
              SpinKitCircle(color: primaryColor,),
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
