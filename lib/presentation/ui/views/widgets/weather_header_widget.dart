import 'package:flutter/material.dart';

import '../../../../domain/entites/weather_data_entity.dart';
import 'app_container_widget.dart';

//Widget used as a header in WeatherDetailsWidget
class WeatherHeader extends StatelessWidget {
  const WeatherHeader({
    super.key,
    required this.weatherDataEntity,
  });

  final WeatherDataEntity weatherDataEntity;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 100,
      width: double.infinity,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weatherDataEntity.locationName} ${weatherDataEntity.temperature}°',
            style: const TextStyle(fontSize: 22),
          ),
          Text('${weatherDataEntity.dateTime} '),
        ],
      )),
    );
  }
}
