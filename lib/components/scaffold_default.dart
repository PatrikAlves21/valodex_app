import 'package:app_valorant/components/main_Drawer.dart';
import 'package:app_valorant/models/selected_page.dart';
import 'package:app_valorant/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: textGrey,
            height: 1.0,
          ),
        ),
        iconTheme: IconThemeData(
          color: textGrey,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          color: Colors.white,
          allowDrawingOutsideViewBox: true,
          width: MediaQuery.sizeOf(context).height * 0.07,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
