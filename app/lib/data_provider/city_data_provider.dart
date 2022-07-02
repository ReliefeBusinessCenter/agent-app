import 'dart:convert';

import 'package:app/ip/ip.dart';
import 'package:app/model/city.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:http/http.dart' as http;

class CityDataProvider {
  final _baseURL = "${Ip.ip}/api/city/";
  final http.Client httpClient;
  late String? token;
  final UserPreferences userPreferences;
  CityDataProvider({required this.httpClient, required this.userPreferences});

  Future<void> initState() async {
    token = await userPreferences.getUserToken();
  }

  // Fetch all cities
  Future<List<City>> getCities() async {
    // initState();
    try {
      final _response = await httpClient.get(
        Uri.parse(_baseURL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      if (_response.statusCode == 200) {
        print("++++++++++Arrived here on cities");
        final _jsonList = jsonDecode(_response.body) as List;
        return _jsonList.map((city) => City.fromJson(city)).toList();
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // create city
  Future<City> createCity(City city) async {
    initState();
    try {
      final _response = await httpClient.post(Uri.parse(_baseURL),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "cityName": city.cityName,
          }));
      if (_response.statusCode == 200) {
        return City.fromJson(jsonDecode(_response.body));
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // update city
  Future<City> updateCity(City city) async {
    initState();
    try {
      final _response =
          await httpClient.put(Uri.parse(_baseURL + "${city.cityId}"),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode({
                "cityId": city.cityId,
                "cityName": city.cityName,
              }));

      if (_response.statusCode == 200) {
        return City.fromJson(jsonDecode(_response.body));
      } else {
        throw Exception(_response.body);
      }
    } catch (e) {
      print(e.toString());
      throw Exception(
        e.toString(),
      );
    }
  }
}
