import 'package:flutter/material.dart';

import '../../../../domain/entites/weather_data_entity.dart';
import 'app_container_widget.dart';
import 'hour_forecast_card_widget.dart';

//Widget used as place holder  HourForecasteWidget
class DailyForecasteCard extends StatelessWidget {
  final double height;
  final double width;
  final WeatherDataEntity weatherData;
  final bool isCurrent;
  const DailyForecasteCard({
    super.key,
    required this.height,
    required this.width,
    required this.weatherData,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: height,
      width: double.infinity,
      child: Center(
          child: weatherData.hourList.isNotEmpty
              ? HourForecaste(
                  height: height,
                  width: width,
                  isCurrent: isCurrent,
                  weatherDate: weatherData,
                )
              : Container()),
    );
  }
}
