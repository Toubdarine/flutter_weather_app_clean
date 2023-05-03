import 'package:flutter/material.dart';

//App Gradient
class AppGradient {
  static Gradient gradient(BuildContext context) {
    return LinearGradient(colors: [
      Theme.of(context).scaffoldBackgroundColor,
      Theme.of(context).scaffoldBackgroundColor.withBlue(200),
    ], end: Alignment.topRight, begin: Alignment.centerLeft);
  }
}
