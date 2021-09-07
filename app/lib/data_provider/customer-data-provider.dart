import 'dart:convert';

import 'package:app/model/customer/customer.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class CustomerDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;

  CustomerDataProvider(
      {required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);

  Future<bool> createCustomer(Customer? customer) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("order mthod invocked");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('http://192.168.106.201:5000/api/customers/');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            // "total": request!.total,
            // "payment_when": request.paymentWhen,
            // "payment_method": request.paymentMethod,
            // "type_of_wallet": request.typeOfWallet,
            // "transaction_id": request.transactionId,
            // "amount_paid": request.amountPaid,
            // "amount_remaining": request.amountRemaining,
            // "address_id": 324,
            // "client_id": request.clientId,
            // "cart": request.cart

            "reviews": [],
            "deals": [],
            "delivery": [],
            "sales": [],
            "user": {
              "fullName": customer!.user!.fullName,
              "email": customer.user!.email,
              "password": customer.user!.password,
              "phone": customer.user!.phone,
              "address": "Ethiopia/Dessie",
              "picture": "yared.jpg",
              "sex":customer.user!.sex,
              "role": customer.user!.role,
              "buys": null
            }
          }));

      print(
          "Http response ${response.statusCode} and response body ${response.body}");
      if (response.statusCode == 201) {
        return true;
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }
}
