import '../../domain/entites/hour_entity.dart';
import '../../domain/entites/weather_data_entity.dart';
import 'current_model.dart';
import 'forecast_model.dart';
import 'location_model.dart';

class WeatherDataModel {
  LocationModel? location;
  Current? current;
  Forecast? forecast;

  WeatherDataModel({this.location, this.current, this.forecast});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    try {
      location = json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null;
      current =
          json['current'] != null ? Current.fromJson(json['current']) : null;
      forecast =
          json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }

  WeatherDataEntity get toWeatherDataEntity {
    List<HourEntity> hourList = [];

    for (var value in forecast!.forecastday!) {
      for (var e in value.hour!) {
        hourList.add(e.toAntity);
      }
    }

    return WeatherDataEntity(
        dateTime: forecast!.forecastday![0].date!,
        sunRize: forecast!.forecastday![0].astro!.sunrise!,
        sunset: forecast!.forecastday![0].astro!.sunset!,
        localTime: location!.localtime!,
        localEpoch: location!.localtimeEpoch!,
        temperature: current!.tempC!,
        feelsLike: current!.feelslikeC!,
        humidity: current!.humidity!,
        pressure: current!.pressureMb!,
        windSpeed: current!.windKph!,
        windDegree: current!.windDegree!,
        windDirection: current!.windDir!,
        cloudCover: current!.cloud!,
        uv: current!.uv!,
        precipitation: forecast!.forecastday![0].day!.dailyChanceOfRain!,
        iconUrl: forecast!.forecastday![0].day!.condition!.icon!,
        hourList: hourList,
        locationName: location!.name!);
  }
}
