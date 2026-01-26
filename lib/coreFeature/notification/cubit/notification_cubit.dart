/*
 * @Author: Km Muzahid
 * @Date: 2026-01-17 11:10:37
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';
import 'package:mygarage/coreFeature/notification/cubit/notification_state.dart';
import 'package:mygarage/coreFeature/notification/model/notification_model.dart';

class NotificationCubit extends SafeCubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  void init() async {
    fetch();
    getUnreadCount();
  }

  void addNotification(NotificationModel notification) async {
    if (appRouter.current.route.name == NotificationRoute.name) {
      emit(state.copyWith(notifications: [...state.notifications, notification]));
    } else {
      emit(state.copyWith(unreadCount: state.unreadCount + 1));
    }
  }

  void getUnreadCount() async {
    emit(state.copyWith(unreadCount: 0));
  }

  Future<void> fetch({bool isRefresh = false, int page = 1}) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));

    emit(
      state.copyWith(
        isLoading: false,
        notifications: [
          if (!isRefresh) ...state.notifications,
          ...List.generate(
            10,
            (index) => NotificationModel(
              title: 'There is a new car',
              message: 'XYZ has added a new car for the vote',
              time: DateTime.now()
                  .subtract(Duration(minutes: state.notifications.length * 10))
                  .checkTime,
              isUnread: index % 2 == 0,
            ),
          ),
        ],
      ),
    );
  }
}
