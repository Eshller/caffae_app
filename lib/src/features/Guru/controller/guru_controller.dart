// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:caffae_app/models/ModelProvider.dart';
import 'package:caffae_app/src/features/Guru/services/guru_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchAllReives =
    FutureProvider.family<List<ReviewsModel>, String>((ref, receiverId) async {
  final guruProvider = ref.watch(guruController);
  print("receiverid$receiverId");
  return guruProvider.gerRivews(receiverId: receiverId);
});
final averageRating =
    FutureProvider.family<double, String>((ref, receiverId) async {
  final guruProvider = ref.watch(guruController);
  return guruProvider.averageRating(receiverId: receiverId);
});

final guruController = Provider((ref) {
  final homeAuthController = ref.watch(guruRepository);
  return GuruController(homeAuthController);
});

class GuruController {
  final GuruRepository _guruRepository;
  GuruController(
    this._guruRepository,
  );
  // Future fetAllGuru() async {}

  Future<List<ReviewsModel>> gerRivews({required String receiverId}) async {
    return _guruRepository.fetchAllReviews(receiverId: receiverId);
  }

  Future<double> averageRating({required String receiverId}) async {
    return _guruRepository.calculateAverageRating(receiverId: receiverId);
  }
}
