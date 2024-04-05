import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

final meetingRepository = Provider((ref) => MeetingRepository());

class MeetingRepository {
  Future<void> addMeetingToAws({required MeetingModel meetingModel}) async {
    try {
      // Retrieve the meeting
      List<MeetingModel> meetings = await fetchMeeting(
          receiverId: meetingModel.receiverId!,
          senderId: meetingModel.senderId!);

      if (meetings.isNotEmpty) {
        await Amplify.API
            .mutate(
              request: ModelMutations.update(meetingModel),
            )
            .response;
      } else {
        final request = ModelMutations.create(meetingModel);
        final response = await Amplify.API.mutate(request: request).response;

        final createdTrip = response.data;
        if (createdTrip == null) {
          safePrint('addTrip errors: ${response.errors}');
          return;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> addAllMeetings({required MeetingModel meetingModel}) async {
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
      return true;
    } on Exception catch (e) {
      safePrint('meetings failed: $e');
      BotToast.closeAllLoading();
      BotToast.showText(text: e.toString());
      return false;
    }
  }

  Future<List<MeetingModel>> fetchMeeting(
      {required String receiverId, required String senderId}) async {
    try {
      final request = ModelQueries.list(MeetingModel.classType);
      final response = await Amplify.API.query(request: request).response;

      final meetings = response.data?.items;
      if (meetings == null) {
        safePrint('getTrips errors: ${response.errors}');
        return const [];
      }

      return meetings
          .map((e) => e as MeetingModel)
          .where(
            (element) => element.receiverId == receiverId,
          )
          .where((element) => element.senderId == senderId)
          .toList();
    } on Exception catch (error) {
      safePrint('getTrips failed: $error');

      return const [];
    }
  }

  Future<MeetingModel> fetchAllMeetingsByStudentId({
    required String senderId,
  }) async {
    try {
      final request = ModelQueries.get(
        MeetingModel.classType,
        MeetingModelModelIdentifier(id: senderId),
      );
      final response = await Amplify.API.query(request: request).response;

      final trip = response.data!;
      return trip;
    } on Exception catch (error) {
      safePrint('getTrip failed: $error');
      rethrow;
    }
  }

  Future<void> updateMeetingFieldById({
    required String receiverId,
    required bool isAccept,
  }) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.RECEIVERID.eq(receiverId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate = meetings.first.copyWith(isAccept: isAccept);
        await Amplify.DataStore.save(meetingToUpdate);
      } else {
        debugPrint("No document found with receiverId: $receiverId");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> updateIsDeclineField({
    required String receiverId,
    required bool isDecline,
  }) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.RECEIVERID.eq(receiverId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate = meetings.first.copyWith(isDecline: isDecline);
        await Amplify.DataStore.save(meetingToUpdate);
        return true;
      } else {
        debugPrint("No document found with receiverId: $receiverId");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }

  Future<bool> updateMeetingMakePaymentField({
    required String senderId,
    required bool isDonePayment,
  }) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.SENDERID.eq(senderId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate =
            meetings.first.copyWith(isDonePayment: isDonePayment);
        await Amplify.DataStore.save(meetingToUpdate);
        return true;
      } else {
        debugPrint("No document found with senderId: $senderId");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());

      return false;
    }
  }
}

final meetingStateNotifierProvider =
    StateNotifierProvider<MeetingStateNotifier, List<MeetingModel>>((ref) {
  return MeetingStateNotifier();
});

class MeetingStateNotifier extends StateNotifier<List<MeetingModel>> {
  MeetingStateNotifier() : super([]);

  Future<void> fetchMeetingsBySenderId(String senderId) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.SENDERID.eq(senderId),
      );

      state = meetings;
    } catch (e) {
      debugPrint('Error fetching meetings: $e');
    }
  }

  Future<void> updateMeetingAccept(String receiverId, bool isAccept) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.RECEIVERID.eq(receiverId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate = meetings.first.copyWith(isAccept: isAccept);
        await Amplify.DataStore.save(meetingToUpdate);
        state = [...state]; // Triggers state update
      } else {
        debugPrint("No meeting found with receiverId: $receiverId");
      }
    } catch (e) {
      debugPrint('Error updating meeting accept status: $e');
    }
  }

  Future<void> updateIsDecline(String receiverId, bool isDecline) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.RECEIVERID.eq(receiverId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate = meetings.first.copyWith(isDecline: isDecline);
        await Amplify.DataStore.save(meetingToUpdate);
        state = [...state]; // Triggers state update
      } else {
        debugPrint("No meeting found with receiverId: $receiverId");
      }
    } catch (e) {
      debugPrint('Error updating isDecline status: $e');
    }
  }

  Future<void> updatePaymentStatus(String senderId, bool isDonePayment) async {
    try {
      final meetings = await Amplify.DataStore.query(
        MeetingModel.classType,
        where: MeetingModel.SENDERID.eq(senderId),
      );

      if (meetings.isNotEmpty) {
        final meetingToUpdate =
            meetings.first.copyWith(isDonePayment: isDonePayment);
        await Amplify.DataStore.save(meetingToUpdate);
        state = [...state]; // Triggers state update
      } else {
        debugPrint("No meeting found with senderId: $senderId");
      }
    } catch (e) {
      debugPrint('Error updating payment status: $e');
    }
  }
}
