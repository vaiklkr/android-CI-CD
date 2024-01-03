import 'dart:async';
import 'dart:io';

import 'package:build_context_provider/build_context_provider.dart';
import 'package:connectivity/connectivity.dart';
import 'package:finjoy_app/core/locale/application_locale.dart';
import 'package:finjoy_app/core/locale/locale_constant.dart';
import 'package:finjoy_app/screens/auth/enter_m_pin_screen.dart';
import 'package:finjoy_app/screens/home/credit%20card/credit_card_details_screen.dart';
import 'package:finjoy_app/screens/select_language/select_language_screen.dart';
import 'package:finjoy_app/utils/route_utils.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'api/appLabel/app_label_service.dart';
import 'core/app_color.dart';
import 'firebaseApi/firebaseNotification/fcm.dart';
import 'firebaseApi/local_notification_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
// }

bool clickOfferNotification = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await AppLabels.fetchData('English');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) async {
    await Hive.openBox('finjoy').then(
      (value) => runApp(
        ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MyApp(
            prefs: value,
          ),
        ),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  final Box prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  bool contentDisabled = false;
  late Timer _timer;
  bool snackbarShowing = false;
  int snackBarCounter = 0;

  @override
  void initState() {
    oneSignalAndFirebaseSetup();
    super.initState();
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      setState(() {
        if (snackbarShowing) {
          snackBarCounter++;
          if (snackBarCounter > 3) {
            snackBarCounter = 0;
            snackbarShowing = false;
          }
        }
      });
      if (connectivityResult == ConnectivityResult.none) {
        setState(() {
          if (!contentDisabled) {
            _showCustomSnackBar(false, "No Internet Connection",
                "Please check your internet.", Colors.red);
            snackbarShowing = true;
            snackBarCounter = 0;
          }
          contentDisabled = true;
        });
      } else {
        setState(() {
          if (contentDisabled) {
            _showCustomSnackBar(true, "Internet is back",
                "Great, your internet connection is restored.", Colors.green);
            snackbarShowing = true;
            snackBarCounter = 0;
          }
          contentDisabled = false;
        });
      }
    });
  }

  Future<void> oneSignalAndFirebaseSetup() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("6a04269c-93f1-4d19-a619-4fcccc495117");
    OneSignal.Notifications.requestPermission(true);

    // LocalNotificationService.initialize();

    // PrefObj.preferences!.get(PrefKeys.ClickOfferNotification);

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      // print(' =====Notification============>  ${event.notification.additionalData!['offerId']}');
      // LocalNotificationService.createanddisplayOnesignalnotification(event);
    });

    OneSignal.Notifications.addClickListener(
          (event) {
        if (event.notification.additionalData!['offerId'] != null) {
          clickOfferNotification = true;
          PrefObj.preferences!.put(PrefKeys.OfferTitle, event.notification.title);
          PrefObj.preferences!.put(PrefKeys.OfferId,
              event.notification.additionalData!['offerId'].toString());
          PrefObj.preferences!.put(PrefKeys.ClickOfferNotification, true);
          // print(' =====Notification============>  ${event.notification.additionalData!['offerId']}');
          print(
              ' =====Notification============>  ${PrefObj.preferences!.get(PrefKeys.OfferTitle)}');
          final navigatorKey = GlobalKey<NavigatorState>();
          Navigator.pushReplacement(navigatorKey.currentContext!,
              CupertinoPageRoute(
                builder: (context) {
                  return const CreditCardDetailsScreen();
                },
              ));
        }
      },
    );

    await Mixpanel.init("dc7b26714726b5b2ae51b6c5c9153aed",
        trackAutomaticEvents: true);

    await Firebase.initializeApp();
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
    // FirebaseMessagingService().configureFirebase();
    // await FirebaseMessagingService().initNotifications();

    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    // messaging.getToken().then((token) {
    //   print("Firebase Token: $token");
    // });
    // messaging.subscribeToTopic("general-notification");
    // print("subscribeToTopic");
    //
    // FirebaseMessaging.instance.getInitialMessage().then(
    //       (message) {
    //     print("FirebaseMessaging.instance.getInitialMessage");
    //     if (message != null) {
    //       print("New Notification");
    //     }
    //   },
    // );
    //
    // // 2. This method only call when App in forground it mean app must be opened
    // FirebaseMessaging.onMessage.listen(
    //       (message) {
    //     print("FirebaseMessaging.onMessage.listen");
    //     if (message.notification != null) {
    //       print(message.notification!.title);
    //       print(message.notification!.body);
    //       // print("message.data11 ${message.data}");
    //       LocalNotificationService.createanddisplaynotification(message);
    //     }
    //   },
    // );
    //
    // // 3. This method only call when App in background and not terminated(not closed)
    // FirebaseMessaging.onMessageOpenedApp.listen(
    //       (message) {
    //     print("FirebaseMessaging.onMessageOpenedApp.listen");
    //     if (message.notification != null) {
    //       print(message.notification!.title);
    //       print(message.notification!.body);
    //       // print("message.data22 ${message.data['_id']}");
    //     }
    //   },
    // );
    //
    // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PrefObj.preferences = widget.prefs;
    // String isLogin =
        // PrefObj.preferences!.containsKey(PrefKeys.DEVICETOKEN) ? true : false;
        PrefObj.preferences!.containsKey(PrefKeys.DEVICETOKEN) ? true : false;
    return GestureDetector(
      onTap: () async {
        if (contentDisabled && !snackbarShowing) {
          setState(() {
            _showCustomSnackBar(false, "No Internet Connection",
                "Please check your internet.", Colors.red);
            snackbarShowing = true;
          });
        }
      },
      child: AbsorbPointer(
        absorbing: contentDisabled,
        child: GetMaterialApp(
            routes: RouteUtils.routes(),
            debugShowCheckedModeBanner: false,
            title: 'Finjoy',
            supportedLocales: const [
              Locale('en', ''),
              Locale('hi', ''),
              Locale('mr', ''),
              Locale('ta', ''),
            ],
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            home: PrefObj.preferences!.containsKey(PrefKeys.DEVICETOKEN) == 'null' || PrefObj.preferences!.containsKey(PrefKeys.DEVICETOKEN) == ''
                ? EnterMPinScreen(
                    fullname:
                        PrefObj.preferences!.get(PrefKeys.FullName).toString(),
                  )
                : const SelectLanguageScreen()),

        // home: isLogin ? const LoginScreen() : const SelectLanguageScreen()),
      ),
    );
  }
}

void _showCustomSnackBar(
    bool isConnected, String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      icon: Icon(
        isConnected
            ? Icons.signal_wifi_4_bar_lock_rounded
            : Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
        color: AppColor.whitecolor,
      ),
      backgroundColor: backgroundColor,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      colorText: AppColor.whitecolor,
      snackPosition: SnackPosition.BOTTOM);
}


