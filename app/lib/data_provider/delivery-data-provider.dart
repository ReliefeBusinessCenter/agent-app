import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/delivery.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class DeliveryDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;

  DeliveryDataProvider(
      {required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);
      




// create delivery
  Future<bool> createDelivery(Delivery? delivery) async {
    print("Entered to the delivery method");
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Delivery create method invoked");
    print("Customer Data:${delivery!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/delivery/');

      // send other customer data here
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', 
        },
        body: jsonEncode({
          "deliveryStatus": "Accepted",
          "location": "Awasa",
          "brokerId": delivery.broker!.brokerId,
          "customerId": delivery.customer!.customerId
          // "broker": {"brokerId": delivery.broker!.brokerId},
          // "customer": {"customerId": delivery.customer!.customerId}
        }),
      );

      print(
          "Http response ${response.statusCode} and response body ${response.body}");
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
        throw Exception('Failed to Save delivery Data');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

  // delete delivery
  Future<bool> deleteDelivery(int id) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Delivery Delete method Invocked");
    print("Delivery Id:${id}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/delivery/${id}');
      // final url = Uri.parse('http://192.168.211.201:5000/api/delivery/${id}');

      // send other customer data here
      final response = await http.delete(
        url,
      );
      print(
          "Http response ${response.statusCode} and response body ${response.body}");
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
        throw Exception('Failed to Save delivery Data');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

  // update delivery
  Future<bool> updateDelivery(Delivery? delivery) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Customer create method invocked");
    print("Customer Data:${delivery!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');

      final url = Uri.parse('${Ip.ip}/api/delivery/${delivery.deliveryId}');


      // send other customer data here
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "deliveryId": delivery.deliveryId,
          "deliveryStatus": delivery.deliveryStatus,
          "location": "Awasa",
          "brokerId": delivery.broker!.brokerId,
          "customerId": delivery.customer!.customerId
        }),
      );
      print(
          "Http response ${response.statusCode} and response body ${response.body}");
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
        throw Exception('Failed to Save delivery Data');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }
}
