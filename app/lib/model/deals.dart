import 'broker/broker.dart';
import 'customer/customer.dart';

class Deals {
  int? dealsId;
  int? quantity;
  String? productName;
  String? productModel;
  String? color;
  String? paymentOption;
  String? deliveryOption;
  String? dealsStatus;
  int? brokerId;
  Broker? broker;
  int? customerId;
  Customer? customer;

  Deals(
      {this.dealsId,
      this.quantity,
      this.productName,
      this.productModel,
      this.color,
      this.paymentOption,
      this.deliveryOption,
      this.dealsStatus,
      this.brokerId,
      this.broker,
      this.customerId,
      this.customer});

  Deals.fromJson(Map<String, dynamic> json) {
    dealsId = json['dealsId'];
    quantity = json['quantity'];
    productName = json['productName'];
    productModel = json['productModel'];
    color = json['color'];
    paymentOption = json['paymentOption'];
    deliveryOption = json['deliveryOption'];
    dealsStatus = json['dealsStatus'];
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
    data['dealsId'] = this.dealsId;
    data['quantity'] = this.quantity;
    data['productName'] = this.productName;
    data['productModel'] = this.productModel;
    data['color'] = this.color;
    data['paymentOption'] = this.paymentOption;
    data['deliveryOption'] = this.deliveryOption;
    data['dealsStatus'] = this.dealsStatus;
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