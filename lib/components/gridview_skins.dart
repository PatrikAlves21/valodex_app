import 'package:app_valorant/components/skin_card.dart';
import 'package:app_valorant/models/skins_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewSkinsWidget extends StatefulWidget {
  final List<SkinsModel> listSkins;
  const GridViewSkinsWidget({super.key, required this.listSkins});

  @override
  State<GridViewSkinsWidget> createState() => _GridViewSkinsWidgetState();
}

class _GridViewSkinsWidgetState extends State<GridViewSkinsWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.sp,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.listSkins
              .map(
                (skin) => SkinCardWidget(
                  skin: skin,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
