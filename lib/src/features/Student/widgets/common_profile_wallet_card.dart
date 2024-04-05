import 'package:caffae_app/src/Global/Export/export.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CommonProfileWalletCard extends StatelessWidget {
  const CommonProfileWalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: 'Caffae Wallet',
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: const Color(0xFF283246),
            ),
          ),
          const SizedBox(height: 5),
          ReusableText(
            text: 'Available Coins ',
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: const Color(0xFF283246),
            ),
          ),
          const Divider(
            thickness: 0.8,
            color: Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/coins.svg',
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  ReusableText(
                    text: '10 coins',
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color(0xFF2067FD),
                    ),
                  ),
                ],
              ),
              GlobalContainer(
                height: 33,
                width: 150,
                borderWidth: 1.1,
                color: kBackGroundColors,
                borderRadius: BorderRadius.circular(10),
                child: ReusableText(
                  text: 'Add Coins',
                  textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
