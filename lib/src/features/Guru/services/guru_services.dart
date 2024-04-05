import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final guruRepository = Provider<GuruRepository>(((ref) => GuruRepository()));

class GuruRepository {
  Future<void> addReviewsOnFirebase({
    required String message,
    required String senderId,
    required String recieverId,
    required int? rating,
  }) async {}

  Future<List<ReviewsModel>> fetchAllReviews({
    required String receiverId,
  }) async {
    try {
      final request = ModelQueries.list(ReviewsModel.classType);
      final response = await Amplify.API.query(request: request).response;
      safePrint("reviews${response.data?.items}");
      final reviews = response.data?.items;
      safePrint("jack${reviews!.length}");

      final filteredGurus = reviews.where((item) {
        final guru = item as ReviewsModel;
        return guru.recieverId == receiverId;
      }).toList();

      return filteredGurus.map((e) => e as ReviewsModel).toList();
      // return filteredGurus;
    } on Exception catch (error) {
      safePrint('gurus failed: $error');

      return const [];
    }
  }

  Future<double> calculateAverageRating({
    required String receiverId,
  }) async {
    try {
      // Query ReviewsModel objects based on receiverId
      final request = ModelQueries.list(ReviewsModel.classType);
      final response = await Amplify.API.query(request: request).response;

      final reviews = response.data?.items;
      safePrint("jack${reviews!.length}");

      final reviewsList = reviews.where((item) {
        final review = item as ReviewsModel;
        return review.recieverId == receiverId;
      }).toList();

      if (reviewsList.isEmpty) {
        return 0.0; // Return 0 if there are no reviews for the receiverId
      }

      // Calculate the average total rating
      int totalRatings = reviewsList.fold(
        0,
        (sum, review) => sum + (review?.rating ?? 0),
      );
      double averageRating = totalRatings / reviewsList.length;

      return averageRating;
    } on AmplifyException catch (e) {
      debugPrint('Error calculating average rating: $e');
      return 0.0;
    }
  }
}

// Assuming you have already set up your Firebase instance and Firestore collection

// Function to calculate average total rating based on receiverId
Future calculateAverageRating(String receiverId) async {}
