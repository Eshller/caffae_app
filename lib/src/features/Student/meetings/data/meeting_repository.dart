import 'package:caffae_app/models/ModelProvider.dart';
import 'package:caffae_app/src/features/Student/meetings/services/meeting_api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tripsRepositoryProvider = Provider<TripsRepository>((ref) {
  final tripsAPIService = ref.read(meetingRepositoryProvider);
  return TripsRepository(tripsAPIService);
});

class TripsRepository {
  TripsRepository(this.tripsAPIService);

  final MeetingRepository tripsAPIService;

  Future<List<MeetingModel>> fetchMeeting() {
    return tripsAPIService.getMeeting();
  }

  Future<void> updateMeetingMakePaymentMethod(
      {required MeetingModel meetingModel}) async {
    return tripsAPIService.updateMeetingMakePaymentField(
        updateMeeting: meetingModel);
  }

  Future<void> updateIsDeclineField(
      {required MeetingModel updateMeeting}) async {
    return tripsAPIService.updateIsDeclineField(updateMeeting: updateMeeting);
  }

  Future<void> addMeetings({required MeetingModel updateMeeting}) async {
    return tripsAPIService.addMeeting(meetingModel: updateMeeting);
  }
}
