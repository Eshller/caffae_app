import 'package:caffae_app/models/ModelProvider.dart';
import 'package:caffae_app/src/features/Student/meetings/data/meeting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meeting_controller.g.dart';

// final meetingsProvider = StateProvider<AsyncValue<List<MeetingModel>>>((ref) {
//   return ref.watch(meetingListControllerProvider);
// });

@riverpod
class MeetingListController extends _$MeetingListController {
  Future<List<MeetingModel>> _fetchMeetings() async {
    final tripsRepository = ref.read(tripsRepositoryProvider);
    final trips = await tripsRepository.fetchMeeting();
    return trips;
  }

  @override
  FutureOr<List<MeetingModel>> build() async {
    return _fetchMeetings();
  }

  Future<void> addTrip({required MeetingModel meetingModel}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final tripsRepository = ref.read(tripsRepositoryProvider);
      await tripsRepository.addMeetings(updateMeeting: meetingModel);
      return _fetchMeetings();
    });
  }

  Future<void> updateIsDeclineField(MeetingModel meetingModel) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final tripsRepository = ref.read(tripsRepositoryProvider);
      await tripsRepository.updateIsDeclineField(updateMeeting: meetingModel);

      return _fetchMeetings();
    });
  }

  Future<void> updatePayement(MeetingModel meetingModel) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final tripsRepository = ref.read(tripsRepositoryProvider);

      await tripsRepository.updateMeetingMakePaymentMethod(
          meetingModel: meetingModel);

      return _fetchMeetings();
    });
  }
}
