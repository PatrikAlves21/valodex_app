import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/weapons_model.dart';

class WeaponsContainer extends StatelessWidget {
  final WeaponsModel weapon;
  const WeaponsContainer({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/detailsWeapons", arguments: {'arguments': weapon});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14),
              child: Image.network(
                weapon.killStreamIcon!,
                width: 62.sp,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(weapon.displayName!).h2()),
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
      ),
    );
  }
}
