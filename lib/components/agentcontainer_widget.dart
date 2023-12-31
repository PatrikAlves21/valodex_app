// ignore_for_file: file_names

import 'package:app_valorant/models/listAgents_model.dart';
import 'package:app_valorant/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AgentContainer extends StatelessWidget {
  final AgentModel agent;
  const AgentContainer({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderCard.withOpacity(0.2),
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: agent.backgroundGradientColors!
                .map((color) => HexColor(color).withOpacity(0.6))
                .toList()),
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  agent.displayIcon!,
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
