// ignore_for_file: deprecated_member_use, depend_on_referenced_packages
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

final AmplifyLogger _logger = AmplifyLogger('MyStorageApp');

final profile = Provider((ref) => ProfileRepository(ref: ref));

class ProfileRepository extends ChangeNotifier {
  ProviderRef ref;

  ProfileRepository({required this.ref});
  bool _loading = false;
  String _userId = '';

  bool _logout = false;

  bool get logout => _logout;

  set logout(bool value) {
    _logout = value;
    notifyListeners();
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
    notifyListeners();
  }

  // String _profilePic = "";
  String _profilePicKey = "";

  String get profilePicKey => _profilePicKey;

  set profilePicKey(String value) {
    _profilePicKey = value;
    notifyListeners();
  }

  // String get profilePic => _profilePic;

  // set profilePic(String value) {
  //   _profilePic = value;
  //   notifyListeners();
  // }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      ),
    ));
  }

  // upload a file to the S3 bucket
  Future<String> uploadFile({
    required FilePickerResult result,
    required BuildContext context,
  }) async {
    final platformFile = result.files.single;

    try {
      // Map<String, String> metadata = <String, String>{};
      // metadata['name'] = "user_$uuid";

      // metadata['desc'] = 'A profile picture ';
      S3UploadFileOptions options = const S3UploadFileOptions(
        accessLevel: StorageAccessLevel.guest,
      );
      StorageUploadFileResult res = await Amplify.Storage.uploadFile(
        options: options,
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        key: platformFile.name,
        onProgress: (p) =>
            _logger.debug('Uploading: ${p.transferredBytes}/${p.totalBytes}'),
      ).result;

      StorageItem item = res.uploadedItem;

      String key = item.key;

      final result = await Amplify.Storage.getUrl(
        key: key,
        /*options: const StorageGetUrlOptions(

        ),*/
      ).result;
      final url = result.url.toString();

      return url;
    } on StorageException catch (e) {
      if (context.mounted) {
        showInSnackBar(context, e.message);
      }

      _logger.error('Error uploading file - ${e.message}');
      return '';
    }
  }

  Future<FilePickerResult?> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: false,
        withReadStream: true,
        allowedExtensions: ['jpg', 'png', 'gif'],
      );
      return result;
    } catch (e) {
      safePrint('Error picking image: $e');
      return null;
    }
  }

  Future<void> uploadImage({
    required FilePickerResult result,
    required BuildContext context,
  }) async {
    // Select a file from the device
    // final result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   withData: false,
    //   // Ensure to get file stream for better performance
    //   withReadStream: true,
    //   allowedExtensions: ['jpg', 'png', 'gif'],
    // );

    // if (result == null) {
    //   safePrint('No file selected');
    //   return;
    // }

    // Upload file with its filename as the key
    final platformFile = result.files.single;
    try {
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        key: platformFile.name,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      rethrow;
    }
  }

  // AuthUser? currentUser;
  Future<UserModel> getUser(String userId) async {
    try {
      final request = ModelQueries.get(
        UserModel.classType,
        UserModelModelIdentifier(id: userId),
      );
      final response = await Amplify.API.query(request: request).response;

      final userData = response.data!;
      ref.watch(userProvider).setUserFromModel(userData);
      return userData;
    } on Exception catch (error) {
      safePrint('getTrip failed: $error');
      rethrow;
    }
  }

  Future<bool> updateUserModel(
      {required String userId, required List<String> listOfExplore}) async {
    try {
      BotToast.showLoading();
      // final requests = ModelMutations.update()
      final user = await getUser(userId);
      final currentUpdate = user.copyWith(listExplore: listOfExplore);
      final request = ModelMutations.update(currentUpdate);
      final response = await Amplify.API.mutate(request: request).response;

      final updatedUser = response.data;
      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }
      ref.watch(userProvider).setUserFromModel(updatedUser);
      safePrint('Mutation result: ${updatedUser.id}');
      BotToast.closeAllLoading();
      return true;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<bool> updateUserName(
      {required String name, required String userId}) async {
    try {
      BotToast.showLoading();

      final user = await getUser(userId);
      final currentUpdate = user.copyWith(name: name);
      final request = ModelMutations.update(currentUpdate);
      final response = await Amplify.API.mutate(request: request).response;

      final updatedUser = response.data;

      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }

      Future.delayed(Duration.zero, () {
        ref.read(userProvider).setUserFromModel(updatedUser);
        // Rest of your logic here...
      });
      safePrint('Mutation result: ${updatedUser.id}');
      BotToast.closeAllLoading();
      return true;
    } catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<bool> signOut({required BuildContext context}) async {
    try {
      Amplify.Auth.signOut();
      return logout = true;
    } on AuthException catch (e) {
      debugPrint(e.message);
      if (context.mounted) {
        showInSnackBar(context, e.message);
      }
      return logout = false;
    }
  }

// fethc current user based on id
}

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(ref: ref);
});

class StorageService {
  StorageService({
    required Ref ref,
  });

  ValueNotifier<double> uploadProgress = ValueNotifier<double>(0);
  Future<String> getImageUrl(String key) async {
    final result = await Amplify.Storage.getUrl(
      key: key,
      options: const StorageGetUrlOptions(
        pluginOptions: S3GetUrlPluginOptions(
          validateObjectExistence: true,
          expiresIn: Duration(days: 1),
        ),
      ),
    ).result;
    return result.url.toString();
  }

  ValueNotifier<double> getUploadProgress() {
    return uploadProgress;
  }

  Future<String?> uploadFile(File file) async {
    try {
      final extension = p.extension(file.path);
      final key = const Uuid().v1() + extension;
      final awsFile = AWSFile.fromPath(file.path);

      await Amplify.Storage.uploadFile(
        localFile: awsFile,
        key: key,
        onProgress: (progress) {
          uploadProgress.value = progress.fractionCompleted;
        },
      ).result;

      return key;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  void resetUploadProgress() {
    uploadProgress.value = 0;
  }
}
