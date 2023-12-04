import 'dart:async';
import 'dart:io';

import '../common/secure_storage.dart';
import '../common/service/firebase_options.dart';
import '../route/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() async {
  // runZonedGuarded<Future<void>>(() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // _requestPermission();

  // await FirebaseMessaging.instance.getInitialMessage();

  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  // FirebaseMessaging.onBackgroundMessage((message) async {
  //   print("onBackgroundMessage");
  //   print(message.data);
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
  //   print("onMessageOpenedApp");
  //   print(message.data);
  // });
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
  //   print("onMessage");
  //   print(message.data);
  // });

  if (Platform.isIOS) SecureStorage.getAndroidOptions();

  runApp(ScreenUtilInit(
    designSize: const Size(390, 844),
    minTextAdapt: true,
    builder: (context, child) => GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            //화면마다 각각 다르게 css를 주는 함수
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!, // child는 null이 아님을 해서 에러 방지 해둠.
          );
        },
        theme: ThemeData(fontFamily: 'Inter'),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        initialRoute: '/',
        getPages: GetXRouter.route),
  ));
  // }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
  return Future.value();
}

Future<void> _requestPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  print(settings.authorizationStatus);
}
