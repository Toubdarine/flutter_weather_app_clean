import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app_clean/presentation/ui/views/widgets/direction_compass_widget.dart';

void main() {
  testWidgets('DirectionCompass displays correctly',
      (WidgetTester tester) async {
    const key = Key('test-direction-compass');
    const double value = 45.0;
    const double size = 100.0;
    const MaterialColor color = Colors.blue;
    const compassWidget = DirectionCompass(
      key: key,
      value: value,
      size: size,
      color: color,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: compassWidget,
        ),
      ),
    );

    final compassFinder = find.byKey(key);

    expect(compassFinder, findsOneWidget);
    expect(compassWidget.value, value);
    expect(compassWidget.size, size);
    expect(compassWidget.color, color);
  });
}
