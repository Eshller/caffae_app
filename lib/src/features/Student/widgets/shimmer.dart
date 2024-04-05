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
