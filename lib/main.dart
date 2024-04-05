import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/features/calling/call_constant.dart';
import 'package:caffae_app/src/features/calling/call_services.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'amplifyconfiguration.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';
  if (cacheUserID.isNotEmpty) {
    currentUser.id = cacheUserID;
    currentUser.name = 'user_$cacheUserID';
  }
 
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 2/5: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

    // Initialize BotToast here

  // Set preferred orientations
  
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // initializeFirebaseMessaging();

  // await Future.wait([
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //   ]),
    // PrefUtils().init();
  // ]);

 await Hive.initFlutter();
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
    runApp(ProviderScope(child: MyApp(navigatorKey: navigatorKey)));
  });
}

class MyApp extends ConsumerStatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.a
  String? currentUserId;

  @override
  void initState() {
    super.initState();
    // if (currentUser.id.isNotEmpty) {
      onUserLogin();
    // }
    _configureAmplify();
    WidgetsBinding.instance.addObserver(this);
  }

  void _configureAmplify() async {
 
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyStorageS3 amplifyStorageS3 = AmplifyStorageS3();

    await Amplify.addPlugins([
      authPlugin,
      amplifyStorageS3,
      // pushPlugin,
      AmplifyAPI(modelProvider: ModelProvider.instance),
    ]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      if (kDebugMode) {
        print(
            "Amplify was already configured. Looks like app restarted on android.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      DeviceType deviceType,
    ) {
      return MaterialApp(
        navigatorObservers: <NavigatorObserver>[
          BotToastNavigatorObserver(),
          NavigationService.instance.routeObserver
        ],
        debugShowCheckedModeBanner: false,
        title: 'Caffae',
        builder: (BuildContext context, Widget? child) {
          BotToastInit();
          return Stack(
            children: [
              child!,

              /// support minimizing
              ZegoUIKitPrebuiltCallMiniOverlayPage(
                contextQuery: () {
                  return widget.navigatorKey.currentState!.context;
                },
              ),
            ],
          );
        },
        // builder: ,
        // onGenerateRoute: AppRoute.generateRoute,
        // initialRoute: AppRoute.homePage,
        
        
           navigatorKey: widget.navigatorKey,
        theme: theme,
        supportedLocales: const [
          Locale(
            'en',
            '',
          ),
        ],
        home: const SplashScreen(),
      );
    });
  }
}

// for sending messages
void initializeFirebaseMessaging() async {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  firebaseMessaging.requestPermission();
  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  safePrint('User granted permission: ${settings.authorizationStatus}');
  // Foreground message handling
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    handleFCMMessage(message);
  });

  // Background/terminated message handling
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handleFCMMessage(message);
}

void handleCallingNotification(Map<String, dynamic> data) {
  String callUUID = data['callUUID'];
  print("uuid$callUUID");
  String callerName = data['callerName'];
  String callerHandle = data['callerHandle'];

  // String callerAvtar = data['callerAvtar'];
  // if (callerAvtar.isEmpty) {
  //   callerAvtar = image;
  // }
  // safePrint(callerAvtar);

  // showCallkitIncoming(callUUID, callerName, callerHandle, 'message');
}

void handleChatNotification(RemoteMessage data) {
  NotificationHandler? notificationHandler = NotificationHandler();

  notificationHandler.firebaseMessagingForegroundHandler(data);
}

void handleFCMMessage(RemoteMessage message) {
  String messageType = message.data['messageType'];

  if (messageType == 'calling') {
    handleCallingNotification(message.data);
  } else if (messageType == 'chat') {
    handleChatNotification(message);
  }
}
