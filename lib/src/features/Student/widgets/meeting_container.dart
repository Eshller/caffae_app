import 'package:caffae_app/src/Global/Export/export.dart';

class MeetingContainer extends StatelessWidget {
  final MeetingModel meetingModel;
  const MeetingContainer({
    super.key,
    required this.context,
    required this.meetingModel,
  });

  final BuildContext context;

  // String formatDate(String date) {
  //   // Parse the input date string to a DateTime object
  //   var dateTime = DateFormat('MM/dd/yyyy').parse(date);

  //   // Format the date as "Sun, 30 July 2023"
  //   return DateFormat('E, d MMMM y').format(dateTime);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 316),
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
        borderRadius: globalBorderRadius,
        color: kBackGroundColors,
      ),
      // borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: formatDate(meetingModel.date.toString()),
              textStyle: appStyle(
                fw: FontWeight.w500,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: '${meetingModel.time.toString()} - '
                      '${getNextTime(meetingModel.time.toString())}',
                  textStyle: appStyle(
                    fw: customFont300Weight,
                    fontSize: 10,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      color: whiteColor,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 7),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    maxRadius: 19,
                                    foregroundImage: NetworkImage(
                                        meetingModel.receiverPic.toString())),
                                const SizedBox(
                                  width: 6,
                                ),
                                Flexible(
                                  child: ReusableText(
                                    text: meetingModel.isAudio == true
                                        ? 'Audio call with ${meetingModel.receiverName}'
                                        : 'Audio call with ${meetingModel.receiverName}',
                                    textStyle: appStyle(
                                        fw: customFont500Weight,
                                        fontSize: 13,
                                        color: kBackGroundColors),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
