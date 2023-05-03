import 'package:dartz/dartz.dart';

import '../../../foundation/failures/failure.dart';
import '../../entites/weather_data_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherDataEntity>> getWeather(
      double latitude, double longitude,
      [String? date]);

  Future<Either<Failure, WeatherDataEntity>> getWeatherForecaste(
      double latitude, double longitude,
      [String? date]);
}
