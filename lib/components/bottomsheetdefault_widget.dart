import 'package:app_valorant/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetDefault extends StatefulWidget {
  final String title;
  final Widget child;
  const BottomSheetDefault({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<BottomSheetDefault> createState() => _BottomSheetDefaultState();
}

class _BottomSheetDefaultState extends State<BottomSheetDefault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: Colors.transparent,
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(widget.title,
                        style: TextStyle(
                            color: backgroundPage,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600))),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 30,
                    height: 25,
                    child: Icon(
                      Icons.clear,
                      size: 25,
                      color: textGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.3,
            color: borderCard,
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: SingleChildScrollView(child: widget.child))),
        ]),
      ),
    );
  }
}
