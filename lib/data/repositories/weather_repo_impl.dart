import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../domain/entites/weather_data_entity.dart';
import '../../domain/interfaces/network/api_client.dart';
import '../../domain/interfaces/repositories/weather_repo.dart';
import '../../foundation/failures/failure.dart';
import '../models/weather_data_model.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final ApiClient apiClient;

  WeatherRepositoryImpl(this.apiClient);

  @override
  Future<Either<Failure, WeatherDataEntity>> getWeather(
      double latitude, double longitude,
      [String? date]) async {
    await dotenv.load(fileName: "./.env");
    String forcastApiKey = dotenv.env['FORCAST_API_KEY']!;
    String forecasteApiUrl =
        "http://api.weatherapi.com/v1/forecast.json?key=$forcastApiKey";
    Uri uri;
    if (date == null) {
      uri = Uri.parse(
        "$forecasteApiUrl&q=$latitude,$longitude&days=2&aqi=yes&alerts=no",
      );
    } else {
      uri = Uri.parse(
        "$forecasteApiUrl&q=$latitude,$longitude&days=1&aqi=yes&alerts=no&dt=$date",
      );
    }

    try {
      final response = await apiClient.getReq(uri);
      Either<Failure, WeatherDataEntity> result;
      result = response.fold(
        (failure) {
          return Left(failure);
        },
        (response) {
          final body = jsonDecode(response.body);

          final weather = WeatherDataModel.fromJson(body);

          return Right(weather.toWeatherDataEntity);
        },
      );

      return result;
    } catch (e) {
      return Left(ServerFailure('Failed to retrieve data. Error: $e'));
    }
  }

  @override
  Future<Either<Failure, WeatherDataEntity>> getWeatherForecaste(
      double latitude, double longitude,
      [String? date]) async {
    await dotenv.load(fileName: "./.env");
    String forcastApiKey = dotenv.env['FORCAST_API_KEY']!;
    String forecasteApiUrl =
        "http://api.weatherapi.com/v1/forecast.json?key=$forcastApiKey";
    Uri uri;
    if (date == null) {
      uri = Uri.parse(
        "$forecasteApiUrl&q=$latitude,$longitude&days=2&aqi=yes&alerts=no",
      );
    } else {
      uri = Uri.parse(
        "$forecasteApiUrl&q=$latitude,$longitude&days=2&aqi=yes&alerts=no&dt=$date",
      );
    }

    try {
      final response = await apiClient.getReq(uri);
      Either<Failure, WeatherDataEntity> result;
      result = response.fold(
        (failure) {
          return Left(failure);
        },
        (response) {
          final body = jsonDecode(response.body);
          final weather = WeatherDataModel.fromJson(body);

          return Right(weather.toWeatherDataEntity);
        },
      );

      return result;
    } catch (e) {
      return Left(ParseFailure('Failed to retrieve data. Error: $e'));
    }
  }
}
