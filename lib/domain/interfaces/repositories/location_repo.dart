import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../../foundation/failures/failure.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
}
