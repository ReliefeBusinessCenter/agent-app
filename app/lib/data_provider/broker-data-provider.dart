import 'dart:convert';
import 'dart:io';

import 'package:app/model/broker/broker.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class BrokerDataProvider {
  final _baseUrl = 'http://192.168.106.201:5000/api/brokers';
  final http.Client httpClient;
  final UserPreferences userPreferences;
  // final token = '628|uESSMWAkhzp5igcBdc93thXMR8Qm8CbrPQwPVTy7';

  BrokerDataProvider({required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);

  Future<List<Broker>?> getBrokers() async {
    String? token = await this.userPreferences.getUserToken();
    late List<Broker> brokers_return = [];
    print("This is the caategory Id");
    try {
      final url = Uri.parse('http://192.168.211.201:5000/api/brokers');

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

        print("Data:${data}");

        return (data.map((broker) => Broker.fromJson(broker)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return brokers_return;
  }

  Future<bool> createBroker(Broker? broker) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print(
        "+++++++++++++++++++++++______++++++Create broker  method invocked+++++++++++________");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('http://192.168.211.201:5000/api/brokers/');
      var request = http.MultipartRequest('POST',
          Uri.parse('http://192.168.211.201:5000/api/users/uploadfileg'));
      print("request");

      request.files.add(await http.MultipartFile.fromPath(
          'file', broker!.user!.picture as String));
      print("added to multipart");

      var res = await http.Response.fromStream(await request.send());

      print("Image Upload Response: ${res.statusCode}");
      if (res.statusCode == 200) {
        final response = await http.post(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "portfolios": [],
              "deliveries": [],
              "deals": [],
              "reviews": [],
              "skills": {
                "communicationSkill": broker!.skills!.communicationSkill,
                "brokingSkill": broker.skills!.brokingSkill,
                "workDone": broker.skills!.workDone,
                "workInProgress": broker.skills!.workInProgress
              },
              "category": {
                "categoryId": broker.category!.categoryId,
                "catigoryName": broker.category!.catigoryName
              },
              "user": {
                "fullName": broker.user!.fullName,
                "email": broker.user!.email,
                "password": broker.user!.password,
                "phone": broker.user!.phone,
                "address": "Ethiopia/Dessie",
                "picture": res.body.toString(),
                "sex": broker.user!.sex,
                "role": broker.user!.role,
                "buys": null
              }
            }));
        print(
            "Http response ${response.statusCode} and response body ${response.body}");
        if (response.statusCode == 200) {
          return true;
        } else {
          print(response.body);
          throw Exception('Failed to load courses');
        }
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return false;
  }
}
