import 'package:app_valorant/components/card_stats.dart';
import 'package:flutter/material.dart';

class WeaponsStatsDamage extends StatelessWidget {
  final Map<String, dynamic> data;
  const WeaponsStatsDamage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CardStatsWidget(
      child: Row(
        children: [],
      ),
    );
  }
}
