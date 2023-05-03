import 'package:flutter/material.dart';
import 'dart:math';

//compass widget to show wind direction
class DirectionCompass extends StatelessWidget {
  final double value;
  final double size;
  final Color color;

  const DirectionCompass(
      {super.key,
      required this.value,
      required this.size,
      required this.color});

  @override
  Widget build(BuildContext context) {
    Color directionBackground = Theme.of(context).scaffoldBackgroundColor;
    double angle = (value * pi / 180) + pi;
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 1),
              ),
            ),
            Positioned(
              top: 0,
              left: size * 0.4,
              child: Container(
                color: const Color.fromRGBO(244, 67, 54, 0.408),
                width: size * 0.2,
                height: size * 0.2,
                child: Center(
                  child: Text(
                    'N',
                    style: TextStyle(
                      fontSize: size / 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.4,
              left: 0,
              child: Container(
                color: directionBackground,
                width: size * 0.2,
                height: size * 0.2,
                child: Center(
                  child: Text(
                    'W',
                    style: TextStyle(
                      fontSize: size / 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.4,
              right: 0,
              child: Container(
                color: directionBackground,
                width: size * 0.2,
                height: size * 0.2,
                child: Center(
                  child: Text(
                    'E',
                    style: TextStyle(
                      fontSize: size / 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: size * 0.4,
              child: Container(
                color: directionBackground,
                width: size * 0.2,
                height: size * 0.2,
                child: Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      fontSize: size / 7,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: angle,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size / 2,
                  child: const Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
