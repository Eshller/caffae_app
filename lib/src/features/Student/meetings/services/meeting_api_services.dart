import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final meetingRepositoryProvider = Provider<MeetingRepository>((ref) {
  final service = MeetingRepository();
  return service;
});

class MeetingRepository {
  MeetingRepository();

  Future<void> addMeeting({required MeetingModel meetingModel}) async {
    try {
      final request = ModelMutations.create(meetingModel);
      final response = await Amplify.API.mutate(request: request).response;

      final meetings = response.data;
      if (meetings == null) {
        safePrint('Addmeetings errors: ${response.errors}');

        return;
      }
      BotToast.showText(text: 'Successfully added your meeting');
    } on Exception catch (e) {
      safePrint('Adding meeting failed: $e');

      BotToast.showText(text: e.toString());
      return;
    }
  }

  Future<void> updateIsDeclineField({
    required MeetingModel updateMeeting,
  }) async {
    try {
      await Amplify.API
          .mutate(request: ModelMutations.update(updateMeeting))
          .response;
    } on Exception catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> updateMeetingMakePaymentField({
    required MeetingModel updateMeeting,
  }) async {
    try {
      await Amplify.API
          .mutate(request: ModelMutations.update(updateMeeting))
          .response;
    } on Exception catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<List<MeetingModel>> getMeeting() async {
    try {
      final request = ModelQueries.list(
        MeetingModel.classType,
      );
      final response = await Amplify.API.query(request: request).response;

      final meetings = response.data?.items;
      if (meetings == null) {
        safePrint('getTrips errors: ${response.errors}');
        return const [];
      }
      return meetings.map((e) => e as MeetingModel).toList();
    } on Exception catch (e) {
      safePrint('getTrips failed: $e');

      return const [];
    }
  }
}
