import 'dart:convert';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:http/http.dart' as http;

class CategoriesDataProvider {
  final _baseUrl = '${Ip.ip}/api/categories/';
  final http.Client httpClient;
  final UserPreferences userPreferences;
  late String? token;
  CategoriesDataProvider(
      {required this.httpClient, required this.userPreferences});

  Future<void> initState() async {
    token = await userPreferences.getUserToken();
  }

// get categories
  Future<List<Category>> getCategories() async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body) as List;
        final data = extractedData;
        return (data.map((category) => Category.fromJson(category)).toList());
      }
      throw Exception('Failed to load categories');
    } catch (e) {
      throw Exception(e);
    }
  }

  // add categories
  Future<Category> addCategory(Category category) async {
    initState();
    try {
      final url = Uri.parse('$_baseUrl');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
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
    initState();
    try {
      final url = Uri.parse('$_baseUrl${category.categoryId}');
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, dynamic>{
            "categoryId": category.categoryId,
            "catigoryName": category.catigoryName
          }));
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
