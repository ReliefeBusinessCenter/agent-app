import 'dart:convert';

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

  Future<bool> createDelivery(Delivery? delivery) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Customer create method invocked");
    print("Customer Data:${delivery!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('http://192.168.211.201:5000/api/delivery/');

      // send other customer data here
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },

        body: jsonEncode({
          "deliveryStatus": "Pending",
          "location": "Awasa",
          "broker": {"brokerId": delivery.broker!.brokerId},
          "customer": {"customerId": delivery.customer!.customerId}
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
