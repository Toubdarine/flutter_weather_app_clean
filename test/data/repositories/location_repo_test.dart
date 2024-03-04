import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app_clean/data/repositories/location_repo_impl.dart';
import 'package:flutter_weather_app_clean/domain/interfaces/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_weather_app_clean/foundation/failures/failure.dart';

// Annotation which generates the get_auto_complete_repo_test.mocks.dart library and the MockWeatherRepository class.
@GenerateNiceMocks([MockSpec<IGeolocator>()])
import 'location_repo_test.mocks.dart';

void main() {
  group('LocationRepositoryImpl', () {
    late LocationRepositoryImpl locationRepository;
    late MockIGeolocator mockGeolocator;

    setUpAll(() {
      WidgetsFlutterBinding
          .ensureInitialized(); // Ensure that Flutter is initialized

      mockGeolocator = MockIGeolocator();
      locationRepository = LocationRepositoryImpl(mockGeolocator);
    });

    test(
        'should return position when location services and permissions are enabled',
        () async {
      // Arrange
      final position = Position(
        latitude: 37.4219999,
        longitude: -122.0840575,
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        timestamp: DateTime.now(),
        altitudeAccuracy: 1.0,
        headingAccuracy: 1.0,
      );
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(mockGeolocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.always);
      when(mockGeolocator.getCurrentPosition())
          .thenAnswer((_) async => position);

      // Act
      final result = await locationRepository.getCurrentLocation();

      // Assert
      expect(result, Right(position));
      verify(mockGeolocator.isLocationServiceEnabled());
      verify(mockGeolocator.checkPermission());
      verify(mockGeolocator.getCurrentPosition());
      verifyNoMoreInteractions(mockGeolocator);
    });

    test('should return failure when location services are disabled', () async {
      // Arrange
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => false);

      // Act
      final result = await locationRepository.getCurrentLocation();

      // Assert
      expect(result, Left(LocationFailure('Location services are disabled.')));
      verify(mockGeolocator.isLocationServiceEnabled());
      verifyNoMoreInteractions(mockGeolocator);
    });

    test('should return failure when location permissions are denied',
        () async {
      // Arrange
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(mockGeolocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.denied);

      // Act
      final result = await locationRepository.getCurrentLocation();

      // Assert
      expect(result, Left(LocationFailure('Location permissions are denied')));
      verify(mockGeolocator.isLocationServiceEnabled());
      verify(mockGeolocator.checkPermission());
    });

    test(
        'should return failure when location permissions are permanently denied',
        () async {
      // Arrange
      when(mockGeolocator.isLocationServiceEnabled())
          .thenAnswer((_) async => true);
      when(mockGeolocator.checkPermission())
          .thenAnswer((_) async => LocationPermission.deniedForever);

      // Act
      final result = await locationRepository.getCurrentLocation();

      // Assert
      expect(
          result,
          Left(LocationFailure(
              'Location permissions are permanently denied, we cannot request permissions.')));
      verify(mockGeolocator.isLocationServiceEnabled());
      verify(mockGeolocator.checkPermission());
    });
  });
}
