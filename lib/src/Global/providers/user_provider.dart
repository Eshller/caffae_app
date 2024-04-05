// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:hive_flutter/hive_flutter.dart';

final userProvider =
    ChangeNotifierProvider<UserProvider>((ref) => UserProvider(ref: ref));
final firebaseMessagingTokenProvider = FutureProvider<String>((ref) async {
  FirebaseMessaging fMessaging = FirebaseMessaging.instance;
  await fMessaging.requestPermission();
  final token = await fMessaging.getToken();

  return token ?? ''; // Return an empty string if the token is null
});

class UserProvider extends ChangeNotifier {
  final ChangeNotifierProviderRef ref;
  late String _pushtoken; // Declare _pushtoken without initializing here

  UserProvider({
    required this.ref,
  }) : _pushtoken = ''; // Initialize _pushtoken in the constructor

  set token(String token) {
    _pushtoken = token;
    notifyListeners(); // Notify listeners when the token is set
    updateUserPushToken(token); // Update UserModel's pushToken
  }

  String get pushToken => _pushtoken;

  UserModel _user = UserModel(
    id: '',
    username: '',
    isGuru: false,
    documentId: '',
    phoneNumber: '',
    role: '',
    photoUrl: '',
    listExplore: [],
    createdAt: '',
    isVerified: false,
    pushToken: '', // Set an initial value here
  );
  UserModel get user => _user;

  void setUserFromModel(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void updateUserPushToken(String token) {
    _user = UserModel(
      id: _user.id,
      username: _user.username,
      isGuru: _user.isGuru,
      documentId: _user.documentId,
      phoneNumber: _user.phoneNumber,
      role: _user.role,
      photoUrl: _user.photoUrl,
      listExplore: _user.listExplore,
      createdAt: _user.createdAt,
      isVerified: _user.isVerified,
      pushToken: token, // Update pushToken with the new token
    );
    notifyListeners();
  }
}

class UserModelHiveProvider extends ChangeNotifier {
  final Box<UserModel> _userBox;

  UserModelHiveProvider(this._userBox);

  UserModel? get user {
    return _userBox.get("current_user");
  }

  void updateUserInHive(UserModel updatedUser) {
    _userBox.put("current_user", updatedUser);
    safePrint('welcome hive');
    notifyListeners();
  }
}

final userFromHiveProvider = Provider<UserModelHiveProvider>((ref) {
  final box = Hive.box<UserModel>('user');

  return UserModelHiveProvider(box);
});
