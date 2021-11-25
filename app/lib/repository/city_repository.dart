import 'package:app/data_provider/city_data_provider.dart';
import 'package:app/model/city.dart';
import 'package:flutter/cupertino.dart';

class CityRepository {
  final CityDataProvider cityDataProvider;
  CityRepository({required this.cityDataProvider});

  // fetch all cities
  Future<List<City>> getCities() async {
    return await cityDataProvider.getCities();
  }

  // create city
  Future<City> createCity(City city) async {
    return await cityDataProvider.createCity(city);
  }

  // update city
  Future<City> updateCity(City city) async {
    return await cityDataProvider.updateCity(city);
  }
}
