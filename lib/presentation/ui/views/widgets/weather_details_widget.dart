import 'package:flutter/material.dart';
import 'astro_info_widget.dart';
import 'other_info_widget.dart';
import 'weather_header_widget.dart';

import '../../../../domain/entites/weather_data_entity.dart';

import 'daily_forcaste_widget.dart';
import 'wind_direction_widget.dart';

//Body widget used to hold all the widgets that shows desired weather information
class WeatherDetails extends StatelessWidget {
  final bool isCurrent;
  final double height;
  final double width;
  const WeatherDetails({
    super.key,
    required this.height,
    required this.width,
    required this.isCurrent,
    required this.weatherDataEntity,
  });

  final WeatherDataEntity weatherDataEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(children: [
        WeatherHeader(weatherDataEntity: weatherDataEntity),
        const SizedBox(
          height: 10,
        ),
        DailyForecasteCard(
          height: height * 0.35,
          width: width,
          isCurrent: isCurrent,
          weatherData: weatherDataEntity,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height * 0.4,
          width: width,
          child: Row(children: [
            SizedBox(
              height: height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: WindDirection(
                        weatherDataEntity: weatherDataEntity,
                        width: width * 0.40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Astro Info
                  Expanded(
                    flex: 2,
                    child: AstroInfo(
                        width: width, weatherDataEntity: weatherDataEntity),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //Usful weather info
            Expanded(child: OtherInfo(weatherDataEntity: weatherDataEntity))
          ]),
        ),
      ]),
    );
  }
}
