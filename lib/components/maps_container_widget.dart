import 'package:app_valorant/models/maps_model.dart';
import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MapsContainer extends StatelessWidget {
  final MapsModel maps;
  const MapsContainer({super.key, required this.maps});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(maps.splash!), context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingCard();
        } else {
          if (snapshot.hasError) {
            return errorLoading();
          } else {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: MediaQuery.sizeOf(context).width,
              height: 62.sp,
              decoration: BoxDecoration(
                border: Border.all(
                  color: strokeColor,
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 62.sp,
                    width: 62.sp,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(maps.splash!), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(child: Text(maps.displayName!).h2()),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: valorantPrimary,
                      size: 16.sp,
                    ),
                  )
                ],
              ),
            );
          }
        }
      },
    );
  }

  Widget loadingCard() => Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[600]!,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 62.sp,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: strokeColor,
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(
              color: strokeColor,
            ),
          ),
          child: const SizedBox(),
        ),
      );

  Widget errorLoading() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: valorantPrimary,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: valorantPrimary,
              size: 20.sp,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Ocorreu um erro ao carregar as informações.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
