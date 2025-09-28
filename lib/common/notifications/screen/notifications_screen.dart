import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_basic_template/common/notifications/cubit/notification_cubit.dart';
import 'package:bloc_basic_template/common/notifications/cubit/notification_state.dart';
import 'package:bloc_basic_template/common/notifications/widgets/notification_item.dart';
import 'package:bloc_basic_template/core/app_bar/common_app_bar.dart';
import 'package:bloc_basic_template/core/component/other_widgets/smart_list_loader.dart';
import 'package:bloc_basic_template/core/config/languages/cubit/language_cubit.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationCubit>().fetch();
    });
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final cubit = context.read<NotificationCubit>();
        return Scaffold(
          /// App Bar Section starts here
          appBar: CommonAppBar(title: AppString.notifications, onBackPress: cubit.cleanList),

          /// Body Section starts here
          body: SmartListLoader(
            itemCount: state.notifications?.length ?? 0,
            isLoading: state.isLoading,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.fetch,
            itemBuilder: (context, index) => NotificationItem(item: state.notifications![index]),
          ),
        );
      },
    );
  }
}
