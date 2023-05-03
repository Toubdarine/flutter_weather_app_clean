import 'package:flutter/material.dart';

import '../../../../domain/entites/weather_data_entity.dart';
import 'app_container_widget.dart';

//Widget used to show useful weath info
class OtherInfo extends StatelessWidget {
  const OtherInfo({
    super.key,
    required this.weatherDataEntity,
  });

  final WeatherDataEntity weatherDataEntity;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Humidity'),
                    Text('${weatherDataEntity.humidity}%')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Feels Like'),
                    Text('${weatherDataEntity.feelsLike}°')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text('UV'), Text('${weatherDataEntity.uv}')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Pressure'),
                    Text('${weatherDataEntity.pressure}mbar')
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
