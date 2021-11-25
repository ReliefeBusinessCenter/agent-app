part of 'city_bloc.dart';

abstract class CityEvent  {
  const CityEvent();
}

class FetchCities extends CityEvent {}

class CreateCity extends CityEvent {
  final City city;

  CreateCity(this.city);
}

class UpdateCity extends CityEvent {
  final City city;
  UpdateCity(this.city);
}
