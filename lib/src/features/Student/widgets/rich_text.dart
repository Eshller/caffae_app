import 'package:caffae_app/src/Global/Export/export.dart';

class RichTextWidget extends StatelessWidget {
  final String title1;
  final String title2;
  const RichTextWidget({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title1,
        style: theme.textTheme.labelSmall,
        // style: appStyle(
        //   fw: customFont500Weight,
        //   fontSize: 11.6,
        //   color: blackColor,
        // ),
        children: [
          TextSpan(
            text: title2,
            style: theme.textTheme.bodySmall,
            // style: appStyle(
            //   fw: FontWeight.w400,
            //   fontSize: 10,
            //   color: blackColor,
            // ),
          )
        ],
      ),
    );
  }
}
