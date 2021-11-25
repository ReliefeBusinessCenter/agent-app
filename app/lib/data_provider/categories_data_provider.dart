import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/broker/category.dart';
//import 'package:app/model/category.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:flutter/cupertino.dart';

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
    late List<Category> categoriesReturn = [];
    try {
      final url = Uri.parse('${Ip.ip}/api/categories/');

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
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++Extracted data: $data");
        return (data.map((category) => Category.fromJson(category)).toList());
      } else {
        print(response.body);
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print("Exception throuwn $e");
    }
    return categoriesReturn;
  }

  // add categories
  Future<Category> addCategory(Category category) async {
    // late Category _resultCategory;
    try {
      final url = Uri.parse('${Ip.ip}/api/categories/');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, dynamic>{"catigoryName": category.catigoryName},
        ),
      );
      
      if (response.statusCode == 200) {
        return Category.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // Update categories
  Future<Category> updateCategory(Category category) async {
    try {
      debugPrint("Update categooooooooooooooooooooooooooooooory");
      final url = Uri.parse('${Ip.ip}/api/categories/${category.categoryId}');
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              <String, dynamic>{
                "categoryId": category.categoryId,
                "catigoryName": category.catigoryName}));

      debugPrint(
          "Update categooooooooooooooooooooooooooooooory ${response.statusCode}");

      if (response.statusCode == 200) {
        return Category.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
