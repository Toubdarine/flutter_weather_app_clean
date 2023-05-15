import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/interfaces/geolocator.dart';
import '../../domain/interfaces/repositories/location_repo.dart';
import '../../foundation/failures/failure.dart';

class LocationRepositoryImpl implements LocationRepository {
  final IGeolocator geolocator;
  LocationRepositoryImpl(this.geolocator);
  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Left(LocationFailure('Location services are disabled.'));
    }

    permission = await geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Left(LocationFailure('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Left(LocationFailure(
          'Location permissions are permanently denied, we cannot request permissions.'));
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var position = await geolocator.getCurrentPosition();
    return Right(position);
  }
}
