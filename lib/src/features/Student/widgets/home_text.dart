import 'package:caffae_app/src/Global/Export/export.dart';

class HomeText extends StatelessWidget {
  final String text;
  const HomeText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ReusableText(
      text: text,
      textStyle: appStyle(
        fw: FontWeight.w500,
        fontSize: screenWidth * 0.04,
        color: customBlueColor,
      ),
    );
  }
}
