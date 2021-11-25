import 'dart:convert';

import 'package:app/model/city.dart';
import 'package:http/http.dart' as http;

class CityDataProvider {
  final _baseURL = "http://broker-service-api.herokuapp.com/api/city/";
  final http.Client httpClient;

  CityDataProvider({required this.httpClient});

  // Fetch all cities
  Future<List<City>> getCities() async {
    print("@@@@@@@@@@@@@@@@@fetching cities");
    try {
      final _response = await httpClient.get(
        Uri.parse(_baseURL),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      );
      print("Response status");
      print(_response.statusCode);
      if (_response.statusCode == 200) {
        final _jsonList = jsonDecode(_response.body) as List;
        print("data is $_jsonList");
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
    try {
      final _response = await httpClient.post(Uri.parse(_baseURL),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
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
    print("@@@@@@@@@@@@@@@@@@@@@@ UPDATE");
    try {
      final _response = await httpClient.put(Uri.parse(_baseURL+"${city.cityId}"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "cityId": city.cityId,
            "cityName": city.cityName,
          }));
      print("City update status code${_response.statusCode}");
      print("City update body${_response.body}");

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
