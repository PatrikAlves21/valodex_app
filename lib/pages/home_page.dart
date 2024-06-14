// ignore_for_file: use_full_hex_values_for_flutter_colors, use_build_context_synchronously

import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/app/app_routes.dart';
import 'package:app_valorant/components/agentContainer_widget.dart';
import 'package:app_valorant/components/loadinglists_widget.dart';
import 'package:app_valorant/components/scaffold_default.dart';
import 'package:app_valorant/models/listAgents_model.dart';
import 'package:app_valorant/models/enums.dart';
import 'package:app_valorant/shared/http_service.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/request_default_model.dart';
import '../shared/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HttpService get httpService => AppModule.to.getDependency<HttpService>();

  late Future<ListAgentsModel> agents;

  @override
  void initState() {
    agents = getListAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(
        selectedPage: SelectedPage.AGENTS,
        body: Container(
          color: backgroundPage,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: FutureBuilder<ListAgentsModel>(
              future: agents,
              builder: (BuildContext context,
                  AsyncSnapshot<ListAgentsModel> snapshot) {
                Widget children;
                if (snapshot.hasData) {
                  children = Column(
                    children: [
                      Row(
                        children: [
                          const Text('Agentes')
                              .h1(style: TextStyle(color: valorantPrimary)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                            children: snapshot.data!.data!
                                .map((agent) => AgentContainer(agent: agent))
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
                              color: textColorWhite,
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

  Future<ListAgentsModel> getListAgents() async {
    Response response = await httpService
        .get(AppRoutes.agents, queryParams: {...RequestDefault.payloadAgents});

    return ListAgentsModel.fromJson(response.data);
  }
}
