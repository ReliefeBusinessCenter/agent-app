import 'broker/broker.dart';
import 'customer/customer.dart';

class Delivery {
  int? deliveryId;
  String? deliveryStatus;
  String? location;
  Broker? broker;
  Customer? customer;
  
  Delivery({this.deliveryId, this.deliveryStatus, this.location, this.broker, this.customer});

  Delivery.fromJson(Map<String, dynamic> json) {
    deliveryId = json['deliveryId'];
    deliveryStatus = json['deliveryStatus'];
    location = json['location'];
    broker =
        json['broker'] != null ? new Broker.fromJson(json['broker']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryId'] = this.deliveryId;
    data['deliveryStatus'] = this.deliveryStatus;
    data['location'] = this.location;
    if (this.broker != null) {
      data['broker'] = this.broker!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}