// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:caffae_app/src/Global/Export/export.dart';

// final reviewController = Provider((ref) => ReviewsRepository());

// class ReviewsRepository extends ChangeNotifier {
//   bool _loading = false;

//   bool get loading => _loading;

//   set loading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//   // addReviews

//   Future<bool> addOrUpdateReviewOnAmplify({
//     required String message,
//     required String senderId,
//     required String receiverId,
//     required int? rating,
//     required BuildContext context,
//   }) async {
//     loading = true;
//     try {
//       // Query for existing reviews based on senderId and receiverId
//       final existingReviews = await Amplify.DataStore.query(
//         ReviewsModel.classType,
//         where: ReviewsModel.SENDERID
//             .eq(senderId)
//             .and(ReviewsModel.RECIEVERID.eq(receiverId)),
//       );

//       if (existingReviews.isNotEmpty) {
//         // Update the existing review
//         final existingReview = existingReviews.first;
//         final updatedReview = existingReview.copyWith(
//           message: message,
//           rating: rating,
//         );
//         await Amplify.DataStore.save(updatedReview);
//       } else {
//         // Create a new review
//         final newReview = ReviewsModel(
//           message: message,
//           recieverId: receiverId,
//           senderId: senderId,
//           rating: rating,
//         );
//         await Amplify.DataStore.save(newReview);
//       }
//       loading = false;
//       return true;
//     } on DataStoreException catch (e) {
//       if (context.mounted) {
//         snackbar(context: context, content: e.message);
//       }
//       debugPrint('Error adding or updating review: $e');
//       loading = false;
//       return false;
//       // Handle the error as needed
//     }
//   }
//   // fetchAllReview Based on the

//   Future<List<ReviewsModel>> fetchAllReviewsByReceiver(
//       {required String receiverId, required BuildContext context}) async {
//     loading = true;
//     try {
//       // Query all reviews based on the receiverId using Amplify DataStore
//       final reviews = await Amplify.DataStore.query(
//         ReviewsModel.classType,
//         where: ReviewsModel.RECIEVERID.eq(receiverId),
//       );
//       loading = false;
//       return reviews;
//     } catch (e) {
//       if (context.mounted) {
//         snackbar(context: context, content: e.toString());
//       }

//       debugPrint('Error fetching reviews: $e');
//       loading = false;
//       return []; // Return an empty list or handle error accordingly
//     }
//   }
// }
