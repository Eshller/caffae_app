import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonProfileHeader extends StatelessWidget {
  const CommonProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 45.h,
            width: 45.v,
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
