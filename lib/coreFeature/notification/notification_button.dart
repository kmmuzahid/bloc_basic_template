/*
 * @Author: Km Muzahid
 * @Date: 2026-01-12 17:24:24
 * @Email: km.muzahid@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:mygarage/common_widgets/build_circular_icon.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buildCircularButton(
      child: const Badge(
        label: Text('99+'),
        child: Icon(Icons.notifications_outlined, color: Colors.white, size: 25),
      ),
      onTap: () {
        appRouter.push(const NotificationRoute());
      },
    );
  }
}
