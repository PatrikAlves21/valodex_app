import 'package:app_valorant/components/loadinglists_widget.dart';
import 'package:app_valorant/models/maps_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_colors.dart';

class MapsContainer extends StatelessWidget {
  final MapsModel maps;
  const MapsContainer({super.key, required this.maps});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(maps.splash!), context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderCard.withOpacity(0.2),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: const LoadingListWidget(
              title: 'Carregando imagem...',
            ),
          );
        } else {
          if (snapshot.hasError) {
            return errorLoading();
          } else {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              height: MediaQuery.sizeOf(context).height * 0.15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderCard.withOpacity(0.2),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                    image: NetworkImage(maps.splash!), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Text(
                    'Mapas',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }

  Widget errorLoading() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderCard.withOpacity(0.2),
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Ocorreu um erro ao carregar as informações.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
    );
  }
}
