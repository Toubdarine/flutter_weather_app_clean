import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';
import '../../../utils/app_gradient.dart';

import '../../view_model/weather_view_model.dart';
import '../widgets/error_card_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/weather_details_widget.dart';

@RoutePage()
class DefaultWeatherPage extends StatefulWidget {
  const DefaultWeatherPage({super.key});

  @override
  State<DefaultWeatherPage> createState() => _DefaultWeatherPageState();
}

class _DefaultWeatherPageState extends State<DefaultWeatherPage> {
  @override
  void initState() {
    super.initState();
    locator.get<WeatherViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return RefreshIndicator(
        onRefresh: () => locator.get<WeatherViewModel>().fetchWeatherData(
              locator.get<WeatherViewModel>().currentPosition!.latitude,
              locator.get<WeatherViewModel>().currentPosition!.longitude,
            ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ChangeNotifierProvider(
              create: (context) => locator.get<WeatherViewModel>(),
              builder: (context, child) => Container(
                    decoration:
                        BoxDecoration(gradient: AppGradient.gradient(context)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.1,
                          ),
                          SizedBox(
                            height: screenHeight * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // page body
                                  Consumer<WeatherViewModel>(
                                    builder: (context, viewModel, child) {
                                      Widget widget = Container();

                                      if (viewModel.isLoading) {
                                        widget = LoadingCard(
                                            height: screenHeight * 0.2);
                                      } else if (viewModel
                                          .errorMessage.isNotEmpty) {
                                        widget = ErrorCard(
                                          height: screenHeight * 0.2,
                                          text: viewModel.errorMessage,
                                        );
                                      } else if (viewModel.weatherData !=
                                          null) {
                                        widget = WeatherDetails(
                                            height: screenHeight * 0.8,
                                            width: screenWidth,
                                            isCurrent: true,
                                            weatherDataEntity:
                                                viewModel.weatherData!);
                                      }
                                      return widget;
                                    },
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
