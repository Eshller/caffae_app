import 'dart:io';
import 'package:caffae_app/src/features/Student/profile/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileController = Provider((ref) {
  final profileProvider = ref.watch(profileServiceProvider);
  return ProfileController(profileService: profileProvider, ref: ref);
});

class ProfileController {
  final ProfileService profileService;
  final ProviderRef ref;
  ProfileController({
    required this.profileService,
    required this.ref,
  });
  void updateUserName({
    required String userName,
    required BuildContext context,
  }) {
    profileService.updateUserName(
        userName: userName, ref: ref, context: context);
  }

  void updateProfile({
    required File? imageUrl,
    required BuildContext context,
  }) {
    profileService.updateUserProfile(
        profilePic: imageUrl, ref: ref, context: context);
  }

  void uploadDocumentId({
    required File imageUrl,
    required BuildContext context,
  }) {
    profileService.uploadDocument(
      documentId: imageUrl,
      ref: ref,
      context: context,
    );
  }
}
