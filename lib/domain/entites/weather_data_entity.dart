import 'hour_entity.dart';

class WeatherDataEntity {
  final String dateTime;
  final String sunRize;
  final String sunset;
  final double temperature;
  String localEpoch;
  final double feelsLike;
  final int humidity;
  final double pressure;
  final double windSpeed;
  final int windDegree;
  final String windDirection;
  final int cloudCover;
  final double uv;
  final String locationName;
  final String localTime;
  final int precipitation;
  final String iconUrl;
  final List<HourEntity> hourList;
  WeatherDataEntity(
      {required this.dateTime,
      required this.locationName,
      required this.localTime,
      required this.localEpoch,
      required this.sunRize,
      required this.sunset,
      required this.temperature,
      required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.windSpeed,
      required this.windDegree,
      required this.windDirection,
      required this.cloudCover,
      required this.uv,
      required this.precipitation,
      required this.iconUrl,
      required this.hourList});
}
