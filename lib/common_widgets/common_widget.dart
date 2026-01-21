import 'package:core_kit/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';

Widget buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 4),
    child: CommonText(
      text: text,
      textColor: AppColor.onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}
