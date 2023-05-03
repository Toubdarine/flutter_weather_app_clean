import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';

import '../../foundation/failures/failure.dart';
import '../interfaces/repositories/location_repo.dart';

class GetCurrentLocation {
  final LocationRepository repository;
  GetCurrentLocation({required this.repository});
  Future<Either<Failure, Position>> execute() async {
    var response = await repository.getCurrentLocation();
    Either<Failure, Position> result = response.fold((exception) {
      return Left(LocationFailure('Location Failure'));
    }, (response) {
      return Right(response);
    });
    return result;
  }
}
