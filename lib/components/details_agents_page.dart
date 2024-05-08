import 'package:flutter/material.dart';

import '../models/listAgents_model.dart';

class AgentDetailsPage extends StatefulWidget {
  final dynamic arguments;
  const AgentDetailsPage(this.arguments, {super.key});

  @override
  State<AgentDetailsPage> createState() => _AgentDetailsPageState();
}

class _AgentDetailsPageState extends State<AgentDetailsPage> {
  late AgentModel agent;

  @override
  void initState() {
    agent = widget.arguments['arguments'];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
              collapsedHeight: MediaQuery.sizeOf(context).height * 0.12,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: Container(height: 200, child: Text("")),
                  background: backgroundWidget()),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50, // Exemplo de 50 itens na lista
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget backgroundWidget() {
    return Container(
      color: Colors.red,
    );
  }
}
