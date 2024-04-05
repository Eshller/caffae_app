import 'package:caffae_app/src/Global/Export/export.dart';

class HomeNameRich extends StatelessWidget {
  final String title1;
  final String title2;
  const HomeNameRich({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return RichText(
      text: TextSpan(
        text: title1,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.054,
            color: blackColor),
        children: [
          TextSpan(
            text: title2,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.054,
              color: HexColor('#2261FD'),
            ),
          )
        ],
      ),
    );
  }
}
