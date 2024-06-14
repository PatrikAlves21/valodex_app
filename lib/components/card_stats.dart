import 'package:flutter/material.dart';
import '../shared/app_colors.dart';

class CardStatsWidget extends StatelessWidget {
  final double padding;
  final Widget child;
  final EdgeInsets? margin;
  const CardStatsWidget(
      {super.key, required this.child, this.padding = 8, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: strokeColor,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
