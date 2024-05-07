// ignore_for_file: file_names

import 'package:app_valorant/components/details_agents_page.dart';
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
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed("/detailsAgents");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 62.sp,
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
            Image.network(
              agent.displayIcon!,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(agent.displayName!).h2()),
            Image.network(
              agent.role!.displayIcon!,
              height: 20.sp,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Icon(
                Icons.arrow_forward_ios,
                color: valorantPrimary,
                size: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
