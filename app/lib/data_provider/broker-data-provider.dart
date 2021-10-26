import 'dart:convert';
import 'dart:io';

import 'package:app/ip/ip.dart';
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
      final url = Uri.parse('${Ip.ip}/api/brokers');

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

  Future<Broker?> getBrokerByEmail(String email) async {
    // String? token = await this.userPreferences.getUserToken();
    // late List<Category> categories_return = [];
    late Broker broker;
    try {
      final url = Uri.parse('${Ip.ip}/api/brokers/$email');

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
        print(
            "Data after Parsing +++++>>>>> ${Broker.fromJson(data).toJson()}");
        return Broker.fromJson(data);

        // return (data.map((customer) => Customer.fromJson(customer)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to get broker by email');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return null;
  }

  Future<Broker?> getBrokerById(int id) async {
    String? token = await this.userPreferences.getUserToken();
    Broker? broker_return = null;
    print("This is the Broker Id:${id}");
    try {
      final url = Uri.parse('${Ip.ip}/api/brokers/${id}');

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
        final extractedData = json.decode(response.body);

        final data = extractedData;

        print("Data:${data}");

        return Broker.fromJson(data);
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return broker_return;
  }

  Future<bool> createBroker(Broker? broker) async {
    String? token = await this.userPreferences.getUserToken();
    // late List<Data> products_return = [];
    print(
        "+++++++++++++++++++++++______++++++Create broker  method invocked+++++++++++________with Data ${broker!.toJson()}");
    try {
      // final url = Uri.parse('http://csv.jithvar.com/api/v1/orders');
      final url = Uri.parse('${Ip.ip}/api/brokers/');
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Ip.ip}/api/users/uploadfileg'));
      print("request");

      request.files.add(await http.MultipartFile.fromPath(
          'file', broker.user!.picture as String));
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
                "communicationSkill": broker.skills!.communicationSkill,
                "brokingSkill": broker.skills!.brokingSkill,
                "workDone": broker.skills!.workDone,
                "workInProgress": broker.skills!.workInProgress,
              },
              "categoryId": broker.category!.categoryId,
              // "category": {
              //   // "categoryId"
              //   // "catigoryName": broker.category!.catigory
              //   // "categoryId": 2,
              //   "catigoryName": "Bussiness1  Broker"
              // },
              "user": {
                "fullName": broker.user!.fullName,
                "email": broker.user!.email,
                "password": broker.user!.password,
                "phone": '123456789',
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
