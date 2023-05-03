// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DefaultWeatherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DefaultWeatherPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SearchWeatherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchWeatherPage(),
      );
    },
  };
}

/// generated route for
/// [DefaultWeatherPage]
class DefaultWeatherRoute extends PageRouteInfo<void> {
  const DefaultWeatherRoute({List<PageRouteInfo>? children})
      : super(
          DefaultWeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'DefaultWeatherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchWeatherPage]
class SearchWeatherRoute extends PageRouteInfo<void> {
  const SearchWeatherRoute({List<PageRouteInfo>? children})
      : super(
          SearchWeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchWeatherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
