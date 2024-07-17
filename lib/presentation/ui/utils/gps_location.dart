import 'dart:developer';

import 'package:location/location.dart';

Future<LocationData?> getGpsLocation() async {
  final Location location = Location();

  bool serviceEnabled = await location.serviceEnabled();
  log('serviceEnabled : $serviceEnabled');
  if (serviceEnabled == false) {
    serviceEnabled = await location.requestService();
    log('requestService : $serviceEnabled');
    if (serviceEnabled == false) {
      return null;
    }
  }

  PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.granted) {
      log('==========');
    } else {
      log('--------Permission: $permissionGranted--------');
    }
  }

  final LocationData locationData = await location.getLocation();

  return locationData;
}
