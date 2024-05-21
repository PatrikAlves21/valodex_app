// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shared/app_colors.dart';

class LoadingListWidget extends StatelessWidget {
  final String? title;
  const LoadingListWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.sp,
              width: 20.sp,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title ?? "Buscando informações...",
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
