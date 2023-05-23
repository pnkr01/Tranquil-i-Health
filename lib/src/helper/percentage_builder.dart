import 'package:flutter/material.dart';

class PercentageContainer extends StatelessWidget {
  final double percentage;
  final Color color;

  const PercentageContainer(
      {super.key, required this.percentage, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey, // Default color if no percentage is provided
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final filledWidth = constraints.maxWidth * (percentage / 100);
          return Stack(
            children: [
              Container(
                width: filledWidth,
                color: color,
              ),
            ],
          );
        },
      ),
    );
  }
}
