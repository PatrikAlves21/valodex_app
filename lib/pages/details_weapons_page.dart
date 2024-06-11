import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/weapons_model.dart';
import '../shared/app_colors.dart';

class DetailsWeaponsPage extends StatefulWidget {
  final dynamic arguments;
  const DetailsWeaponsPage(this.arguments, {super.key});

  @override
  State<DetailsWeaponsPage> createState() => _DetailsWeaponsPageState();
}

class _DetailsWeaponsPageState extends State<DetailsWeaponsPage> {
  late WeaponsModel weapons;

  @override
  void initState() {
    weapons = widget.arguments['arguments'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: Stack(
        children: <Widget>[
          Container(
            color: fontColorPrimary,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            decoration: BoxDecoration(color: backgroundPage),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.25,
          ),
          Container(
              margin: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.08,
              ),
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.14),
                    child: Image.network(
                      weapons.displayIcon!,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.2,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: fontColorPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  topRight: Radius.circular(16.sp),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(weapons.displayName!)
                          .h1(style: TextStyle(color: valorantPrimary)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('ESTATÍSTICAS').h2(
                        style: TextStyle(
                            color: fontColorSecondary, fontSize: 24.sp),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
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
      ),
    );
  }
}
