// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  Notification? notification;
  String? clickAction = "FLUTTER_NOTIFICATION_CLICK";
  List<String>? registrationIds;

  NotificationModel({
    this.notification,
    this.clickAction,
    this.registrationIds,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notification: Notification.fromJson(json["notification"]),
        clickAction: json["click_action"],
        registrationIds:
        List<String>.from(json["registration_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "notification": notification!.toJson(),
    "click_action": clickAction,
    "registration_ids": List<dynamic>.from(registrationIds!.map((x) => x)),
  };
}

class Notification {
  String title;
  String body;

  Notification({
    required this.title,
    required this.body,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}