/*
 * @Author: Km Muzahid
 * @Date: 2026-01-17 11:10:37
 * @Email: km.muzahid@gmail.com
 */
import 'package:core_kit/core_kit.dart';
import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/coreFeature/notification/cubit/notification_state.dart';
import 'package:mygarage/coreFeature/notification/model/notification_model.dart';

class NotificationCubit extends SafeCubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

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
