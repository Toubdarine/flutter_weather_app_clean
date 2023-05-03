import 'package:auto_route/auto_route.dart';

import '../ui/views/pages/default_weather_page.dart';
import '../ui/views/pages/home_page.dart';
import '../ui/views/pages/search_weather_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          CustomRoute(
              page: SearchWeatherRoute.page,
              transitionsBuilder: TransitionsBuilders.slideRightWithFade),
          CustomRoute(
              page: DefaultWeatherRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade)
        ]),
      ];
}
