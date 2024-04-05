import 'package:caffae_app/src/Global/Export/export.dart';

class MeetingWidget extends StatelessWidget {
  const MeetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 265),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kBackGroundColors,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReusableText(
            align: TextAlign.center,
            text:
                'Looks like you have no meetings scheduled Discover Your Guru and get your doubts resolver',
            textStyle: GoogleFonts.poppins(
              fontWeight: boldFontWeight,
              fontSize: 11,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

// class HomeMeetingShimmer extends StatelessWidget {
//   const HomeMeetingShimmer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//         // baseColor: Colors.grey.shade400,
//         // highlightColor: Colors.grey.shade200,
//         highlightColor: shimmerHighlightColor,
//         baseColor: shimmerBaseColor,
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: GlobalContainer(
//             height: 115,
//             borderWidth: 1.1,
//             width: MediaQuery.of(context).size.width,
//             color: customGreyColor,
//             borderRadius: BorderRadius.circular(18),
//             child: const Text(''),
//           ),
//         ));
//   }
// }
