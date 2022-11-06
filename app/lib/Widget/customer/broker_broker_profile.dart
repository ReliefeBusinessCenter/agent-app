import 'package:app/model/customer/customer.dart';
import 'package:flutter/material.dart';

class BrokerBrokerProfile extends StatelessWidget {
  final Customer broker;
  const BrokerBrokerProfile({required this.broker, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
          ),
          CircleAvatar(
            maxRadius: MediaQuery.of(context).size.width * 0.15,
            // minRadius: MediaQuery.of(context).size.width * 0.4,
            // backgroundImage:  NetworkImage(
            //     "${Ip.ip}/api/users/get/?fileName=${this.broker.user!.picture as String}"),
            backgroundImage: AssetImage("assets/images/16.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${broker.user!.fullName}",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor.withOpacity(0.95),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.place,
                size: 20.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Addis Ababa, Ethiopia",
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "Worker, AAiT",
            style: TextStyle(fontSize: 20.0),
          ),
          
        ],
      ),
    );
  }
}
