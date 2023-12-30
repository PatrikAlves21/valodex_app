// ignore_for_file: use_full_hex_values_for_flutter_colors, use_build_context_synchronously

import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/app/app_routes.dart';
import 'package:app_valorant/components/loadingLists_widget.dart';
import 'package:app_valorant/components/scaffold_default.dart';
import 'package:app_valorant/models/listAgents_model.dart';
import 'package:app_valorant/models/requestDefault_model.dart';
import 'package:app_valorant/models/selected_page.dart';
import 'package:app_valorant/shared/colors.dart';
import 'package:app_valorant/shared/http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rxdart/subjects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService get httpService => AppModule.to.getDependency<HttpService>();

  BehaviorSubject<bool> loading = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> loadingListAgents = BehaviorSubject.seeded(false);

  @override
  void initState() {
    getListAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
        selectedPage: SelectedPage.AGENTS,
        body: Container(
          color: backgroundPage,
          padding: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: FutureBuilder<ListAgentsModel>(
              future: getListAgents(),
              builder: (BuildContext context,
                  AsyncSnapshot<ListAgentsModel> snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  children = Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Agentes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                            children: snapshot.data!.data!
                                .map((agent) => agentContainer(agent))
                                .toList()),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  children = Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            'Ocorreu um erro ao carregar as informações.',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]);
                } else {
                  children = const LoadingListWidget();
                }
                return children;
              }),
        ));
  }

  Widget agentContainer(AgentModel agent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                .map((color) => HexColor(color).withOpacity(0.4))
                .toList()),
      ),
      height: 90,
      width: MediaQuery.sizeOf(context).width,
    );
  }

  Future<ListAgentsModel> getListAgents() async {
    loadingListAgents.add(true);

    Response response = await httpService
        .get(AppRoutes.agents, queryParams: {...RequestDefault.payloadAgents});

    return ListAgentsModel.fromJson(response.data);
  }
}
