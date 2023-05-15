import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'package:flutter_weather_app_clean/domain/interfaces/repositories/location_repo.dart';
import 'package:flutter_weather_app_clean/domain/use_cases/get_current_location_usecase.dart';
import 'package:flutter_weather_app_clean/foundation/failures/failure.dart';
import 'get_current_location_usecase_test.mocks.dart';

// Annotation which generates the get_current_location_usecase_test.mocks.dart library and the MockWeatherRepository class.
@GenerateNiceMocks([MockSpec<LocationRepository>()])
void main() {
  late MockLocationRepository mockRepository;

  late GetCurrentLocation useCase;

  setUp(() {
    mockRepository = MockLocationRepository();
    useCase = GetCurrentLocation(repository: mockRepository);
  });

  group('GetCurrentLocation', () {
    const tLatitude = 48.8566;
    const tLongitude = 2.3522;
    Position tPosition = Position(
      latitude: tLatitude,
      longitude: tLongitude,
      accuracy: 0.0,
      altitude: 0.0,
      timestamp: DateTime.now(),
      speedAccuracy: 0.0,
      speed: 0.0,
      heading: 0.0,
    );

    test(
        'should return Position object when the call to the repository is successful',
        () async {
      // arrange
      when(mockRepository.getCurrentLocation())
          .thenAnswer((_) async => Right<Failure, Position>(tPosition));

      // act
      final result = await useCase.execute();

      // assert
      expect(result, Right(tPosition));
      verify(mockRepository.getCurrentLocation());
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'should return a failure when the call to the repository is unsuccessful',
        () async {
      // arrange
      final tFailure = LocationFailure('Location Failure');
      when(mockRepository.getCurrentLocation())
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase.execute();

      // assert
      expect(result, Left(tFailure));
      verify(mockRepository.getCurrentLocation());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
