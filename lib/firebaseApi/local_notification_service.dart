import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LocalNotificationService{

  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? id) async {
      //   print("onSelectNotification");
      //   if (id!.isNotEmpty) {
      //     print("Router Value1234 $id");
      //
      //     // Navigator.of(context).push(
      //     //   MaterialPageRoute(
      //     //     builder: (context) => DemoScreen(
      //     //       id: id,
      //     //     ),
      //     //   ),
      //     // );
      //
      //
      //   }
      // },
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "finjoyapp",
          "finjoyappchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  // static void createanddisplayOnesignalnotification() async {
  //   try {
  //     final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //     const NotificationDetails notificationDetails = NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         "finjoyapp",
  //         "finjoyappchannel",
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //     );
  //
  //     await _notificationsPlugin.show(
  //       id,
  //       'Keyur',
  //       'Test Message',
  //       notificationDetails,
  //       payload: '',
  //     );
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  static void createanddisplayOnesignalnotification(OSNotificationWillDisplayEvent message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "",
          "",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(
        id,
        message.notification.title,
        message.notification.body,
        notificationDetails,
        payload: message.notification.body,
      );
    } on Exception catch (e) {
      print(e);
    }
  }

}