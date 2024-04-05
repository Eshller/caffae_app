import 'package:caffae_app/src/Global/Export/export.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
        left: 12,
      ),
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
                    fw: customFont500Weight,
                    fontSize: 15,
                    color: whiteColor,
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

// figma design in the aspect of the homepage and make the google platy services of