import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../../../routing/router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return AutoTabsScaffold(
      animationDuration: const Duration(milliseconds: 300),
      routes: const [
        DefaultWeatherRoute(),
        SearchWeatherRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: primaryColor,
          selectedIconTheme: IconThemeData(color: primaryColor),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
          ],
        );
      },
    );
  }
}
