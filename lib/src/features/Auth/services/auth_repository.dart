// ignore_for_file: deprecated_member_use

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/features/Auth/screens/otp_verification.dart';
import 'package:hive_flutter/hive_flutter.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository.instance());

class AuthRepository extends ChangeNotifier {
  AuthRepository.instance();

  bool _isSignedIn = false;
  bool _loading = false;
  bool _isOTPSignUpComplete = false;
  bool _isSignUpComplete = false;
  bool get isSignedIn => _isSignedIn;
  bool get isSignUpComplete => _isSignUpComplete;

  set isSignUpComplete(bool value) {
    _isSignUpComplete = value;
    notifyListeners();
  }

  set isSignedIn(bool value) {
    _isSignedIn = value;
    notifyListeners();
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  bool get isOTPSignUpComplete => _isOTPSignUpComplete;

  set isOTPSignUpComplete(bool value) {
    _isOTPSignUpComplete = value;
    notifyListeners();
  }

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

//! retive the current user attributes
  Future<void> retrieveUserAttributes({required BuildContext context}) async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      for (var element in res) {
        debugPrint('key: ${element.userAttributeKey}; value: ${element.value}');
      }
    } on AuthException catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.message);
      }
      debugPrint(e.message);
    }
  }

  //! check the type of user
  Future<bool> isGuru(String userId) async {
    try {
      // Query for the user with the specified ID
      final users = await Amplify.DataStore.query(
        UserModel.classType,
        where: UserModel.ID.eq(userId),
      );

      if (users.isNotEmpty) {
        // Check the attributes to determine if the user is a "Guru"
        final UserModel user = users.first;

        // Example: Check if the user has the "isGuru" attribute set to true
        if (user.isGuru == true) {
          return true; // User is a "Guru"
        } else {
          return false; // User is not a "Guru"
        }
      } else {
        // User not found
        return false;
      }
    } catch (e) {
      debugPrint('Error checking if user is a Guru: $e');
      return false; // Return false if an error occurs
    }
  }

//! to check the user isLogin
  Future<bool> isLoggedIn() async {
    try {
      // Check current authentication session
      final session = await Amplify.Auth.fetchAuthSession(
        options: const CognitoSessionOptions(getAWSCredentials: true),
      );

      return session
          .isSignedIn; // Return true if the user is signed in, else false
    } catch (e) {
      debugPrint('Error checking authentication status: $e');
      return false; // Return false if an error occurs
    }
  }

//! retrive the current user
  Future<String> retrieveCurrentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    debugPrint(authUser.userId);
    return authUser.userId;
  }

  Future<AuthUser> currentUser() async {
    AuthUser authUser = await Amplify.Auth.getCurrentUser();
    debugPrint(authUser.userId);
    return authUser;
  }

  void navigateToOtpScreen(
    BuildContext context,
    String username,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyOtpScreen(
          username: username,
        ),
      ),
    );
  }

//! to register a user
  Future<void> registerNewUser({
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String email,
    required BuildContext context,
    required String username,
  }) async {
    try {
      BotToast.showLoading();
      //   print(phoneNumber);/**/

      SignUpResult res = await Amplify.Auth.signUp(
          username: username,
          password: password,
          options: CognitoSignUpOptions(
            userAttributes: {
              CognitoUserAttributeKey.phoneNumber: phoneNumber,
              CognitoUserAttributeKey.email: email
            },
          ));
      if (!res.isSignUpComplete) {
        // Navigate to verification screen
        BotToast.closeAllLoading();
        if (context.mounted) {
          navigateToOtpScreen(context, username);
        }
        return;
      }

      // send to otp verification screen
      //return isSignUpComplete;
    } on AuthException catch (e) {
      BotToast.showText(text: e.message, duration: const Duration(seconds: 3));
      BotToast.closeAllLoading();
      debugPrint(e.message);

      //return isSignUpComplete;
    }
  }

//! login the user
  Future<bool> loginUsername({
    required String userName,
    required String password,
    required BuildContext context,
  }) async {
    try {
      BotToast.showLoading();

      SignInResult res = await Amplify.Auth.signIn(
        username: userName,
        password: password,
      );
      BotToast.closeAllLoading();
      return res.isSignedIn;
    } on AuthException catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: e.message, duration: const Duration(seconds: 10));
      return false;
    }
  }

  Future<void> confirmSignUp({
    required String confirmationCode,
    required String username,
    required BuildContext context,
  }) async {
    // loading = true;
    try {
      BotToast.showLoading();
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      if (res.isSignUpComplete) {
        BotToast.closeAllLoading();

        if (context.mounted) {
          BotToast.showText(
              text: 'Now sign in with same username and password',
              duration: const Duration(seconds: 3));

          Navigator.pop(context);
          Navigator.pop(context);
        }
      } else {
        BotToast.showText(
            text: 'Something went wrong. Please try again later!',
            duration: const Duration(seconds: 3));
      }
    } on AuthException catch (e) {
      debugPrint(e.message);
      BotToast.closeAllLoading();

      BotToast.showText(text: e.message);
    }
  }

  void handleLogout(BuildContext context) async {
    var box = await Hive.openBox('isSignedIn');
    await box.delete('isLogin'); // Delete the 'isLogin' key
    Amplify.Auth.signOut();
    // Perform other logout actions as needed
    // ...

    // Navigate to AuthCheckScreen or any other desired screen
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        (route) => false,
      );
    }
  }

  //! fetchAllUsers
  Future<void> fetchUserDetails(BuildContext context) async {
    try {
      // Get the currently signed-in user
      AuthUser authUser = await Amplify.Auth.getCurrentUser();

      // Fetch user attributes
      final result = await Amplify.Auth.fetchUserAttributes();
      // Loop through user attributes to retrieve phone number
      String phoneNumber = '';
      for (final attribute in result) {
        if (attribute.userAttributeKey.toString() == authUser.username) {
          phoneNumber = attribute.value;
          break;
        }
      }
      // Use the retrieved phone number or other user attributes as needed
      debugPrint('Phone Number: $phoneNumber');

      // Navigate to the desired screen or perform further actions with user details
      // ...
    } catch (e) {
      // Handle errors

      debugPrint('Error fetching user details: $e');
      BotToast.showText(text: e.toString());
    }
  }
}
