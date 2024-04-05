import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final meetingProvider =
    ChangeNotifierProvider<MeetingProvider>((ref) => MeetingProvider());

class MeetingProvider extends ChangeNotifier {
  final List<MeetingModel> _meetings = []; // Initial empty list of meetings
  List<MeetingModel> get meetings => _meetings;

  Future<bool> addMeeting({required MeetingModel meetingModel}) async {
    try {
      BotToast.showLoading();

      final request = ModelMutations.create(meetingModel);
      final response = await Amplify.API.mutate(request: request).response;

      final meetings = response.data;
      if (meetings == null) {
        safePrint('Addmeetings errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }
      _meetings.add(meetings);

      BotToast.closeAllLoading();

      notifyListeners();
      return true;
    } on Exception catch (e) {
      safePrint('Adding meeting failed: $e');
      BotToast.closeAllLoading();
      BotToast.showText(text: e.toString());
      return false;
    }
  }

  Future<bool> updateIsDeclineField({
    required String receiverId,
    required bool isDecline,
  }) async {
    try {
      final meeting = await getMeeting(senderId: 'senderId');
      final updateMeeting = meeting.copyWith(isDecline: isDecline);
      final request = ModelMutations.update(updateMeeting);
      final response = await Amplify.API.mutate(request: request).response;
      final updatedMeetings = response.data;
      if (updatedMeetings == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }
      _meetings.add(updateMeeting);
      safePrint('Mutation result: ${updatedMeetings.id}');
      BotToast.closeAllLoading();
      return true;
    } on Exception catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<bool> updateMeetingMakePaymentField({
    required String receiverId,
    required bool isDonePayment,
  }) async {
    try {
      final meeting = await getMeeting(senderId: 'senderId');
      final updateMeeting = meeting.copyWith(isDonePayment: isDonePayment);
      final request = ModelMutations.update(updateMeeting);
      final response = await Amplify.API.mutate(request: request).response;
      final updatedMeetings = response.data;
      if (updatedMeetings == null) {
        safePrint('errors: ${response.errors}');
        BotToast.closeAllLoading();
        return false;
      }
      _meetings.add(updateMeeting);
      safePrint('Mutation result: ${updatedMeetings.id}');
      BotToast.closeAllLoading();
      return true;
    } on Exception catch (e) {
      safePrint('Mutation failed: $e');
      BotToast.closeAllLoading();
      return false;
    }
  }

  Future<MeetingModel> getMeeting({required String senderId}) async {
    final request = ModelQueries.get(
        MeetingModel.classType, MeetingModelModelIdentifier(id: senderId));
    final response = await Amplify.API.query(request: request).response;
    final meetings = response.data!;
    _meetings.add(meetings);
    return meetings;
  }
}
