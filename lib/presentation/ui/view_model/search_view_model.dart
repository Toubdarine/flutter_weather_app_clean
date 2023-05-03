import 'package:flutter/material.dart';

import '../../../domain/entites/address_entity.dart';
import '../../../domain/use_cases/get_auto_completion_usecase.dart';
import '../../../domain/use_cases/get_forecast_usecase.dart';
import '../../../domain/entites/weather_data_entity.dart';

//ViewModel used to get input auto completion and future forecast manages some states
class SearchViewModel extends ChangeNotifier {
  final GetForecast forecastUseCase;
  final GetAutoCompletion autoCompletionUseCase;

  SearchViewModel(
      {required this.forecastUseCase, required this.autoCompletionUseCase});

  bool _isLoading = false;
  String _targetDate = '';
  String _errorMessage = '';
  WeatherDataEntity? _weatherData;
  AddressEntity? _targetAddress;
  List<AddressEntity> _suggestionList = [];

//Setters
  void setTargetDate(String date) {
    _targetDate = date;
    notifyListeners();
  }

  void setTargetAddress(AddressEntity address) {
    _targetAddress = address;
    notifyListeners();
  }

// Getters
  bool get isLoading => _isLoading;
  String? get targetDate => _targetDate;
  String get errorMessage => _errorMessage;
  List<AddressEntity> get suggestionList => _suggestionList;
  WeatherDataEntity? get weatherData => _weatherData;
  AddressEntity? get targetAddress => _targetAddress;

  Future<void> getForecast(double lat, double lon, String date) async {
    if (!_isLoading) {
      _isLoading = true;
    }
    _errorMessage = '';
    notifyListeners();

    final result = await forecastUseCase.execute(lat, lon, date);

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
    notifyListeners();
  }

  Future<void> getAutoCompletion(String text) async {
    _errorMessage = '';
    notifyListeners();
    _suggestionList = [];

    _weatherData = null;

    notifyListeners();
    final result = await autoCompletionUseCase.execute(text);

    result.fold(
      (failure) {
        _errorMessage = failure.toString();

        notifyListeners();
      },
      (data) {
        _suggestionList = data;

        notifyListeners();
      },
    );
    notifyListeners();
  }
}
