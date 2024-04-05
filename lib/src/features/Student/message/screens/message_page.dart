import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Guru/search/widgets/shimmer_item.dart';
import 'package:caffae_app/src/features/Student/meetings/controller/meeting_controller.dart';

class ContactPage extends ConsumerWidget {
  static const String routeName = "contact-page";
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider).user;

    final AsyncValue<List<MeetingModel>> meetings =
        ref.watch(meetingListControllerProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 6, right: 6, bottom: 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CommonProfileHeader(),
            const SizedBox(
              height: 7,
            ),
            meetings.when(
              data: (meetings) {
                final filtered = meetings.where((meeting) {
                  return meeting.senderId == currentUser.id &&
                      meeting.isDonePayment == false;
                }).toList();
                if (filtered.isNotEmpty) {
                  return ListView.builder(
                      itemCount: filtered.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final filterList = filtered[index];
                        return MessageCard(listOfMeetings: filterList);
                      });
                }
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReusableText(
                          text: "You don't have any meetings",
                          textStyle: appStyle(
                            fw: FontWeight.w500,
                            fontSize: screenWidth * 0.05,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
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
            )
          ],
        ),
      ),
    );

    // switch (meetings) {
    //   case AsyncData(:final value):
    //     return value.isEmpty
    //         ? const Center(
    //             child: Text('No Meetings'),
    //           )
    //         : Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: ListView(
    //               children: value.map((listOfMeetings) {
    //                 return MessageCard(listOfMeetings: listOfMeetings);
    //               }).toList(),
    //             ));

    //   case AsyncError():
    //     return const Center(
    //       child: Text('Error'),
    //     );
    //   case AsyncLoading():
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );

    //   case _:
    //     return const Center(
    //       child: Text('Error'),
    //     );
    // }
  }
}

class MessageCard extends ConsumerWidget {
  final MeetingModel listOfMeetings;
  const MessageCard({super.key, required this.listOfMeetings});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final update = ref.watch(meetingListControllerProvider.notifier);
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomContainer(
      minHeight: 100,
      minWidth: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: CachedNetworkImage(
                // height: 110,
                // width: 110,
                imageUrl: listOfMeetings.receiverPic!.isEmpty
                    ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-3VQz6KM-1laTLb_oCNKBdJNt609eeeDSA7d3VZo&s'
                    : listOfMeetings.receiverPic.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  height: 110,
                  width: 110,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: ReusableText(
                        text: '1 hr ago',
                        textStyle: appStyle(
                          fw: FontWeight.w500,
                          fontSize: screenWidth * 0.03,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: listOfMeetings.isDecline == false &&
                                  listOfMeetings.isAccept == false
                              ? Colors.green
                              : listOfMeetings.isDecline == true &&
                                      listOfMeetings.isAccept == false
                                  ? Colors.red
                                  : Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      listOfMeetings.isDecline == false &&
                              listOfMeetings.isAccept == false
                          ? MeetingHeaderName(
                              text:
                                  'Your meeting is in pending with ${listOfMeetings.receiverName}',
                            )
                          : listOfMeetings.isDecline == true &&
                                  listOfMeetings.isAccept == false
                              ? MeetingHeaderName(
                                  text:
                                      '${listOfMeetings.receiverName} has Declined your request')
                              : MeetingHeaderName(
                                  text:
                                      '${listOfMeetings.receiverName} has accepted your request'),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  listOfMeetings.isDecline == true &&
                          listOfMeetings.isAccept == false
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          child: ReusableText(
                            text: 'He could not accept because ....',
                            textStyle: appStyle(
                                fw: customFont300Weight,
                                fontSize: screenWidth * 0.027,
                                color: blackColor),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: RichText(
                            text: TextSpan(
                              text: "Your ",
                              style: GoogleFonts.inter(
                                fontSize: screenWidth * 0.027,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: listOfMeetings.isAudio == true
                                      ? 'audio call'
                                      : "video call",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#2067FD'),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' with ',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        // fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              ' ${listOfMeetings.receiverName} ',
                                          style: GoogleFonts.inter(
                                            // fontSize: 16.sp,
                                            color: HexColor('#2067FD'),
                                          ),
                                          children: [
                                            TextSpan(
                                              text: listOfMeetings.isDecline ==
                                                          false &&
                                                      listOfMeetings.isAccept ==
                                                          false
                                                  ? ' is in pending  for '
                                                  : ' has been scheduled for ',
                                              style: GoogleFonts.inter(
                                                // fontSize: 16.sp,
                                                color: Colors.black,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: formatDate(
                                                      listOfMeetings.date
                                                          .toString()),
                                                  style: GoogleFonts.inter(
                                                    // fontSize: 16.sp,
                                                    color: HexColor('#2067FD'),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: ' from  ',
                                                      style: GoogleFonts.inter(
                                                          // fontSize: 16.sp,
                                                          color: Colors.black),
                                                      children: [
                                                        TextSpan(
                                                          style:
                                                              GoogleFonts.inter(
                                                            color: HexColor(
                                                                '#2067FD'),
                                                          ),
                                                          text:
                                                              '${listOfMeetings.time.toString()} ',
                                                          children: [
                                                            TextSpan(
                                                              text: 'to ',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                  style:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    color:
                                                                        HexColor(
                                                                      '#2067FD',
                                                                    ),
                                                                  ),
                                                                  text:
                                                                      getNextTime(
                                                                    listOfMeetings
                                                                        .time
                                                                        .toString(),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
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
                        ),
                  const SizedBox(
                    height: 8,
                  ),
                  listOfMeetings.isAccept == false
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(right: 9, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                InkWell(
                                  onTap: () {
                                    update.updatePayement(listOfMeetings
                                        .copyWith(isDonePayment: true));
                                  },
                                  child: GlobalContainer(
                                    height: 25,
                                    width: 120,
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xFF283246),
                                    borderWidth: 0.0,
                                    child: ReusableText(
                                      text: 'Make Payment',
                                      textStyle: appStyle(
                                        fw: FontWeight.w500,
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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

class MeetingHeaderName extends StatelessWidget {
  const MeetingHeaderName({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Flexible(
      child: ReusableText(
        text: text,
        textStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.038,
          color: Colors.black,
        ),
      ),
    );
  }
}
