import 'package:flutter/material.dart';

import 'app_container_widget.dart';

//Loading widget
class LoadingCard extends StatelessWidget {
  const LoadingCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        height: height,
        width: double.infinity,
        child: const Center(child: Text('Data is laoding ...')));
  }
}
