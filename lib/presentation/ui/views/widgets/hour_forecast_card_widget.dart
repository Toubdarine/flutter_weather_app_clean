import 'package:flutter/material.dart';

import '../../../../domain/entites/weather_data_entity.dart';
import 'hour_forecast_item_widget.dart';

//widget used to show 24 hours forcaste
class HourForecaste extends StatelessWidget {
  final WeatherDataEntity weatherDate;
  final double height;
  final double width;
  //Variable used to determines the way hour forecast items are showed
  final bool isCurrent;
  const HourForecaste({
    required this.weatherDate,
    required this.isCurrent,
    required this.height,
    required this.width,
    super.key,
  });
  List<Widget> hourItem(WeatherDataEntity weatherData) {
    List<Widget> list = [];
    var hourList = [];

//If the user wants a current weather the 24 hours forecast will start from the current time,
//To get future forcaste the 24 hours forecast starts from 00:00
    DateTime referenceTime = DateTime.fromMillisecondsSinceEpoch(
        int.parse(weatherDate.localEpoch) * 1000);
    hourList = isCurrent
        ? weatherDate.hourList.where((element) {
            DateTime elementTimeEpoch = DateTime.fromMillisecondsSinceEpoch(
                int.parse(element.timeEpoch) * 1000);
            int diffrence = elementTimeEpoch.difference(referenceTime).inHours;
            return diffrence >= 0 && diffrence <= 23;
          }).toList()
        : weatherDate.hourList;

    list = hourList.map((e) {
      return HourForecastItem(
        height: height,
        width: width,
        hourData: e,
      );
    }).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: height * 0.15,
            width: double.infinity,
            child: const Center(
                child: Text(
              '24 hours forecast',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(
            width: width,
            height: height * 0.8,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [...hourItem(weatherDate)],
              ),
            ),
          )
        ]));
  }
}
