import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:flutter_weather_app_clean/domain/entites/weather_data_entity.dart';
import 'package:flutter_weather_app_clean/domain/use_cases/get_forecast_usecase.dart';
import 'package:flutter_weather_app_clean/foundation/failures/failure.dart';
import 'get_current_weather_usecase_test.mocks.dart';

void main() {
  late MockWeatherRepository mockRepository;

  late GetForecast useCase;

  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetForecast(repository: mockRepository);
  });

  group('GetCurrentWeather', () {
    const tLatitude = 48.8566;
    const tLongitude = 2.3522;
    const tDate = '2023-05-12';
    WeatherDataEntity tWeatherData = WeatherDataEntity(
        dateTime: tDate,
        locationName: "Paris",
        localTime: "2023-05-12 16:52",
        localEpoch: '1683903135',
        sunRize: "06:13 AM",
        sunset: "09:22 PM",
        temperature: 13.0,
        feelsLike: 11.8,
        humidity: 77,
        pressure: 1017.0,
        windSpeed: 15.1,
        windDegree: 330,
        windDirection: "NNW",
        cloudCover: 100,
        uv: 3.0,
        precipitation: 69,
        iconUrl: "cdn.weatherapi.com/weather/64x64/day/122.png",
        hourList: []);

    test(
        'should return weather data when the call to the repository is successful',
        () async {
      // arrange
      when(mockRepository.getWeatherForecaste(tLatitude, tLongitude, tDate))
          .thenAnswer(
              (_) async => Right<Failure, WeatherDataEntity>(tWeatherData));

      // act
      final result = await useCase.execute(tLatitude, tLongitude, tDate);

      // assert
      expect(result, Right(tWeatherData));
      verify(mockRepository.getWeatherForecaste(tLatitude, tLongitude, tDate));
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'should return a failure when the call to the repository is unsuccessful',
        () async {
      // arrange
      final tFailure = ServerFailure('Server Failure');
      when(mockRepository.getWeatherForecaste(tLatitude, tLongitude, tDate))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase.execute(tLatitude, tLongitude, tDate);

      // assert
      expect(result, Left(tFailure));
      verify(mockRepository.getWeatherForecaste(tLatitude, tLongitude, tDate));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
