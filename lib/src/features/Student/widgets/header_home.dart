// ignore_for_file: depend_on_referenced_packages

import 'package:caffae_app/src/Global/Export/export.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 56,
              decoration: const BoxDecoration(
                // color: kBackGroundColors,
                // shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            ReusableText(
              text: 'Caffae',
              textStyle: appStyle(
                fw: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
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
    );
  }
}
