import 'package:app_valorant/components/card_stats.dart';
import 'package:app_valorant/models/skins_model.dart';
import 'package:app_valorant/shared/app_colors.dart';
import 'package:app_valorant/styles/extension_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SkinCardWidget extends StatelessWidget {
  final SkinsModel skin;
  const SkinCardWidget({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => false,
      child: CardStatsWidget(
        margin: const EdgeInsets.only(right: 16),
        child: SizedBox(
          height: 80.sp,
          child: Column(
            children: [
              if (skin.displayIcon != null)
                Image.network(
                  skin.displayIcon!,
                  height: 40.sp,
                ),
              if (skin.displayIcon == null)
                SizedBox(
                  height: 40.sp,
                  width: 40.sp,
                  child: Center(
                    child: Icon(
                      Iconsax.info_circle5,
                      size: 24.sp,
                      color: valorantPrimary,
                    ),
                  ),
                ),
              SizedBox(
                height: 8.sp,
              ),
              Text(skin.displayName!)
                  .h3(style: TextStyle(color: fontColorSecondary))
            ],
          ),
        ),
      ),
    );
  }
}
