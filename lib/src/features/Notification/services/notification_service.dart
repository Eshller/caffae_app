import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FlutterError.reportError(FlutterErrorDetails(
    exception: Exception("====hey"),
    stack: StackTrace.current,
  ));
  log("====hey");
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Map<String, dynamic> pinpointMessage = message.data;
  flutterLocalNotificationsPlugin ??= FlutterLocalNotificationsPlugin();
  if (pinpointMessage["pinpoint.notification.imageUrl"] != null &&
      pinpointMessage["pinpoint.notification.imageIconUrl"] != null) {
    log("h2");
    return NotificationHandler().showBigPictureNotification(pinpointMessage);
  } else if (pinpointMessage["pinpoint.notification.imageUrl"] != null) {
    return NotificationHandler()
        .showBigPictureNotificationHiddenLargeIcon(pinpointMessage);
  } else {
    flutterLocalNotificationsPlugin.show(
        pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
        pinpointMessage["pinpoint.notification.title"],
        pinpointMessage["pinpoint.notification.body"],
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel', // id
            'High Importance Notifications', // title
            // 'This channel is used for important notifications.', // description
            importance: Importance.high,
            icon: null, // android?.smallIcon,
            // other properties...
          ),
        ));
  }
}

class NotificationHandler {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;
  NotificationHandler() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    getToken();
  }
  Future<void> getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    log("$token");
  }

  Future<void> firebaseMessagingForegroundHandler(RemoteMessage message) {
    Map<String, dynamic> pinpointMessage = message.data;
    if (pinpointMessage["pinpoint.notification.imageUrl"] != null &&
        pinpointMessage["pinpoint.notification.imageIconUrl"] != null) {
      log("h2");
      return showBigPictureNotification(pinpointMessage);
    } else if (pinpointMessage["pinpoint.notification.imageUrl"] != null) {
      return showBigPictureNotificationHiddenLargeIcon(pinpointMessage);
    } else {
      return flutterLocalNotificationsPlugin.show(
          pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
          pinpointMessage["pinpoint.notification.title"],
          pinpointMessage["pinpoint.notification.body"],
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              // 'This channel is used for important notifications.', // description
              importance: Importance.high,
              icon: null,
            ),
          ));
    }
  }

  Future<void> showBigPictureNotification(
      Map<String, dynamic> pinpointMessage) async {
    final String largeIconPath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageIconUrl"], 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageUrl"], 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            largeIcon: FilePathAndroidBitmap(largeIconPath),
            contentTitle:
                '<b>${pinpointMessage["pinpoint.notification.title"]}</b>',
            htmlFormatContentTitle: true,
            summaryText: '${pinpointMessage["pinpoint.notification.body"]}',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'big text channel id', 'big text channel name',
            //  'big text channel description',
            styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
        pinpointMessage["pinpoint.notification.title"],
        pinpointMessage["pinpoint.notification.body"],
        platformChannelSpecifics);
  }

  Future<void> showBigPictureNotificationHiddenLargeIcon(
      Map<String, dynamic> pinpointMessage) async {
    final String bigPicturePath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageUrl"], 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            hideExpandedLargeIcon: true,
            contentTitle:
                '<b>${pinpointMessage["pinpoint.notification.title"]}</b>',
            htmlFormatContentTitle: true,
            summaryText: '${pinpointMessage["pinpoint.notification.body"]}',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'big text channel id', 'big text channel name',
            // 'big text channel description',
            styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
        pinpointMessage["pinpoint.notification.title"],
        pinpointMessage["pinpoint.notification.body"],
        platformChannelSpecifics);
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}

Future<void> sendTargetedFCMNotification(
    {required String targetDeviceToken,
    required String messageType,
    required Map<String, dynamic> data,
    required String title,
    required String body}) async {
  const String serverKey =
      'AAAAOXPaQMg:APA91bFOMWnZKxnv7Pn5KeYbWoOjgoS48F8Kap2bB0a4LhLzCwLn3zU8zDA7S2gczLHhb-gkM2w7pxcyBqGuqxVnetrbkxQOxkboxQSBsFPYtwlgrifbqyB9LOUyorRr1rUJ4kgr793b'; // Replace with your FCM server key
  const String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

  Map<String, dynamic> notificationData = {
    'to': targetDeviceToken,
    'notification': {
      'title': title,
      'body': body,
    },
    'data': {
      'messageType': messageType,
      ...data, // Pass additional data for specific message types
    },
  };

  String payload = json.encode(notificationData);

  final http.Response response = await http.post(
    Uri.parse(fcmEndpoint),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: payload,
  );

  if (response.statusCode == 200) {
    safePrint('FCM notification sent successfully');
  } else {
    safePrint(
        'Failed to send FCM notification. Status code: ${response.statusCode}');
    safePrint('Response body: ${response.body}');
  }
}
//
// void showCallkitIncoming(
//   String callUUID,
//   String callerName,
//   String callerHandle,
//   String callerAvtar,
// ) async {
//   final params = CallKitParams(
//     id: callUUID,
//     nameCaller: 'callerName', //caller name
//     appName: 'Caffae',
//     // avatar: callerAvtar,
//     handle: 'jack',
//     type: 0,
//     duration: 30000,
//     textAccept: 'Accept',
//     textDecline: 'Decline',
//     missedCallNotification: const NotificationParams(
//       showNotification: true,
//       isShowCallback: true,
//       subtitle: 'Missed call',
//       callbackText: 'Call back',
//     ),
//
//     headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
//
//     android: const AndroidParams(
//       isCustomNotification: true,
//       isShowLogo: false,
//       ringtonePath: 'system_ringtone_default',
//       backgroundColor: '#0955fa',
//       backgroundUrl: 'assets/test.png',
//       actionColor: '#4CAF50',
//       incomingCallNotificationChannelName: 'Incoming Call',
//       missedCallNotificationChannelName: 'Missed Call',
//     ),
//     ios: const IOSParams(
//       iconName: 'CallKitLogo',
//       handleType: '',
//       supportsVideo: true,
//       maximumCallGroups: 2,
//       maximumCallsPerCallGroup: 1,
//       audioSessionMode: 'default',
//       audioSessionActive: true,
//       audioSessionPreferredSampleRate: 44100.0,
//       audioSessionPreferredIOBufferDuration: 0.005,
//       supportsDTMF: true,
//       supportsHolding: true,
//       supportsGrouping: false,
//       supportsUngrouping: false,
//       ringtonePath: 'system_ringtone_default',
//     ),
//   );
//
//   await FlutterCallkitIncoming.showCallkitIncoming(params);
// }
