/*
 * @Author: Km Muzahid
 * @Date: 2026-01-12 17:24:24
 * @Email: km.muzahid@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/common_widgets/build_circular_icon.dart';
import 'package:mygarage/config/bloc/cubit_scope_value.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/coreFeature/notification/cubit/notification_cubit.dart';

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScopeValue(
      cubit: context.read<NotificationCubit>(),
      builder: (context, cubit, state) {
        return buildCircularButton(
          child: Badge(
            label: Text(state.unreadCount.toString()),
            child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 25),
          ),
          onTap: () {
            appRouter.push(const NotificationRoute());
          },
        );
      }
    );
  }
}
