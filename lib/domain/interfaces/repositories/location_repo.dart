import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<Either<Exception, Position>> getCurrentLocation();
}
