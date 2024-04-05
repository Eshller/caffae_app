import 'package:caffae_app/src/Global/Export/export.dart';

class CommonDiscountCard extends StatelessWidget {
  const CommonDiscountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
              text: 'Power Passes',
              textStyle: appStyle(
                fw: FontWeight.w400,
                fontSize: screenWidth * 0.04,
                color: const Color(0xFF283246),
              ),
            ),
          ),
          const Divider(
            thickness: 0.8,
            color: Colors.black,
          ),
          SizedBox(
            height: 194,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: GlobalContainer(
                  height: 180,
                  width: 227,
                  borderWidth: 1.1,
                  borderRadius: BorderRadius.circular(10),
                  color: kBackGroundColors,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 40,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      // color: Colors.green,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/gright.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 66),
                                  child: Container(
                                    width: 58,
                                    height: 37,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/gleft.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 85,
                                  height: 110,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/pass.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Flexible(
                          flex: 0,
                          child: Container(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5, left: 5, top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  text: 'Get 20% off on 5 calls in a day!',
                                  textStyle: appStyle(
                                    fw: FontWeight.w500,
                                    fontSize: screenWidth * 0.038,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReusableText(
                                      text: 'Valid until: 25/11.2023',
                                      textStyle: appStyle(
                                        fw: FontWeight.w400,
                                        fontSize: screenWidth * 0.031,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 62,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        gradient: LinearGradient(
                                          colors: [
                                            HexColor('#2948FC'),
                                            HexColor('#119CFD')
                                          ],
                                        ),
                                      ),
                                      child: ReusableText(
                                          text: 'Buy Now',
                                          textStyle: appStyle(
                                              fw: FontWeight.w400,
                                              fontSize: screenWidth * 0.029,
                                              color: Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
