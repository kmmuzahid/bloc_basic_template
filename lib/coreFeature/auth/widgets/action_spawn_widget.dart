import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';

class ActionSpawnWidget extends StatelessWidget {
  const ActionSpawnWidget({
    super.key,
    required this.title,
    required this.actionTitle,
    required this.onTap,
  });
  final String title;
  final String actionTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: AppColor.onPrimary, fontSize: 12),
        children: [
          TextSpan(
            text: title,
            style: TextStyle(color: AppColor.onPrimary, fontSize: 12),
          ),
          TextSpan(
            text: ' $actionTitle',
            style: TextStyle(color: AppColor.accentColor, fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
