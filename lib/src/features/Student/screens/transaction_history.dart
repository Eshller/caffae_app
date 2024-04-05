// ignore_for_file: depend_on_referenced_packages

import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#D9D9D9'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 9),
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
                          SvgPicture.asset(
                              'assets/svg/game-icons_two-coins.svg'),
                          ReusableText(
                            text: '10',
                            textStyle: appStyle(
                              fw: FontWeight.w500,
                              fontSize: screenWidth * 0.049,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 19, vertical: 15),
                            child: ReusableText(
                              text: 'Transaction history',
                              textStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: screenWidth * 0.052,
                                color: const Color(0xFF283246),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 19, bottom: 9),
                            child: Row(children: [
                              ReusableText(
                                text: 'Sort',
                                textStyle: appStyle(
                                    fw: FontWeight.w400,
                                    fontSize: screenWidth * 0.052,
                                    color: const Color(0xFF283246)),
                              ),
                              const Icon(Icons.sort, color: Color(0xFF283246)),
                            ]),
                          ),
                          SingleChildScrollView(
                            child: ListView.builder(
                                itemCount: 23,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const CircleAvatar(
                                      maxRadius: 25,
                                    ),
                                    subtitle: ReusableText(
                                      text: '30 June 2023 at 12:40 PM',
                                      textStyle: appStyle(
                                        fw: FontWeight.w400,
                                        fontSize: screenWidth * 0.035,
                                        color: const Color(0xFF9C9898),
                                      ),
                                    ),
                                    trailing: ReusableText(
                                      text: '-Rs. 100',
                                      textStyle: appStyle(
                                        fw: FontWeight.w400,
                                        fontSize: screenWidth * 0.046,
                                        color: const Color(0xFF283246),
                                      ),
                                    ),
                                    title: ReusableText(
                                      text: 'Peter Buka',
                                      textStyle: appStyle(
                                        fw: FontWeight.w400,
                                        fontSize: screenWidth * 0.048,
                                        color: const Color(0xFF283246),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
