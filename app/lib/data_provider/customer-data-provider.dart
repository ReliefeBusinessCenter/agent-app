import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class CustomerDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;

  CustomerDataProvider(
      {required this.httpClient, required this.userPreferences});

  Future<List<Customer>?> getCustomers() async {
    String? token = await this.userPreferences.getUserToken();
    late List<Customer> customers_return = [];

    try {
      final url = Uri.parse('${Ip.ip}/api/customers');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List;

        final data = extractedData;

        print("Data:$data");

        return (data.map((customer) => Customer.fromJson(customer)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return customers_return;
  }

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

      var request = http.MultipartRequest(
          'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
      var request2 = http.MultipartRequest(
          'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));

      print("request");

      request.files.add(await http.MultipartFile.fromPath(
          'file', customer.user!.picture as String));
      print("added profile image");

      var res = await http.Response.fromStream(await request.send());

      print("request");

      request2.files.add(await http.MultipartFile.fromPath(
          'file', customer.user!.identificationCard as String));
      print("added Identification card");

      var resId = await http.Response.fromStream(await request2.send());

      print("Image Upload Response: ${res.statusCode}");
      if (res.statusCode == 200 && resId.statusCode == 200) {
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
              "email": "someone@gmail.com",
              "password": customer.user!.password,
              "phone": customer.user!.phone,
              "address": "Ethiopia/Dessie",
              "picture": "test.jpg",
              "identificationCard": resId.body.toString(),
              "sex": customer.user!.sex,
              "role": customer.user!.role,
              "buys": null,
              "city": customer.user!.city,
              "subcity": customer.user!.subCity,
              "kebele": customer.user!.kebele,
              "latitude": customer.user!.latitude,
              "longtiude": customer.user!.longitude
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

  // delete delivery
  Future<bool> deleteCustomer(int id) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print("++++++++++++++++++++++++++++Customer Delete method Invocked");
    print("Customer Id:$id");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/customers/${id}');
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
        throw Exception(' ');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }

  Future<Customer> updateCustomer(Customer customer, bool imageChanged) async {
    print("++++++++++++++++++++++++++++ updating Customer");
    String? token = await this.userPreferences.getUserToken();
    try {
      if (!imageChanged) {
        final url = Uri.parse('${Ip.ip}/api/customers/${customer.customerId}');
        final _response = await http.put(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "customerId": 2,
              "reviews": [],
              "deals": [],
              "delivery": [],
              "sales": [],
              "user": customer.user!.toJson()
            }));

        if (_response.statusCode == 200) {
          return Customer.fromJson(jsonDecode(_response.body));
        } else {
          throw Exception(_response.body);
        }
      } else {
        var request = http.MultipartRequest(
            'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
        print("request");

        request.files.add(await http.MultipartFile.fromPath(
            'file', customer.user!.picture as String));
        print("added to multipart");

        var res = await http.Response.fromStream(await request.send());
        if (res.statusCode == 200) {
          final url =
              Uri.parse('${Ip.ip}/api/customers/${customer.customerId}');
          final _response = await http.put(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "customerId": 2,
              "reviews": [],
              "deals": [],
              "delivery": [],
              "sales": [],
              "user": {
                "userId": customer.user!.userId,
                "fullName": customer.user!.fullName,
                "email": customer.user!.password,
                "password": customer.user!.password,
                "phone": customer.user!.phone,
                "city": customer.user!.city,
                "subcity": customer.user!.subCity,
                "kebele": customer.user!.kebele,
                "picture": res.body.toString(),
                "identificationCard": null,
                "sex": customer.user!.sex,
                "role": customer.user!.role,
                "buys": null
              }
            }),
          );

          print("Customer update status code is ${_response.statusCode}");
          print("customer update body${_response.body}");

          if (_response.statusCode == 200) {
            return Customer.fromJson(jsonDecode(_response.body));
          } else {
            throw Exception(_response.body);
          }
        } else {
          throw Exception(res.body);
        }
      }
    } catch (e) {
      print("update error ${e.toString()}");
      throw Exception("Something went wrong");
    }
  }
}
