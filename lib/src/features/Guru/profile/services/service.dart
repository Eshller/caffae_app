import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final profileRepositoryProvider = Provider((ref) => ProfileRepository());

class ProfileRepository extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // fetch userDetails with userID
  Future<UserModel> getUserDetails({
    required String userId,
    required BuildContext context,
  }) async {
    UserModel? userModel;
    loading = true;
    try {
      List<UserModel> users = await Amplify.DataStore.query(UserModel.classType,
          where: UserModel.ID.eq(userId));
      userModel = users.first;
      loading = false;
      return userModel;
    } on DataStoreException catch (e) {
      if (context.mounted) {
        snackbar(context: context, content: e.toString());
      }
      loading = false;
      return userModel!;
    }
  }

  // update username;
  Future<bool> updateUsername({
    required String userId,
    required BuildContext context,
    required String username,
  }) async {
    loading = true;
    List<UserModel> users = await Amplify.DataStore.query(UserModel.classType,
        where: UserModel.ID.eq(userId));

    UserModel updatedUser = users.first.copyWith(username: username);

    try {
      await Amplify.DataStore.save(updatedUser);
      loading = false;
      return true;
    } on DataStoreException catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        snackbar(context: context, content: e.toString());
      }
      loading = false;
      return false;
    }
  }

  // update profilePhoto
  Future<bool> updateUserProfile({
    required String userID,
    required String photoUrl,
    required BuildContext context,
  }) async {
    loading = true;
    List<UserModel> users = await Amplify.DataStore.query(UserModel.classType,
        where: UserModel.ID.eq(userID));
    UserModel updatedUser = users.first.copyWith(photoUrl: photoUrl);
    try {
      await Amplify.DataStore.save(updatedUser);
      loading = false;
      return true;
    } on DataStoreException catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        snackbar(context: context, content: e.toString());
      }
      loading = false;
      return false;
    }
  }

  Future<void> addGuruInformation({
    required GuruModel guruModel,
    required BuildContext context,
    required String currentUserId,
  }) async {
    try {
      loading = true;
      await Amplify.DataStore.save(guruModel);

      // Assuming updating 'isGuru' field in Users table
      final user = await Amplify.DataStore.query(
        UserModel.classType,
        where: UserModel.ID.eq(currentUserId),
      );

      if (user.isNotEmpty) {
        final updatedUser = user.first.copyWith(isGuru: true);
        await Amplify.DataStore.save(updatedUser);
      }
      loading = false;
    } on AmplifyException catch (e) {
      if (context.mounted) {
        // Assuming snackbar is a function to display a snackbar in Flutter
        snackbar(context: context, content: e.toString());
      }
      debugPrint(e.toString());
      loading = false;
    }
  }

  Future<void> updateFeesCharge({
    required FeesCharge feesCharge,
    required BuildContext context,
    required String currentUserId,
  }) async {
    try {
      final guru = GuruModel(id: currentUserId, feesCharge: feesCharge);

      await Amplify.DataStore.save(guru);
      if (context.mounted) {
        snackbar(context: context, content: 'Updated fees charge successfully');
      }
      // Show a success message using a snackbar
    } on AmplifyException catch (e) {
      if (context.mounted) {
        // Show an error message using a snackbar
        snackbar(context: context, content: e.toString());
      }
      debugPrint(e.toString());
    }
  }
}
