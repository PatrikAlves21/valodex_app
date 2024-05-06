import 'package:app_valorant/components/bottomsheetdefault_widget.dart';
import 'package:app_valorant/models/listAgents_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_colors.dart';

class DetailsAgentsModal extends StatelessWidget {
  final AgentModel agent;
  const DetailsAgentsModal({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return BottomSheetDefault(
        title: agent.displayName!,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    agent.description!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                  Image.network(
                    agent.fullPortrait!,
                    height: MediaQuery.sizeOf(context).height * 0.18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: agent.abilities!
                  .map((e) => abilityWidget(context, e))
                  .toList(),
            )
          ],
        ));
  }

  Widget abilityWidget(BuildContext context, Abilities ability) {
    return Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderCard.withOpacity(0.2),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ability.displayName!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                ability.displayIcon!,
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
            ),
            Text(
              ability.description!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
