import 'package:app/constants/dummy_brokers.dart';
import 'package:app/model/broker/broker.dart';
import 'package:geolocator/geolocator.dart';

Future<List<Broker>> nearByUser(int radius) async {
  List<Broker> _brokers = brokers.map((e) => Broker.fromJson(e)).toList();
  List<Broker> _nearbyBrokers = [];

  Position value = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
print(
      "========================================================================================================================================================");

  _brokers.forEach((broker) {
     print("The location is ${value.latitude}");
    double distanceInMeters =  Geolocator.distanceBetween(
        value.latitude, value.longitude, broker.latitude!, broker.longitude!);
    print("The distance in meters is $distanceInMeters");
    if (distanceInMeters < radius * 1000) {
      _nearbyBrokers.add(broker);
    }
  });

  print(
      "========================================================================================================================================================");
  print(_nearbyBrokers);
 
  return _nearbyBrokers;
}
