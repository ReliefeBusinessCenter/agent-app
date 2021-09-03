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
      final url = Uri.parse('http://192.168.106.201:5000/api/brokers');

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
}
