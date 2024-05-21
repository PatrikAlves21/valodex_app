import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/subjects.dart';
import '../models/listAgents_model.dart';
import '../shared/app_colors.dart';

class AgentDetailsPage extends StatefulWidget {
  final dynamic arguments;
  const AgentDetailsPage(this.arguments, {super.key});

  @override
  State<AgentDetailsPage> createState() => _AgentDetailsPageState();
}

class _AgentDetailsPageState extends State<AgentDetailsPage> {
  late AgentModel agent;

  final BehaviorSubject<AbilitiesModel?> streamAblilities =
      BehaviorSubject.seeded(null);

  @override
  void initState() {
    agent = widget.arguments['arguments'];
    streamAblilities.add(agent.abilities!.first);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
              forceMaterialTransparency: false,
              backgroundColor: backgroundPage,
              primary: false,
              titleSpacing: 0,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: backgroundWidget(),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: fontColorPrimary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.sp),
              topRight: Radius.circular(16.sp),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                header(agent),
                const SizedBox(
                  height: 16,
                ),
                body(agent),
                const SizedBox(
                  height: 16,
                ),
                textAbilities()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(AgentModel agent) {
    return Column(
      children: [
        Text(agent.displayName!).h1(
          style: TextStyle(color: valorantPrimary),
        ),
        Row(
          children: [
            const Text('FUNÇÃO').h2(
              style: TextStyle(color: fontColorSecondary, fontSize: 24.sp),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Image.network(
              agent.role!.displayIcon!,
              color: fontColorTerciary,
              height: 20.sp,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(agent.role!.displayName!).cardDetails(),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const Text('BIOGRAFIA').h2(
              style: TextStyle(color: fontColorSecondary, fontSize: 24.sp),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Text(agent.description!).cardDetails(),
            )
          ],
        )
      ],
    );
  }

  Widget body(AgentModel agent) {
    return Column(
      children: [
        Row(
          children: [
            const Text('HABILIDADES ESPECIAIS').h2(
              style: TextStyle(color: fontColorSecondary, fontSize: 24.sp),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: agent.abilities!
              .map((ability) => cardAbilities(ability))
              .toList(),
        )
      ],
    );
  }

  Widget cardAbilities(AbilitiesModel ablities) {
    return StreamBuilder(
      stream: streamAblilities,
      builder: (context, snapshot) {
        bool isSelected =
            (ablities.slot! == streamAblilities.valueOrNull?.slot);
        return InkWell(
          onTap: () => streamAblilities.add(ablities),
          child: Container(
            width: 60.sp,
            height: 60.sp,
            decoration: BoxDecoration(
              color: isSelected ? valorantPrimary : null,
              border: Border.all(
                color: isSelected ? valorantPrimary : strokeColor,
                style: BorderStyle.solid,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                ablities.displayIcon!,
                color: isSelected ? Colors.white : fontColorTerciary,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget textAbilities() {
    return StreamBuilder(
      stream: streamAblilities,
      builder: (context, snapshot) {
        return Text(streamAblilities.valueOrNull?.description ?? '')
            .cardDetails();
      },
    );
  }

  Widget backgroundWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: backgroundPage),
        ),
        Image.network(
          agent.background!,
          fit: BoxFit.cover,
          color: const Color.fromARGB(34, 255, 255, 255),
        ),
        Image.network(
          agent.fullPortrait!,
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        Positioned(
          top: 48.sp,
          left: 16.sp,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: valorantPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
