import 'package:dartz/dartz.dart';

import '../../foundation/failures/failure.dart';

import '../entites/weather_data_entity.dart';
import '../interfaces/repositories/weather_repo.dart';

class GetForecast {
  final WeatherRepository repository;
  GetForecast({required this.repository});
  Future<Either<Failure, WeatherDataEntity>> execute(
      double lat, double lon, String date) async {
    var response = await repository.getWeatherForecaste(lat, lon, date);
    Either<Failure, WeatherDataEntity> result = response.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
    return result;
  }
}
