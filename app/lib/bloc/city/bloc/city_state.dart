part of 'city_bloc.dart';

abstract class CityState {
  const CityState();
}

class CityLoading extends CityState {}

class CityLoadSuccess extends CityState {
  final List<City> cities;
  CityLoadSuccess(this.cities);
}

class CityLoadFailed extends CityState {
  final String message;
  CityLoadFailed(this.message);
}

class CityUpdateCreateSucess extends CityState {
  final City city;
  CityUpdateCreateSucess(this.city);
}
