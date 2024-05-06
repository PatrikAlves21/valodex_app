import 'package:app_valorant/components/main_Drawer.dart';
import 'package:app_valorant/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../shared/app_colors.dart';

class ScaffoldDefault extends StatefulWidget {
  @required
  final SelectedPage? selectedPage;
  final Widget? body;

  const ScaffoldDefault({
    super.key,
    this.body,
    this.selectedPage,
  });

  @override
  ScaffoldDefaultState createState() => ScaffoldDefaultState();
}

class ScaffoldDefaultState extends State<ScaffoldDefault> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundPage,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: fontColorPrimary,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          allowDrawingOutsideViewBox: true,
          width: MediaQuery.sizeOf(context).height * 0.15,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: widget.body,
      endDrawer: SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.5,
        child: Drawer(
          child: MainDrawer(
            widget.selectedPage,
          ),
        ),
      ),
    );
  }
}
