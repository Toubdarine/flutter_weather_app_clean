class HourEntity {
  final String dateTime;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double pressure;
  final double windSpeed;
  final String windDirection;
  final String iconUrl;
  final int chanceOfRain;
  final String timeEpoch;
  HourEntity(
      {required this.dateTime,
      required this.chanceOfRain,
      required this.temperature,
      required this.feelsLike,
      required this.humidity,
      required this.timeEpoch,
      required this.pressure,
      required this.windSpeed,
      required this.windDirection,
      required this.iconUrl});
}
