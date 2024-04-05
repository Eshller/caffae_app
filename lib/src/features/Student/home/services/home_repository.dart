import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';

final homerepositoryprovider =
    Provider<HomeAuthRepository>((ref) => HomeAuthRepository(ref: ref));

class HomeAuthRepository {
  ProviderRef ref;
  HomeAuthRepository({required this.ref});

  Future<UserModel?> getCurrentUser() async {
    UserModel? userModel;

    try {
      AuthUser res = await Amplify.Auth.getCurrentUser();

      List<UserModel> userData = await Amplify.DataStore.query(
          UserModel.classType,
          where: UserModel.ID.eq(res.userId));

      if (userData.isNotEmpty) {
        userModel = UserModel.fromJson(userData.first.toJson());
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return userModel;
  }

  Future<List<GuruModel>> fetchByInterest() async {
    try {
      final currentUser = ref.watch(userProvider).user;
      List<String> interests = currentUser.listExplore
              ?.map((explore) => explore.toString())
              .toList() ??
          [];

      List<GuruModel> combinedGurus = [];

      for (String interest in interests) {
        final request = ModelQueries.list(GuruModel.classType,
            where: GuruModel.SPECIALIST.eq(interest));

        final response = await Amplify.API.query(request: request).response;
        // print("length${response.data?.items.length}");
        if (response.data != null) {
          final gurus =
              response.data!.items.map((e) => e as GuruModel).toList();
          combinedGurus.addAll(gurus);
        }
      }

      safePrint(combinedGurus.length);

      return combinedGurus;
    } catch (error) {
      safePrint('Fetching gurus by interest failed: $error');
      return [];
    }
  }

  Future<List<GuruModel>> getGuru({required String specialist}) async {
    try {
      final request = ModelQueries.list(GuruModel.classType);
      final response = await Amplify.API.query(request: request).response;

      final gurus = response.data?.items;
      safePrint(gurus!.length);

      final filteredGurus = gurus.where((item) {
        final guru = item as GuruModel;
        return guru.specialist ==
            specialist; // Replace 'YourSpecialist' with the desired value
      }).toList();

      return filteredGurus.map((e) => e as GuruModel).toList();
      // return filteredGurus;
    } on Exception catch (error) {
      safePrint('gurus failed: $error');

      return const [];
    }
  }
}
