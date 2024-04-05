import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:shimmer/shimmer.dart';

class FlutterShimmerBackground extends StatelessWidget {
  const FlutterShimmerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: 'Hey!',
            textStyle: appStyle(
              fw: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          ReusableText(
            text: 'Jack!',
            textStyle: appStyle(
              fw: FontWeight.bold,
              fontSize: 25,
              color: Colors.teal,
            ),
          ),
          ReusableText(
            text: 'Schedule!',
            textStyle: appStyle(
              fw: FontWeight.bold,
              fontSize: 18,
              color: const Color.fromARGB(255, 178, 188, 187),
            ),
          ),
          GlobalContainer(
            height: 268,
            borderWidth: 1.1,
            width: MediaQuery.of(context).size.width,
            color: kBackGroundColors,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          HexColor('#2165FD'),
                          HexColor('#0FC1FA')
                        ])),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CircleAvatar(
                              maxRadius: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  text: 'Voice call with Shawn @12 PM',
                                  textStyle: appStyle(
                                    fw: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                ReusableText(
                                  text: '12:00 - 13:00',
                                  textStyle: appStyle(
                                    fw: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ReusableText(
                    text: '-----------------------------',
                    textStyle: appStyle(
                      fw: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ReusableText(
            text: 'Recently Contacted',
            textStyle: appStyle(
              fw: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 149,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  borderOnForeground: false,
                  margin: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Container(
                    // height: 145,

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 204, 196, 196),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          maxRadius: 37,
                          foregroundColor: Colors.green,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReusableText(
                          text: 'Ruma sharma',
                          textStyle: appStyle(
                            fw: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        ReusableText(
                          text: 'Web developer',
                          textStyle: appStyle(
                            fw: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        ReusableText(
                          text: 'May 23,2023',
                          textStyle: appStyle(
                            fw: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ReusableText(
            text: 'Recommended For You',
            textStyle: appStyle(
              fw: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 149,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  borderOnForeground: false,
                  margin: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    //set border radius more than 50% of height and width to make circle
                  ),
                  child: Container(
                    // height: 145,

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 204, 196, 196),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          maxRadius: 37,
                          foregroundColor: Colors.green,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReusableText(
                          text: 'Ruma sharma',
                          textStyle: appStyle(
                            fw: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        ReusableText(
                          text: 'Web developer',
                          textStyle: appStyle(
                            fw: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        ReusableText(
                          text: 'May 23,2023',
                          textStyle: appStyle(
                            fw: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class HomeMeetingShimmer extends StatelessWidget {
  const HomeMeetingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Shimmer.fromColors(
            // baseColor: Colors.grey.shade200,
            baseColor: Colors.grey.shade400,
            highlightColor: const Color.fromARGB(255, 31, 21, 21),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        3,
                        (index) {
                          return Row(
                            children: [
                              Container(
                                width: 75,
                                height: 10,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  height: 53,
                                  // width: MediaQuery.of(context).size.width,
                                  // color: whiteColor,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 0.7, color: Colors.blue)),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 48,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 148,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            height: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}

class HorizontalRecommendedShimmer extends StatelessWidget {
  const HorizontalRecommendedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
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
          width: 100,
          height: 147,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff283246)),
          child: Shimmer.fromColors(
            // baseColor: Colors.grey.shade200,
            baseColor: Colors.grey.shade400,
            highlightColor: const Color.fromARGB(255, 31, 21, 21),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  width: 60,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Container(
                  width: 55,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 10,
                ),
                const SizedBox(
                  height: 7.0,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 10,
                ),
              ]),
            ),
          ),
        ));
  }
}
