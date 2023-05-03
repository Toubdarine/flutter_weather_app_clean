import 'package:dartz/dartz.dart';

import '../../foundation/failures/failure.dart';
import '../interfaces/repositories/weather_repo.dart';
import '../entites/weather_data_entity.dart';

class GetCurrentWeather {
  final WeatherRepository repository;
  GetCurrentWeather({required this.repository});
  Future<Either<Failure, WeatherDataEntity>> execute(
      double lat, double lon) async {
    var response = await repository.getWeatherForecaste(
      lat,
      lon,
    );
    Either<Failure, WeatherDataEntity> result = response.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
    return result;
  }
}
