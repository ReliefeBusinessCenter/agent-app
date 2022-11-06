import 'package:flutter/material.dart';

class UserPrefileContactDetail extends StatelessWidget {
  UserPrefileContactDetail({
    Key? key,
    required this.info,
    required this.iconData,
  }) : super(key: key);

  final String info;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25.0,
            color: Colors.black.withOpacity(0.5),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
