import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final profileServiceProvider = Provider((ref) => ProfileService());

class ProfileService {
  Future<void> uploadDocument({
    required File documentId,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {} catch (e) {
      if (context.mounted) {}
      debugPrint(e.toString());
    }
  }

  Future<void> updateUserName({
    required String userName,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {} catch (e) {
      if (context.mounted) {
        snackbar(context: context, content: e.toString());
      }
      debugPrint(e.toString());
    }
  }

  Future<void> updateUserProfile({
    required BuildContext context,
    required ProviderRef ref,
    required File? profilePic,
  }) async {
    try {} catch (e) {
      if (context.mounted) {
        snackbar(context: context, content: e.toString());
      }
      debugPrint(e.toString());
    }
  }

  Future<bool> addGuruInformation({required GuruModel guruModel}) async {
    try {
      BotToast.showLoading();
      final request = ModelMutations.create(guruModel);
      final response = await Amplify.API.mutate(request: request).response;
      final updatedUser = response.data;
      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }

      safePrint('Mutation result: ${updatedUser.id}');
      BotToast.closeAllLoading();
      return true;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<bool> updateFees(
      {required FeesCharge feesCharge, required String currentGuruId}) async {
    try {
      BotToast.showLoading();
      final getGuru = await getCurrentGuru(
        currentGuruId: currentGuruId,
      );
      final updateGuru = getGuru.copyWith(feesCharge: feesCharge);
      final response = await Amplify.API
          .mutate(request: ModelMutations.update(updateGuru))
          .response;
      final updatedUser = response.data;
      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }

      safePrint('Mutation result: ${updatedUser.id}');
      BotToast.closeAllLoading();
      return true;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<GuruModel> getCurrentGuru({required String currentGuruId}) async {
    try {
      BotToast.showLoading();
      final request = ModelQueries.get(
          GuruModel.classType, GuruModelModelIdentifier(id: currentGuruId));
      final response = await Amplify.API.query(request: request).response;

      final updatedUser = response.data;

      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
      }

      // safePrint('Mutation result: ${updatedUser.id}');
      BotToast.closeAllLoading();
      return updatedUser!;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      rethrow;
    }
  }
}
