import 'package:app_valorant/components/card_stats.dart';
import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/damage_model.dart';

class WeaponsStatsDamage extends StatelessWidget {
  final DamageConfigModel data;
  const WeaponsStatsDamage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(data.title!).h2(
        style: TextStyle(color: fontColorSecondary),
      ),
      const Expanded(child: SizedBox())
    ];

    children.addAll(data.values!.map((value) => texts(value)).toList());

    return CardStatsWidget(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: children),
    );
  }

  Widget texts(ValuesDamageModel value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(formatNumber(value.value!))
              .h2(style: TextStyle(color: valorantPrimary)),
          Text("${value.description}")
              .h4(style: TextStyle(color: fontColorSecondary))
        ],
      ),
    );
  }

  String formatNumber(num num) {
    String format = num.toString();
    if (format.contains('.')) {
      final NumberFormat formatter = NumberFormat("0.0");

      return formatter.format(num.toDouble()).replaceAll(',', '.');
    }

    return format;
  }
}
