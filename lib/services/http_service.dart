import 'dart:convert';
import 'package:http/http.dart';
import '../model/member_model.dart';
import '../model/notification_model.dart';
import 'log_service.dart';

class Network {
  static String SERVER_FCM = "fcm.googleapis.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization':
    'key=AAAAwvTJTRE:APA91bEAR7aI469-Nc0A2vGfjfP16EYcfrl0E0g9JtDqZD7vpynED9nY3LkfO9JgVak7qaCo0b8RQbb2fQCySi-hEfFGcGVCAqGraFCos64w7h5CYrfzb1wdA7PtivXfy4s9mKNbltQP'
  };

  /* Http Requests */

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(SERVER_FCM, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /* Http Apis*/
  static String API_SEND_NOTIF = "/fcm/send";

  /* Http Params */
  static Map<String, dynamic> paramsNotify(Member sender, Member receiver) {
    var notification = Notification(title: "Followed", body: "${sender.fullname} has just been followed");
    var registrationIds = [receiver.device_token];
    var notificationModel = NotificationModel(notification: notification, registrationIds: registrationIds);

    LogService.i(notificationModel.toJson().toString());
    return notificationModel.toJson();
  }
}