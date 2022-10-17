import 'dart:convert';

import 'package:app/Service/fireabse_service.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:http/http.dart' as http;

class CustomerDataProvider {
  final _baseUrl = '${Ip.ip}/api/customers';
  final http.Client httpClient;
  final UserPreferences userPreferences;
  late String token;
  CustomerDataProvider(
      {required this.httpClient, required this.userPreferences});

  Future<void> initState() async {
    print("init is being called");
    // token = (await userPreferences.getUserToken())!;
  }

// get customers
  Future<List<Customer>> getCustomers() async {
    initState();
    try {
      final url = Uri.parse(_baseUrl);

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List;
        final data = extractedData;

        return (data.map((customer) => Customer.fromJson(customer)).toList());
      } else {
        throw Exception('Failed to load Customers');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// get customer by email
  Future<Customer> getCustomerByPhone(String phone) async {
    initState();
    print("Arrived at customer data provider:$phone");
    try {
      final url = Uri.parse('$_baseUrl/$phone');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);
        final data = extractedData;
        return Customer.fromJson(data);
      } else {
        throw Exception('Failed to get customer by email');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> storeImage(String? image, String folder) async {
    return await FirebaseService.uploadFile((image), "$folder/").toString();
  }

// create new customer
  Future<bool> createCustomer(Customer customer) async {
    initState();
    String? token = await this.userPreferences.getUserToken();
    try {
      final url = Uri.parse(_baseUrl);

      if (customer.user!.picture == null)
        throw new Exception("Profile picture is required");
      if (customer.user!.identificationCard == null)
        throw new Exception("Broker Identification card is required");

      String picturePath =
          storeImage(customer.user!.picture, '/customers').toString();

      String idPath =
          storeImage(customer.user!.identificationCard, '/IdentificationCard')
              .toString();

      // send other customer data here
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
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
            "picture": picturePath,
            "identificationCard": idPath,
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

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to Save Customer Data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // delete customer
  Future<bool> deleteCustomer(int id) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl/$id');
      final response = await http.delete(
        url,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to Delete customer');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// update customer
  Future<Customer> updateCustomer(Customer customer, bool imageChanged) async {
    initState();
    try {
      if (!imageChanged) {
        // when there is no image change usse this update request
        final url = Uri.parse('$_baseUrl/${customer.customerId}');
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
        // when there is image change use this request.
        var request = http.MultipartRequest(
            'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
        request.files.add(await http.MultipartFile.fromPath(
            'file', customer.user!.picture as String));

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
                "identificationCard": customer.user!.identificationCard,
                "sex": customer.user!.sex,
                "role": customer.user!.role,
                "buys": null
              }
            }),
          );
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
      throw Exception(e);
    }
  }
}
