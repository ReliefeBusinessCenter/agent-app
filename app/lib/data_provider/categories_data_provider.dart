import 'dart:convert';
import 'dart:io';

import 'package:app/model/category.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CategoriesDataProvider {
  final _baseUrl = 'http://csv.jithvar.com/api/v1';
  final http.Client httpClient;
  final UserPreferences userPreferences;

  CategoriesDataProvider(
      {required this.httpClient, required this.userPreferences})
      : assert(httpClient != null);

  Future<List<Category>> getCategories() async {
    // String? token = await this.userPreferences.getUserToken();
    late List<Category> categories_return = [];
    try {
      final url = Uri.parse('http://192.168.211.201:5000/api/categories/');

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
        final extractedData = json.decode(response.body) as List;

        final data = extractedData;

        return (data.map((category) => Category.fromJson(category)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return categories_return;
  }
}
