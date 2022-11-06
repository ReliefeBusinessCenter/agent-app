import 'package:app/Widget/common/user_profile_contact.dart';
import 'package:app/model/broker/user.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  final User broker;
  const ContactDetailPage({
    Key? key,
    required this.broker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   child: Text(
          //     'Contact Details',
          //     style: TextStyle(color: Colors.grey.shade900, fontSize: 18.0),
          //   ),
          // ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
                UserPrefileContactDetail(
                  info: broker.email!,
                  iconData: Icons.email_outlined,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
                UserPrefileContactDetail(
                  info: broker.phone!,
                  iconData: Icons.phone_outlined,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.4,
                ),
                UserPrefileContactDetail(
                  info: ' Addis Ababa',
                  iconData: Icons.location_city,
                ),
                Divider(color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
