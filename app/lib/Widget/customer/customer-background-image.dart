import 'package:app/constants/customer-page/categories.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/customer/customer.dart';

// import 'package:app/model/category.dart';
import 'package:flutter/material.dart';

class CustomerBackgroundImage extends StatelessWidget {
  final Customer customer;
  CustomerBackgroundImage({required this.customer});
  @override
  Widget build(BuildContext context) {
    // Category category =
    //     [].firstWhere((element) => element.id == broker.category!.categoryId);
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Card(
              elevation: 1,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.03,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width * 0.15,
                  // minRadius: MediaQuery.of(context).size.width * 0.4,
                  backgroundImage: NetworkImage(
                      "${Ip.ip}/api/users/get/?fileName=${this.customer.user!.picture as String}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(customer.user!.fullName as String,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor.withOpacity(0.95),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text("${customer.category!.catigoryName} broker",
                //           style: TextStyle(
                //             fontSize: 15,
                //             color:
                //                 Theme.of(context).primaryColor.withOpacity(0.5),
                //             fontWeight: FontWeight.bold,
                //           )),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
