import 'package:app/model/deals.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class DealsBrokerProfile extends StatelessWidget {
  final Deals deals;
  const DealsBrokerProfile({required this.deals, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Color is ${deals.color}");
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
                deals.customer!.user!.city!,
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
            LocaleKeys.product_label_text.tr(),
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
                  LocaleKeys.name_label_text.tr(),
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
                  LocaleKeys.model_label_text.tr(),
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
                  LocaleKeys.payment_option_label_text.tr(),
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
                  LocaleKeys.delivery_option_label_text.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(deals.deliveryOption!),
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
                  LocaleKeys.color_label_text.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Color(int.parse(deals.color!)),
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
