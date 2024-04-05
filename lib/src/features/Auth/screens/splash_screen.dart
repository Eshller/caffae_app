import 'dart:ui';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Auth/screens/create_profile_screen.dart';
import 'package:caffae_app/src/features/Auth/screens/is_guru_check.dart';
import 'package:caffae_app/src/features/Auth/screens/login_screen.dart';
import 'package:caffae_app/src/features/Auth/screens/personalization_screen.dart';
import 'package:caffae_app/src/features/calling/call_utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class _AuthCheckScreenState extends ConsumerState<AuthCheckScreen> {
  Future<UserModel> getUser(String userId) async {
    try {
      final request = ModelQueries.get(
        UserModel.classType,
        UserModelModelIdentifier(id: userId),
      );
      final response = await Amplify.API.query(request: request).response;

      final userData = response.data!;

      return userData;
    } on Exception catch (error) {
      safePrint('getTrip failed: $error');
      rethrow;
    }
  }

  Future<GuruModel> getGuru(String userId) async {
    try {
      final request = ModelQueries.get(
        GuruModel.classType,
        GuruModelModelIdentifier(id: userId),
      );
      final response = await Amplify.API.query(request: request).response;

      final userData = response.data!;
      // setState(() {
      //   guru = userData;
      // });

      return userData;
    } on Exception catch (error) {
      safePrint('get user failed: $error');
      rethrow;
    }
  }

  Future<AuthUser> fetchCurrentUser() async {
    try {
      AuthUser authUser = await Amplify.Auth.getCurrentUser();

      return authUser;
    } on AuthException catch (e) {
      debugPrint('Error fetching current user: $e');
      BotToast.showText(text: e.message);

      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthUser>(
      future: fetchCurrentUser(),
      builder: (context, snapshot1) {
        if (snapshot1.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }

        if (!snapshot1.hasData || snapshot1.data!.userId.isEmpty) {
          return const LoginPhoneScreen();
        }

        return FutureBuilder<UserModel>(
          future: getUser(snapshot1.data!.userId),
          builder: (context, snapshot) {
            final userData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (snapshot.hasData) {
              Future.delayed(Duration.zero, () {
                if (snapshot.hasData) {
                  ref.read(userProvider).setUserFromModel(userData!);
                }
              });
              if (userData!.isGuru == true) {
                return FutureBuilder(
                    future: getGuru(snapshot1.data!.userId),
                    builder: (context, snapshot2) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingScreen();
                      }
                      if (snapshot2.hasData) {
                        final guru = snapshot2.data;
                        return GuruHomeScreen(
                          guruModel: guru!,
                        );
                      } else {
                        return const Scaffold(
                          body: Center(
                            child: Text('Unable to fetch your Gurus'),
                          ),
                        );
                      }
                    });
              } else if (userData.username == null) {
                return UserInformationScreen(
                  currentUser: snapshot1.data,
                );
              } else if (userData.listExplore!.isEmpty) {
                return PersonalizationScreen(
                  authUserId: snapshot1.data!.userId,
                );
              } else {
                return StudentHome(userId: snapshot1.data!.userId);
              }
            } else if (!snapshot.hasData) {
              return UserInformationScreen(
                currentUser: snapshot1.data,
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: Text('Unable to fetch your request'),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class AuthCheckScreen extends ConsumerStatefulWidget {
  const AuthCheckScreen({super.key});

  @override
  ConsumerState<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Box? userBox;
 
  @override
  void initState() {
  
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    try {
      userBox = await Hive.openBox("isSignedIn");
      final isLoggedIn = await userBox!.get("isLogin", defaultValue: false);
      safePrint(isLoggedIn);

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => userBox!.get("isLogin", defaultValue: false)
                ? const AuthCheckScreen()
                : const LoginPhoneScreen(),
          ),
        );
      }
    } catch (e) {
      debugPrint("Error initializing app: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColors,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ZegoSendCallInvitationButton(
            //   isVideoCall: true,
            //   resourceID:
            //       "zegouikit_call", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
            //   invitees: [
            //     ZegoUIKitUser(
            //       id: 'targetUserID',
            //       name: 'targetUserName',
            //     ),
            //     ZegoUIKitUser(
            //       id: 'targetUserID',
            //       name: 'targetUserName',
            //     )
            //   ],
            // ),
            Image.asset(
              'assets/images/caffae.png',
              height: 120,
              width: 129.v,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColors,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/caffae.png',
              height: 120,
              width: 129.v,
            ),
            SizedBox(
              height: 10.h,
            ),
            const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
