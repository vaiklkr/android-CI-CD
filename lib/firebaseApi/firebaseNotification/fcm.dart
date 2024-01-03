import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    FirebaseMessaging.instance.getToken().toString();
    await FirebaseMessaging.instance.subscribeToTopic("general-notification");
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
  }

  void configureFirebase() {
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      // Handle the message when the app is in the foreground.
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // Handle the message when the app is in the background but opened.
    });

    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  }

  static Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');

      // Handle the message when the app is launched from a terminated state.
    }
  }

}