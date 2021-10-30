import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class DealsDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;

  DealsDataProvider({required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);

// create delivery
  Future<bool> createDeals(Deals? deals) async {
    print("Entered to the deals method");
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Deals create method invoked");
    print("Deals Data:${deals!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/deals/');

      // send other customer data here
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          
            "quantity": deals.quantity,
            "color": deals.color,
            "deliveryOption": deals.deliveryOption,
            "productModel": deals.productModel,
            "productName": deals.productName,
            "paymentOption": deals.paymentOption,
            "dealsStatus": deals.dealsStatus,
            "customerId": deals.customer!.customerId,
            "brokerId": deals.broker!.brokerId
          
        }),
      );

      print(
          "Http response ${response.statusCode} and response body ${response.body}");
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.body);
        throw Exception('Failed to Save deals Data');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

  // delete delivery
  Future<bool> deleteDeals(int id) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Deals Delete method Invocked");
    print("Deals Id:${id}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/deals/$id');
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
  Future<bool> updateDeals(Deals? deals) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Deals create method invocked");
    print("Delivery Data:${deals!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');

      final url = Uri.parse('${Ip.ip}/api/delivery/${deals.dealsId}');

      // send other customer data here
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "dealsId": 0,
            "quantity": 21,
            "productName": "Shoes",
            "productModel": "Shoes",
            "color": "Green",
            "paymentOption": "Cash",
            "deliveryOption": "yes",
            "dealsStatus": "Pending",
            "brokerId": 1,
            "broker": null,
            "customerId": 1,
            "customer": null
          }));
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
