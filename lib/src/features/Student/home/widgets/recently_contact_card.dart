// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

class RecentlyContactCard extends StatelessWidget {
  final GuruModel userData;
  const RecentlyContactCard({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // print("USERNAME ${userData.specialist}");
    return Card(
      elevation: 2,
      // borderOnForeground: true,
      shadowColor: whiteColor,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: globalBorderRadius,
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        // height: 197,
        decoration: BoxDecoration(
          color: kBackGroundColors,
          // color: Colors.green,
          borderRadius: globalBorderRadius,
        ),
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 83,
              width: 83,
              child: CachedNetworkImage(
                imageUrl: userData.imageUrl ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.green,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fitWidth),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            HomeContactTextWidget(
              fontSize: screenWidth * 0.036,
              text: userData.name != null && userData.name!.length > 9
                  ? "${userData.username?.substring(0, 10) ?? ''}..."
                  : userData.name ?? '',
            ),

            // ReusableText(
            //   align: TextAlign.center,
            //   text: userData.username!.length > 9
            //       ? "${userData.username.toString().substring(0, 10)}..."
            //       : userData.username.toString(),
            //   textStyle: GoogleFonts.poppins(
            //     fontWeight: FontWeight.w500,
            //     fontSize: 11,
            //     color: Colors.white,
            //   ),
            // ),
            const SizedBox(
              height: 2,
            ),
            HomeContactTextWidget(
              text: userData.specialist.toString(),
              fontSize: screenWidth * 0.03,
            ),

            const SizedBox(
              height: 2,
            ),
            HomeContactTextWidget(
              fontSize: screenWidth * 0.026,
              text: '22 apr 2023',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContactTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  const HomeContactTextWidget(
      {super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ReusableText(
      text: text,
      align: TextAlign.center,
      textStyle: GoogleFonts.poppins(
        fontWeight: customFont500Weight,
        fontSize: fontSize,
        color: whiteColor,
      ),
    );
  }
}
