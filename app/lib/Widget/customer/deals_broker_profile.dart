import 'package:app/Widget/customer/broker_skill_widget.dart';
import 'package:app/constants/constants.dart';
import 'package:app/model/deals.dart';
import 'package:flutter/material.dart';

class DealsBrokerProfile extends StatelessWidget {
  final Deals deals;
  const DealsBrokerProfile({required this.deals, Key? key}) : super(key: key);

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
              "${deals.customer!.user!.fullName}",
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
                deals.customer!.user!.address!,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            deals.customer!.user!.role!,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          Text(
            "Product",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          // DealsProduct(
          //   deals: deals,
          // )

          DealsProduct(deals: deals)
        ],
      ),
    );
  }
}

class DealsProduct extends StatelessWidget {
  const DealsProduct({
    Key? key,
    required this.deals,
  }) : super(key: key);

  final Deals deals;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  deals.productName!,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Model ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(deals.productModel!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Option ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(deals.paymentOption!),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Option",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(deals.deliveryOption!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
