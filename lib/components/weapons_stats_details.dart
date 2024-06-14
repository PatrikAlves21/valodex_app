import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_colors.dart';
import 'card_stats.dart';

class WeaponsStatsDetails extends StatelessWidget {
  final String title;
  final num value;
  final String description;
  final double percentage;
  const WeaponsStatsDetails(
      {super.key,
      required this.title,
      required this.value,
      required this.description,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return CardStatsWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title).h3(
            style: TextStyle(
              color: fontColorSecondary,
              fontSize: 20.sp,
            ),
          ),
          Text("$value").h2(
            style: TextStyle(
              color: valorantPrimary,
            ),
          ),
          Text(description).h3(
            style: TextStyle(
              color: fontColorSecondary,
              fontSize: 20.sp,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300]!,
            color: valorantPrimary,
            minHeight: 8.sp,
            value: (percentage / 100),
          ),
        ],
      ),
    );
  }
}
