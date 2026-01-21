/*
 * @Author: Km Muzahid
 * @Date: 2026-01-17 09:48:40
 * @Email: km.muzahid@gmail.com
 */
import 'package:auto_route/auto_route.dart';
import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/bloc/cubit_scope.dart';
import 'package:mygarage/coreFeature/notification/cubit/notification_cubit.dart';
import 'package:mygarage/coreFeature/notification/widget/notification_item_widget.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Notification'),
      body: CubitScope(
        create: () => NotificationCubit()..fetch(),
        builder: (context, cubit, state) {
          return SmartListLoader(
            itemCount: state.notifications.length,
            isLoading: state.isLoading,
            limit: 10,
            onRefresh: () {
              cubit.fetch(isRefresh: true);
            },
            onLoadMore: (int page) {
              cubit.fetch(page: page);
            },
            itemBuilder: (context, int index) {
              return NotificationItemWidget(
                title: state.notifications[index].title,
                message: state.notifications[index].message,
                time: state.notifications[index].time,
                isUnread: state.notifications[index].isUnread,
              );
            },
          );
        }
      ),
    );
  }
}
