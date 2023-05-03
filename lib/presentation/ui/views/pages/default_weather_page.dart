import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DefaultWeatherPage extends StatefulWidget {
  const DefaultWeatherPage({super.key});

  @override
  State<DefaultWeatherPage> createState() => _DefaultWeatherPageState();
}

class _DefaultWeatherPageState extends State<DefaultWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
