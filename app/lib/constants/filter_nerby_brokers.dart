import 'dart:math';

import 'package:app/constants/dummy_brokers.dart';
import 'package:app/model/broker/broker.dart';
import 'package:geolocator/geolocator.dart';

Future<List<Broker>> nearByUser(int radius, List<Broker> brokers) async {
  // List<Broker> _brokers = brokers.map((e) => Broker.fromJson(e)).toList();
  List<Broker> _nearbyBrokers = [];

  Position value = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  print(
      "========================================================================================================================================================");
  print("The location is ${value.latitude}  ${value.longitude}");
  brokers.forEach((broker) {
    print("The broker  is ${broker.user!.latitude} ${broker.user!.longitude}");
    double distanceInMeters = calculateDistance(value.latitude, value.longitude,
        broker.user!.latitude, broker.user!.longitude);
    print("The distance in meters is $distanceInMeters");
    if (distanceInMeters < radius) {
      _nearbyBrokers.add(broker);
    }
  });

  print(
      "========================================================================================================================================================");
  print(_nearbyBrokers);

  return sortedBrokers(_nearbyBrokers, value);
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  print("The lans are $lat1 $lon1 $lat2 $lon2");
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

List<Broker> sortedBrokers(List<Broker> brokers, Position position) {
  brokers.sort((a, b) => calculateDistance(
        a.user!.latitude,
        a.user!.longitude,
        position.latitude,
        position.longitude,
      ).compareTo(calculateDistance(
        b.user!.latitude,
        b.user!.longitude,
        position.latitude,
        position.longitude,
      )));

  return brokers;
}
