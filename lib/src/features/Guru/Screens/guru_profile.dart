// ignore_for_file: depend_on_referenced_packages

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/Global/widgets/rating.dart';
import 'package:caffae_app/src/features/Guru/Screens/cll.dart';
import 'package:caffae_app/src/features/Guru/Screens/reviewlist.dart';
import 'package:caffae_app/src/features/Guru/controller/guru_controller.dart';
import 'package:caffae_app/src/features/Student/Guru_details/widgets/alert_dialog_feedback.dart';
import 'package:caffae_app/src/features/Student/Guru_details/widgets/chat_bottom_sheet.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../Student/Guru_details/widgets/meeting_bottom_sheet.dart';

enum CallType { audioCall, videoCall }

class GuruProfileScreen extends ConsumerStatefulWidget {
  final GuruModel guruModel;

  static const String routeName = 'guru-profile';
  const GuruProfileScreen({
    super.key,
    required this.guruModel,
  });

  @override
  ConsumerState<GuruProfileScreen> createState() => _GuruProfileScreenState();
}

class _GuruProfileScreenState extends ConsumerState<GuruProfileScreen> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController inviteeUsersIDTextCtrl = TextEditingController(text: '205334');
  void callBottomSheet(BuildContext context) {
    Get.bottomSheet(
      MeetingBottomSheet(
        guruModel: widget.guruModel,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  
}
void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    if (errorInvitees.isNotEmpty) {
      String userIDs = "";
      for (int index = 0; index < errorInvitees.length; index++) {
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        var userID = errorInvitees.elementAt(index);
        userIDs += userID + ' ';
      }
      if (userIDs.isNotEmpty) {
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = 'User doesn\'t exist or is offline: $userIDs';
      if (code.isNotEmpty) {
        message += ', code: $code, message:$message';
      }
      // showToast(
      //   message,
      //   position: StyledToastPosition.top,
      //   context: context,
      // );
    } else if (code.isNotEmpty) {
      // showToast(
      //   'code: $code, message:$message',
      //   position: StyledToastPosition.top,
      //   context: context,
      // );
    }
  }
Widget inviteeIDFormField({
  required TextEditingController textCtrl,
  List<TextInputFormatter>? formatters,
  String hintText = '',
  String labelText = '',
}) {
  const textStyle = TextStyle(fontSize: 12.0);
  return Expanded(
     
    child: TextFormField(
      style: textStyle,
      controller: textCtrl,
      inputFormatters: formatters,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: textStyle,
        labelText: labelText,
        labelStyle: textStyle,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}

Widget sendCallButton({
  required bool isVideoCall,
  required TextEditingController inviteeUsersIDTextCtrl,
  void Function(String code, String message, List<String>)? onCallFinished,
}) {
  return ValueListenableBuilder<TextEditingValue>(
    valueListenable: inviteeUsersIDTextCtrl,
    builder: (context, inviteeUserID, _) {
      var invitees = getInvitesFromTextCtrl(inviteeUsersIDTextCtrl.text.trim());

      return ZegoSendCallInvitationButton(
        isVideoCall: isVideoCall,
        invitees: invitees,
        resourceID: "caffae_call",
        iconSize: const Size(40, 40),
        buttonSize: const Size(50, 50),
        onPressed: onCallFinished,
      );
    },
  );
}

List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
  List<ZegoUIKitUser> invitees = [];

  var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
  inviteeIDs.split(",").forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: 'user_$inviteeUserID',
    ));
  });

  return invitees;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#D9D9D9'),
      body:  WillPopScope(
          onWillPop: () async {
            return ZegoUIKit().onWillPop(context);
          },

        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    const GuruProfileHeader(),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 190,
                      child: Stack(
                        // alignment: Alignment.center,
                        children: [
                          Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: kBackGroundColors,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/images/back.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 16,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 207, 216, 207),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    widget.guruModel.imageUrl.toString(),
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 2,
                                    top: 9,
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  inviteeIDFormField(
                          //                  textCtrl: inviteeUsersIDTextCtrl,
                          //                  formatters: [
                          //                    FilteringTextInputFormatter.allow(RegExp('[0-9,]')),
                          //                  ],
                          //                  labelText: "invitee ID",
                          //                  hintText: "plz enter invitee ID",
                          //                ),
                  sendCallButton(
                      isVideoCall: false,
                      inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
                      onCallFinished: onSendCallInvitationFinished,
                    
                    ),
                          const SizedBox(
                            height: 6,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CllPage()));
                            },
                            child: ReusableText(
                              text: widget.guruModel.name.toString(),
                              textStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color(0xFF5D5B5B),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ReusableText(
                            text: widget.guruModel.specialist.toString(),
                            textStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: const Color(0xFF5D5B5B),
                            ),
                          ),
                          const RatingButton(
                            rating: 5,
                            ignoreGestures: false,
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                          const GuruProfileReusableText(
                            text: 'About',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ReusableText(
                            text: widget.guruModel.about ?? '',
                            textStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          //const SizedBox(height: 8),
                          const GuruProfileReusableText(
                            text: 'Experience',
                          ),
                          //const SizedBox(
                          //  height: 8,
                          ReusableText(
                            text: widget.guruModel.experience ?? '',
                            textStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
        
                          const GuruProfileReusableText(
                            text: 'Fees',
                          ),
                          widget.guruModel.feesCharge?.audioCall != null
                              ? Row(
                                  children: [
                                    FeesChargeCard(
                                      text:
                                          'Video Call \n${widget.guruModel.feesCharge!.videoCall} Coins/min',
                                      width:
                                          MediaQuery.of(context).size.width / 3.3,
                                    ),
                                    FeesChargeCard(
                                      text:
                                          'Audio Call \n${widget.guruModel.feesCharge!.audioCall} Coins/min',
                                      width:
                                          MediaQuery.of(context).size.width / 3.5,
                                    ),
                                    FeesChargeCard(
                                        text: 'Chat \n(coming soon)',
                                        width: MediaQuery.of(context).size.width /
                                            3.49),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            height: 8,
                          ),
                          
                const Text(')'),
                          
                          const GuruProfileReusableText(
                            text: 'Total Sessions taken: 43',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const GuruProfileReusableText(
                            text: 'Reviews',
                          ),
        
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 110.h,
                            child: ref
                                .watch(fetchAllReives(widget.guruModel.id))
                                .when(
                                    data: (data) {
                                      return ref
                                          .watch(
                                              averageRating(widget.guruModel.id))
                                          .when(data: (rating) {
                                        final averageRating = rating;
                                        final userReviews = data;
                                        return ListView.separated(
                                          padding: EdgeInsets.only(left: 7.h),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (
                                            context,
                                            index,
                                          ) {
                                            return SizedBox(
                                              width: 11.h,
                                            );
                                          },
                                          itemCount: userReviews.length,
                                          itemBuilder: (context, index) {
                                            final reviews = userReviews[index];
        
                                            return Userprofilelist1ItemWidget(
                                              userprofilelist1ItemModelObj:
                                                  reviews,
                                              averageRating: averageRating,
                                            );
                                          },
                                        );
                                      }, error: (error, e) {
                                        return Text('error: $error');
                                      }, loading: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                    },
                                    error: ((error, stackTrace) {
                                      return Text('error: $error');
                                    }),
                                    loading: () => const Center(
                                        child: CircularProgressIndicator())),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              // Flexible(flex: 1, child: Container()),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: HexColor('#2067FD'),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x40000000),
                          ),
                          BoxShadow(color: Color(0x40000000))
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ChatBottomSheet();
                                });
                          },
                          child: Image.asset('assets/images/messages.png'),
                        ),
                        ZegoSendCallInvitationButton(
            isVideoCall: true,
            invitees: [ZegoUIKitUser(id: '205334', name: 'jack')],
            resourceID: "caffae_call",
            iconSize: const Size(40, 40),
            buttonSize: const Size(50, 50),
            // onPressed: onCallFinished,
          ),
                        // GestureDetector(
                        //   onTap: () async {
                        //     sendCallButton(
                        //       username: '',
                        //       isVideoCall: false,
                        //       inviteeUsersIDTextCtrl: inviteeUsersIDTextCtrl,
                        //       onCallFinished: onSendCallInvitationFinished,
                        //     );
                        //   },
                        //   child: Image.asset(
                        //     'assets/images/phone.png',
                        //   ),
                        // ),
                        InkWell(
                          onTap: () async {
                            // await makeFakeCallInComing(CallType.videoCall);
                            // callOutGoing();
                          },
                          child: Image.asset(
                            'assets/images/video.png',
                          ),
                        ),
                        InkWell(
                          // onTap: openMeeting,
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return MeetingBottomSheet(
                                    guruModel: widget.guruModel,
                                  );
                                });
                          },
                          child: Image.asset(
                            'assets/images/shedult.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // for sending push notification

  showAlertDialog({
    required BuildContext context,
    required TextEditingController messageController,
    required double rating,
    required VoidCallback onTap,
    required GuruModel guruModel,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialogFeedBack(
          messageController: messageController,
          ontTap: onTap,
          guruModel: guruModel,
          rating: rating,
        );
      },
    );
  }

  void openMeeting() {
    Get.bottomSheet(
      MeetingBottomSheet(
        guruModel: widget.guruModel,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

// --- Button Widget --- //
  void openBottomSheet() {
    Get.bottomSheet(
      const ChatBottomSheet(),
      // const Text('jack'),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class FeesChargeCard extends StatelessWidget {
  final double width;
  final String text;
  const FeesChargeCard({super.key, required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GlobalContainer(
        height: 57,
        borderWidth: 0.0,
        width: width,
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: ReusableText(
              text: text,
              // text:
              //     widget.guruModel.feesCharge!.videoCall,
              align: TextAlign.center,
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: const Color(0xFF283246),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GuruProfileReusableText extends StatelessWidget {
  final String text;
  const GuruProfileReusableText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableText(
      text: text,
      textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: const Color(0xFF000000),
      ),
    );
  }
}

class GuruProfileHeader extends StatelessWidget {
  const GuruProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 44),
            height: 30,
            decoration: BoxDecoration(
                color: kBackGroundColors,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svg/game-icons_two-coins.svg'),
                ReusableText(
                  text: '10',
                  textStyle: appStyle(
                    fw: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final ReviewsModel ja;
  final UserModel user;
  const ReviewCard({super.key, required this.ja, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: GlobalContainer(
        height: 65,
        borderWidth: 1.1,
        width: 250,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              ReusableText(
                text: user.username.toString(),
                textStyle: appStyle(
                  fw: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const RatingButton(
                rating: 5,
                ignoreGestures: true,
              ),
              const SizedBox(
                height: 3,
              ),
              ReusableText(
                align: TextAlign.center,
                text: ja.message ?? '',
                textStyle: appStyle(
                  fw: FontWeight.w400,
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
