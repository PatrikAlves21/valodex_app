import 'package:app_valorant/models/maps_model.dart';
import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsMapsPage extends StatefulWidget {
  final dynamic arguments;
  const DetailsMapsPage(this.arguments, {super.key});

  @override
  State<DetailsMapsPage> createState() => _DetailsMapsPageState();
}

class _DetailsMapsPageState extends State<DetailsMapsPage> {
  late MapsModel maps;

  @override
  void initState() {
    maps = widget.arguments['arguments'];
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(maps.splash!), fit: BoxFit.cover),
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.45,
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.4,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(maps.displayName!).h1(
                        style: TextStyle(
                          color: valorantPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(maps.tacticalDescription ??
                              'Mapa sem descrição de bombsite.')
                          .cardDetails(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Coordenadas: ${maps.coordinates ?? ''}")
                          .cardDetails(),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(maps.displayIcon!),
                          fit: BoxFit.cover),
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                  ),
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

  Widget backgroundWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: backgroundPage),
        ),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(maps.splash!), fit: BoxFit.cover),
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
    );
  }
}
