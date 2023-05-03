import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'presentation/routing/router.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.aquaBlue,
        scaffoldBackground: Colors.white,
        useMaterial3: true,
        primary: Colors.lightBlue,
      ),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.damask,
        useMaterial3: true,
        primary: Colors.yellow,
      ),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.config(),
      title: 'Weather',
    );
  }
}
