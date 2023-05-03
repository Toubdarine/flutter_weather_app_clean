import 'package:flutter/material.dart';

import '../../../../domain/entites/hour_entity.dart';

// hour forecast item
class HourForecastItem extends StatelessWidget {
  const HourForecastItem({
    super.key,
    required this.height,
    required this.width,
    required this.hourData,
  });
  final HourEntity hourData;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: height,
      width: width * 0.2,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(hourData.dateTime.substring(11)),
        Image.network(
          'https:${hourData.iconUrl}',
          height: height * 0.2,
        ),
        Text('${hourData.feelsLike}°'),
        Text('${hourData.chanceOfRain}%'),
        Text('${hourData.windSpeed}km/h'),
      ]),
    );
  }
}
