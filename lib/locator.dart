import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'domain/interfaces/network/api_client.dart';
import 'domain/interfaces/network/network_info.dart';
import 'domain/use_cases/get_auto_completion_usecase.dart';
import 'presentation/ui/view_model/search_view_model.dart';
import 'presentation/ui/view_model/weather_view_model.dart';
import 'data/api/api_client_impl.dart';
import 'data/repositories/autocomplete_repo_impl.dart';
import 'data/repositories/location_repo_impl.dart';
import 'data/repositories/weather_repo_impl.dart';
import 'domain/interfaces/repositories/autocomplete_repo.dart';
import 'domain/interfaces/repositories/location_repo.dart';
import 'domain/interfaces/repositories/weather_repo.dart';
import 'domain/use_cases/get_current_location_usecase.dart';
import 'domain/use_cases/get_current_weather_usecase.dart';
import 'domain/use_cases/get_forecast_usecase.dart';

import 'data/api/network_info_impl.dart';

final locator = GetIt.instance;

void setupLocator() {
  //NetworkInfo Registration
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // ApiClient Registration
  locator.registerLazySingleton<ApiClient>(
      () => ApiClientImpl(networkInfo: locator.get<NetworkInfo>()));

  //Repositories Registration
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(locator.get<ApiClient>()));

  locator.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl());

  locator.registerLazySingleton<AutoCompleteRepository>(
      () => AutoCompleteRepositoryImpl(locator.get<ApiClient>()));

  //UseCases Registration
  locator.registerLazySingleton(
      () => GetCurrentWeather(repository: locator.get<WeatherRepository>()));

  locator.registerLazySingleton<GetCurrentLocation>(() => GetCurrentLocation(
        repository: locator.get<LocationRepository>(),
      ));

  locator.registerFactory<GetAutoCompletion>(() => GetAutoCompletion(
        repository: locator.get<AutoCompleteRepository>(),
      ));

  locator.registerLazySingleton<GetForecast>(() => GetForecast(
        repository: locator.get<WeatherRepository>(),
      ));

  //ViewModels Registration
  locator.registerLazySingleton<WeatherViewModel>(() => WeatherViewModel(
        getCurrentWeather: locator.get<GetCurrentWeather>(),
        getCurrentLocation: locator.get<GetCurrentLocation>(),
      ));

  locator.registerLazySingleton<SearchViewModel>(() => SearchViewModel(
        forecastUseCase: locator.get<GetForecast>(),
        autoCompletionUseCase: locator.get<GetAutoCompletion>(),
      ));
}
