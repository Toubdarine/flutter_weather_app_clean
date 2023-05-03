import 'forecast_day_model.dart';

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    try {
      if (json['forecastday'] != null) {
        forecastday = <Forecastday>[];
        json['forecastday'].forEach((v) {
          forecastday!.add(Forecastday.fromJson(v));
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] = forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
