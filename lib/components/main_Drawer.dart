// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:app_valorant/app/app_bloc.dart';
import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/models/selected_page.dart';
import 'package:app_valorant/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        appBar: AppBar(
          backgroundColor: backgroundPage,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    color: textColor,
                    width: MediaQuery.sizeOf(context).height * 0.06,
                  )),
              Container(
                padding: const EdgeInsets.only(top: 4),
                child: IconButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: textGrey,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: backgroundPage,
        body: Column(
          children: [
            Divider(
              thickness: 1,
              height: 1,
              color: textGrey,
            ),
            const SizedBox(height: 16),
            _menuItemButton(
              icon: FontAwesomeIcons.users,
              iconSize: 16,
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
              icon: FontAwesomeIcons.map,
              iconSize: 18,
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
          backgroundColor: AppColors.grey,
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.grey,
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
            child: FaIcon(
              icon,
              color: textColor,
              size: iconSize ?? 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
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
