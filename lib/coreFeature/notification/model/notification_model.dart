/*
 * @Author: Km Muzahid
 * @Date: 2026-01-17 11:11:15
 * @Email: km.muzahid@gmail.com
 */
class NotificationModel {
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.isUnread,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    title: json['title'],
    message: json['message'],
    time: json['time'],
    isUnread: json['isUnread'],
  );

  NotificationModel copyWith({String? title, String? message, String? time, bool? isUnread}) {
    return NotificationModel(
      title: title ?? this.title,
      message: message ?? this.message,
      time: time ?? this.time,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}
