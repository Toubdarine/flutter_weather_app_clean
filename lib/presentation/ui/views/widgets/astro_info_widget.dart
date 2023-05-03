import 'package:flutter/material.dart';

import '../../../../domain/entites/weather_data_entity.dart';
import 'app_container_widget.dart';

//Widget to show Astro information like sunries and sunset
class AstroInfo extends StatelessWidget {
  const AstroInfo({
    super.key,
    required this.width,
    required this.weatherDataEntity,
  });

  final double width;
  final WeatherDataEntity weatherDataEntity;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: width * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sun Rize'),
                Text(weatherDataEntity.sunRize)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Sun Set'), Text(weatherDataEntity.sunset)],
            ),
          ],
        ),
      ),
    );
  }
}
