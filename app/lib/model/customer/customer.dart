import 'package:app/model/broker/user.dart';

import '../deals.dart';
import '../delivery.dart';
import '../review.dart';


class Customer {
  int? customerId;
  List<Reviews>? reviews;
  List<Deals>? deals;
  List<Delivery>? delivery;
  // List<Null>? sales;
  User? user;

  Customer(
      {this.customerId,
      this.reviews,
      this.deals,
      this.delivery,
      // this.sales,
      this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(new Deals.fromJson(v));
      });
    }
    if (json['delivery'] != null) {
      delivery = <Delivery>[];
      json['delivery'].forEach((v) {
        delivery!.add(new Delivery.fromJson(v));
      });
    }
    // if (json['sales'] != null) {
    //   sales = <Null>[];
    //   json['sales'].forEach((v) {
    //     sales!.add(new Null.fromJson(v));
    //   });
    // }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery!.map((v) => v.toJson()).toList();
    }
    // if (this.sales != null) {
    //   data['sales'] = this.sales.map((v) => v.toJson()).toList();
    // }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
