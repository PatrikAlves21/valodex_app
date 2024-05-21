// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:app_valorant/app/app_bloc.dart';
import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../shared/app_colors.dart';
import '../shared/material_colors.dart';

class MainDrawer extends StatefulWidget {
  final SelectedPage? page;

  const MainDrawer(this.page);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  AppBloc get appBloc => AppModule.to.getBloc();
  SelectedPage? get page => widget.page;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: backgroundPage,
        body: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
            _menuItemButton(
              icon: Iconsax.user,
              title: "Agentes",
              selected: page == SelectedPage.AGENTS,
              onTap: () async {
                if (page == SelectedPage.AGENTS) {
                  return Navigator.of(context).pop();
                }
                Navigator.of(context).pushReplacementNamed("/Home");
              },
            ),
            _menuItemButton(
              icon: Iconsax.map,
              title: "Mapas",
              selected: page == SelectedPage.MAPSPAGE,
              onTap: () async {
                if (page == SelectedPage.MAPSPAGE) {
                  return Navigator.of(context).pop();
                }
                Navigator.of(context).pushReplacementNamed("/maps");
              },
            ),
          ],
        ),
        bottomSheet: BottomSheet(
          elevation: 0,
          backgroundColor: AppMaterialColor.valorantAppColors,
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppMaterialColor.valorantAppColors,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              ),
            );
          },
          onClosing: () {},
        ),
      ),
    );
  }

  _menuItemButton(
      {IconData? icon,
      required String title,
      bool selected = false,
      bool isVisibleIcon = true,
      double? iconSize,
      double? iconLeftPadding,
      Function? onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap as void Function(),
      title: Row(
        children: [
          SizedBox(width: iconLeftPadding ?? 16),
          Visibility(
            visible: isVisibleIcon,
            child: Icon(
              icon,
              color: textColor,
              size: iconSize ?? 24.sp,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
