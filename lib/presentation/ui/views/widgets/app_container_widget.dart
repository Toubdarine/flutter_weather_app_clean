import 'package:flutter/material.dart';

// App Container used to hold most of the ui components
class AppContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;

  const AppContainer({
    super.key,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
