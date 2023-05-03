import 'package:flutter/material.dart';
import '../../../../domain/entites/weather_data_entity.dart';
import '../../../utils/convert_helper.dart';
import 'app_container_widget.dart';
import 'direction_compass_widget.dart';

//Widget used to hold wind information
class WindDirection extends StatelessWidget {
  final double width;
  const WindDirection({
    super.key,
    required this.width,
    required this.weatherDataEntity,
  });

  final WeatherDataEntity weatherDataEntity;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Wind Direction'),
              DirectionCompass(
                value: weatherDataEntity.windDegree.toDouble(),

                // the value in degrees
                size: width * 0.4, // the size of the widget in pixels
                color: Colors.white, // the color of the border and arrow
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ConvertHelper.getReadableWindDirection(
                      weatherDataEntity.windDirection))
                ],
              )
            ],
          ),
        ));
  }
}
