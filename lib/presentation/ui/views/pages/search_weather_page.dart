import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

import '../../../../locator.dart';
import '../../../../domain/entites/weather_data_entity.dart';
import '../../../utils/app_gradient.dart';

import '../../view_model/search_view_model.dart';
import '../widgets/address_header_widget.dart';
import '../widgets/app_container_widget.dart';
import '../widgets/autocomplete_widget.dart';
import '../widgets/date_picker_widget.dart';
import '../widgets/error_card_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/search_button_widget.dart';
import '../widgets/weather_details_widget.dart';

@RoutePage()
class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color primaryColor = Theme.of(context).primaryColor.withOpacity(0.2);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: screenHeight,
        decoration: BoxDecoration(gradient: AppGradient.gradient(context)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              //Search page body
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: ChangeNotifierProvider(
                    create: (context) => locator.get<SearchViewModel>(),
                    builder: (context, child) => SizedBox(
                          height: screenHeight * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //User input widget
                              AppContainer(
                                height: screenHeight * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddressHeader(
                                      height: screenHeight * 0.08,
                                      width: double.infinity,
                                    ),
                                    AutoCompleteWidget(
                                      height: screenHeight * 0.08,
                                      width: double.infinity,
                                    ),
                                    LimitedDatePicker(
                                      height: screenHeight * 0.08,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              // Search response widget
                              Expanded(
                                child: Consumer<SearchViewModel>(
                                  builder: (context, viewModel, child) {
                                    Widget widget = Container();

                                    if (viewModel.isLoading) {
                                      widget = LoadingCard(
                                        height: screenHeight * 0.2,
                                      );
                                    } else if (viewModel
                                        .errorMessage.isNotEmpty) {
                                      widget = ErrorCard(
                                        height: screenHeight * 0.2,
                                        text: viewModel.errorMessage,
                                      );
                                    } else if (viewModel.weatherData == null) {
                                      widget = Container();
                                    } else if (viewModel.weatherData != null) {
                                      WeatherDataEntity weatherDataEntity =
                                          viewModel.weatherData!;
                                      widget = SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: WeatherDetails(
                                            height: screenHeight * 0.7,
                                            width: screenWidth,
                                            isCurrent: false,
                                            weatherDataEntity:
                                                weatherDataEntity),
                                      );
                                    }
                                    return widget;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              //Search button
                              SearchButton(
                                height: screenHeight * 0.07,
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
