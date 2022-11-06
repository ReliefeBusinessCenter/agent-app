import 'package:app/model/broker/broker.dart';
import 'package:app/model/customer/customer.dart';

class Delivery {
  int? deliveryId;
  String? deliveryStatus;
  String? location;
  int? brokerId;
  Broker? broker;
  int? customerId;
  Customer? customer;

  Delivery(
      {this.deliveryId,
      this.deliveryStatus,
      this.location,
      this.brokerId,
      this.broker,
      this.customerId,
      this.customer});

  Delivery.fromJson(Map<String, dynamic> json) {
    deliveryId = json['deliveryId'];
    deliveryStatus = json['deliveryStatus'];
    location = json['location'];
    brokerId = json['brokerId'];
    broker =
        json['broker'] != null ? new Broker.fromJson(json['broker']) : null;
    customerId = json['customerId'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryId'] = this.deliveryId;
    data['deliveryStatus'] = this.deliveryStatus;
    data['location'] = this.location;
    data['brokerId'] = this.brokerId;
    if (this.broker != null) {
      data['broker'] = this.broker!.toJson();
    }
    data['customerId'] = this.customerId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}