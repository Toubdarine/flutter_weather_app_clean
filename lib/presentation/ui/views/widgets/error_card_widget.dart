import 'package:flutter/material.dart';
import 'app_container_widget.dart';

//Widget used to show errors to the user
class ErrorCard extends StatelessWidget {
  const ErrorCard({
    super.key,
    required this.height,
    required this.text,
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: double.infinity,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.warning,
            color: Colors.red,
          ),
          Text(text),
        ],
      ),
    );
  }
}
