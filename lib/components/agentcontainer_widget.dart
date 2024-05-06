// ignore_for_file: file_names

import 'package:app_valorant/models/listAgents_model.dart';
import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgentContainer extends StatelessWidget {
  final AgentModel agent;
  const AgentContainer({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 56.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: strokeColor,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                agent.background!,
              ),
              Image.network(
                agent.displayIcon!,
              ),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(agent.displayName!).h2()),
          Image.network(
            agent.role!.displayIcon!,
            height: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget textTitleSubtitle(
      {required String? title, required String? subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subTitle ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
