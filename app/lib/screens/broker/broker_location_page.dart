import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final Location location;
  MapScreen({required this.location});
  static const routeName = 'map';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  List<Marker> myMarker = [];
   late GoogleMapController mapController;
  // final LatLng _center = LatLng(9, 38.7);


   late LatLng _currentLocation;
   
  void _onMapCreated(GoogleMapController controller) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(
      () {
        _currentLocation = LatLng(position.latitude, position.longitude);
        print('on map cerrated  $_currentLocation');

        myMarker = [];
        myMarker.add(
          Marker(
            markerId: MarkerId(_currentLocation.toString()),
            position: _currentLocation,
            draggable: true,
            onDragEnd: (value) => _handleTap(_currentLocation),
          ),
        );
      },
    );
    mapController = controller;
    await centerScreen(position);
  }

  @override
  void initState() {
    GeolocatorService().getCurrentLocation().listen((position) async {
      setState(
        () {
          _currentLocation = LatLng(position.latitude, position.longitude);
          print('iinit  $_currentLocation');
          myMarker = [];
          myMarker.add(
            Marker(
              markerId: MarkerId(_currentLocation.toString()),
              position: _currentLocation,
              draggable: true,
              onDragEnd: (value) => _handleTap(_currentLocation),
            ),
          );
        },
      );
      await centerScreen(position);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LatLng _center =
        LatLng(widget.location.latitude, widget.location.longitude);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                markers: Set.from(myMarker),
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 18.0,
                ),
                // mapType: MapType.terrain,
                onTap: _handleTap,
                myLocationButtonEnabled: true,
              ),
              Positioned(
                  bottom: 0,
                  left: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      var address = await _fetchLocation(_currentLocation);

                      Navigator.of(context).pop(LocationArgument(
                          latitude: _currentLocation.latitude,
                          longitude: _currentLocation.longitude,
                          address: address));
                    },
                    child: const Text(
                      "Confirm Location",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Positioned(
                  top: 20,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  Future<void> centerScreen(Position position) async {
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18.0)));
  }

  void _handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        draggable: true,
        onDragEnd: (value) => _handleTap(value),
      ));
      _currentLocation = tappedPoint;
      print(tappedPoint);
    });
    centerScreen(Position(
      latitude: _currentLocation.latitude,
      longitude: _currentLocation.longitude,
      accuracy: 1.0,
      timestamp: DateTime.now(),
      altitude: 100.0,
      heading: 1.0,
      speed: 1.0,
      speedAccuracy: 1.0,
    ));
  }

  Future<String> _fetchLocation(LatLng position) async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.best);

    ///Here you have choose level of distance
    var latitude = position.latitude.toString();
    var longitude = position.longitude.toString();
    var placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var address =
        '${placemarks.first.name!.isNotEmpty ? placemarks.first.name! + ', ' : ''}${placemarks.first.subLocality!.isNotEmpty ? placemarks.first.subLocality! + ', ' : ''}${placemarks.first.locality!.isNotEmpty ? placemarks.first.locality! + ', ' : ''}${placemarks.first.subAdministrativeArea!.isNotEmpty ? placemarks.first.subAdministrativeArea! + ', ' : ''}';
    print("latitude" + latitude);
    print("longitude" + longitude);
    print("adreess  " + address);
    return address;
  }
}

class GeolocatorService {
  Stream<Position> getCurrentLocation() {
    return Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
  }

  Future<Position> getInitialLocation() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class LocationArgument {
  final double latitude;
  final double longitude;
  final String address;

  LocationArgument(
      {required this.latitude, required this.longitude, required this.address});
}
