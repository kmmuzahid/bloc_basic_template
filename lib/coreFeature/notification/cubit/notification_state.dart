import 'package:equatable/equatable.dart';
import 'package:mygarage/coreFeature/notification/model/notification_model.dart';

class NotificationState extends Equatable {
  const NotificationState({this.notifications = const [], this.isLoading = false});

  final List<NotificationModel> notifications;
  final bool isLoading;

  NotificationState copyWith({List<NotificationModel>? notifications, bool? isLoading}) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [notifications, isLoading];
}
