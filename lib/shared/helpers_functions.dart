import 'package:flutter/material.dart';

class Helpers {
  Helpers._();

  static showModal(
      {required BuildContext context, required Widget modal}) async {
    return await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) => modal,
    );
  }
}
