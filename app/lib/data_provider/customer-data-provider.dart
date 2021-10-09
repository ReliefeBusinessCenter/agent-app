import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class CustomerDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;

  CustomerDataProvider(
      {required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);


Future<Customer?> getCustomerByEmail(String email) async {
    // String? token = await this.userPreferences.getUserToken();
    // late List<Category> categories_return = [];
    late Customer customer;
    try {
      final url = Uri.parse('${Ip.ip}/api/customers/$email');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      print('Arrived here ${response.body}');
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);

        final data = extractedData;

        return Customer.fromJson(data);

        // return (data.map((customer) => Customer.fromJson(customer)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to get customer by email');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return null;
  }
  
  Future<bool> createCustomer(Customer? customer) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Customer create method invocked");
    print("Customer Data:${customer!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/customers/');

      // image upload

      var request = http.MultipartRequest('POST',
          Uri.parse('${Ip.ip}/api/users/uploadfileg'));
      print("request");

      request.files.add(await http.MultipartFile.fromPath(
          'file', customer.user!.picture as String));
      print("added to multipart");

      var res = await http.Response.fromStream(await request.send());

      print("Image Upload Response: ${res.statusCode}");
      if (res.statusCode == 200) {
        print("Photo Name:  ${res.body}");
        // send other customer data here
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          //      if (data.uploadedPhoto != null) {
          //   request.files.add(await http.MultipartFile.fromPath(
          //       'uploaded_photo', data.uploaded Photo!));
          // }
          body: jsonEncode({
            "reviews": [],
            "deals": [],
            "delivery": [],
            "sales": [],
            "user": {
              "fullName": customer.user!.fullName,
              "email": customer.user!.email,
              "password": customer.user!.password,
              "phone": "0916897173",
              "address": "Ethiopia/Dessie",
              "picture": res.body.toString(),
              "sex": customer.user!.sex,
              "role": customer.user!.role,
              "buys": null,
            }
          }),
        );
        print(
            "Http response ${response.statusCode} and response body ${response.body}");
        if (response.statusCode == 200) {
          return true;
        } else {
          print(response.body);
          throw Exception('Failed to Save Customer Data');
        }
      } else {
        // error
        throw Exception("Failed to upload image");
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }


}
