// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

// final fetchBasedOnInterestStateNotifierProvider = StateNotifierProvider((ref) {
//   final homeAuthController = ref.watch(homeAuthControllerProvider);
//   return homeAuthController.getGuruBasedOnInterest();
// });
final fetchBasedOnInterestProvider =
    FutureProvider.family<List<GuruModel>, String>((ref, specialist) {
  final homeAuthController = ref.watch(homeAuthControllerProvider);
  return homeAuthController.getRecentGurus(specialist: specialist);
});
final fetchByInterset = FutureProvider((ref) {
  final homeAuthController = ref.watch(homeAuthControllerProvider);
  return homeAuthController.fetchByInterest();
});

final homeAuthRepositoryProvider =
    Provider((ref) => HomeAuthRepository(ref: ref));

final homeAuthControllerProvider = ChangeNotifierProvider((ref) {
  final repository = ref.watch(homeAuthRepositoryProvider);
  return HomeAuthController(repository);
});

class HomeAuthController extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final HomeAuthRepository _repository;

  HomeAuthController(this._repository);

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  final List<GuruModel> _recentGurus = [];
  List<GuruModel> get recentGurus => _recentGurus;

  Future<void> getCurrentUser() async {
    loading = true; // Set loading to true before fetching
    notifyListeners();

    try {
      _currentUser = await _repository.getCurrentUser();
    } on AmplifyException catch (e) {
      debugPrint(e.message);
    } finally {
      loading =
          false; // Set loading to false after fetching, whether success or failure
      notifyListeners();
    }
  }

  Future<List<GuruModel>> getRecentGurus({required String specialist}) async {
    return _repository.getGuru(specialist: specialist);
  }

  Future<List<GuruModel>> fetchByInterest() async {
    return _repository.fetchByInterest();
  }
}
