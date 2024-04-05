import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Guru/message/services/repository_meeting.dart';
import 'package:caffae_app/src/features/Guru/search/widgets/shimmer_item.dart';
import 'package:caffae_app/src/features/Student/meetings/controller/meeting_controller.dart';

class GuruMessagePage extends ConsumerWidget {
  const GuruMessagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider).user;

    final AsyncValue<List<MeetingModel>> meetings =
        ref.watch(meetingListControllerProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 62),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const CommonProfileHeader(),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     right: 12,
              //     left: 12,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           Navigator.of(context).pop();
              //         },
              //         child: const Icon(
              //           Icons.arrow_back,
              //           size: 30,
              //         ),
              //       ),
              //       Container(
              //         constraints: const BoxConstraints(minWidth: 44),
              //         height: 30,
              //         decoration: BoxDecoration(
              //             color: kBackGroundColors,
              //             borderRadius: BorderRadius.circular(10)),
              //         padding: const EdgeInsets.all(6),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             SvgPicture.asset(
              //                 'assets/svg/game-icons_two-coins.svg'),
              //             ReusableText(
              //               text: '10',
              //               textStyle: appStyle(
              //                 fw: FontWeight.w500,
              //                 fontSize: 15,
              //                 color: Colors.white,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              meetings.when(
                data: (data) {
                  final filtered = data.where((meeting) {
                    // Filter conditions
                    return meeting.receiverId == currentUser.id;
                  }).toList();

                  if (filtered.isNotEmpty) {
                    return ListView.builder(
                      itemCount: filtered.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 5),
                      itemBuilder: (context, index) {
                        final listOfMeetings = filtered[index];
                        return GuruMessageCard(listOfMeetings: listOfMeetings);
                      },
                    );
                  }
                  return Center(
                    child: ReusableText(
                        text: "You don't have any meeting yet",
                        textStyle: appStyle(
                            fw: FontWeight.w600,
                            fontSize: 14,
                            color: blackColor)),
                  );
                },
                loading: () => ListView.builder(
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                          margin: const EdgeInsets.all(3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 30,
                          child: GlobalContainer(
                              height: 115,
                              borderWidth: 1.1,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              child: const ShimmerItem()));
                    }),
                error: (err, stack) => Text('Error: $err'),
              ),

              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class GuruMessageCard extends ConsumerWidget {
  const GuruMessageCard({
    super.key,
    required this.listOfMeetings,
  });

  final MeetingModel listOfMeetings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateField = ref.watch(meetingStateNotifierProvider.notifier);
    return CustomContainer(
      minHeight: 100,
      minWidth: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      imageUrl: listOfMeetings.senderPic.toString(),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: listOfMeetings.senderPic.toString(),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: CachedNetworkImage(
                    // height: 110,
                    // width: 110,
                    imageUrl: '',
                    imageBuilder: (context, imageProvider) => Container(
                      height: 110,
                      width: 110,
                      alignment: FractionalOffset.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.green,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fitWidth),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            // const CircleAvatar(
            //   m4axRadius: 39,
            // ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: listOfMeetings.senderName ?? '',
                    textStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  listOfMeetings.isDecline == true
                      ? ReusableText(
                          text:
                              'you have declined the meeting with ${listOfMeetings.senderName}',
                          textStyle: appStyle(
                            fw: FontWeight.w300,
                            fontSize: 9,
                            color: Colors.black,
                          ))
                      : RichText(
                          text: TextSpan(
                            text: listOfMeetings.isAudio == true
                                ? 'Audio call '
                                : "Video call ",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w300,
                              fontSize: 9,
                              color: HexColor('#2067FD'),
                            ),
                            children: [
                              TextSpan(
                                text: 'on ',
                                style: GoogleFonts.inter(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: formatDate(''),
                                    style: GoogleFonts.inter(
                                      color: HexColor('#2067FD'),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ', from ',
                                        style: GoogleFonts.inter(
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '',
                                            style: GoogleFonts.inter(
                                              color: HexColor('#2067FD'),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: ' to ',
                                                style: GoogleFonts.inter(
                                                  color: Colors.black,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: getNextTime(''),
                                                    style: GoogleFonts.inter(
                                                      color: HexColor(
                                                        '#2067FD',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              updateField.updateMeetingAccept(
                                  listOfMeetings.receiverId!, false);
                            },
                            child: GlobalContainer(
                              height: 25,
                              width: 92,
                              color: HexColor('#FF0000'),
                              borderWidth: 0.0,
                              borderRadius: BorderRadius.circular(14),
                              child: ReusableText(
                                text: 'Decline',
                                textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          InkWell(
                            onTap: () {
                              updateField.updateMeetingAccept(
                                  listOfMeetings.receiverId!, true);
                            },
                            child: GlobalContainer(
                              height: 25,
                              width: 92,
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xFF39B200),
                              borderWidth: 0.0,
                              child: ReusableText(
                                text: 'Accept',
                                textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //  ReusableText(
                    // text:
                    // 'you have accepted meetings, payment is in pending',
                    // textStyle: appStyle(
                    //   fw: FontWeight.w300,
                    //   fontSize: 9,
                    //   color: Colors.black,
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String imageUrl;
  const SecondPage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile Screen"),
          centerTitle: true,
        ),
        body: Hero(
          tag: imageUrl,
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(imageUrl),
            )),
          ),
        ));
  }
}
