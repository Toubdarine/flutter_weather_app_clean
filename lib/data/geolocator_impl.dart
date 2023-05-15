import 'package:geolocator/geolocator.dart';
import '../domain/interfaces/geolocator.dart';

class GeolocatorWrapper implements IGeolocator {
  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }
}
