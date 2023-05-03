import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../domain/entites/weather_data_entity.dart';
import '../../../domain/use_cases/get_current_weather_usecase.dart';
import '../../../domain/use_cases/get_current_location_usecase.dart';

//ViewModel used to get the current Weather info and manages some states
class WeatherViewModel extends ChangeNotifier {
  final GetCurrentWeather getCurrentWeather;
  final GetCurrentLocation getCurrentLocation;
  WeatherViewModel({
    required this.getCurrentWeather,
    required this.getCurrentLocation,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  WeatherDataEntity? _weatherData;
  WeatherDataEntity? get weatherData => _weatherData;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> init() async {
    await getCurrentPosition();
    if (_currentPosition != null) {
      await fetchWeatherData(
          _currentPosition!.latitude, _currentPosition!.longitude);
    }
  }

  Future<void> getCurrentPosition() async {
    _isLoading = true;
    notifyListeners();
    final result = await getCurrentLocation.execute();

    result.fold(
      (failure) {
        _errorMessage = failure.props[0].toString();
      },
      (data) {
        _currentPosition = data;
      },
    );
  }

  Future<void> fetchWeatherData(double lat, double lon) async {
    if (!_isLoading) {
      _isLoading = true;
    }
    _errorMessage = '';
    notifyListeners();

    final result = await getCurrentWeather.execute(lat, lon);

    result.fold(
      (failure) {
        _errorMessage = failure.toString();
        _isLoading = false;
        notifyListeners();
      },
      (data) {
        _weatherData = data;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
