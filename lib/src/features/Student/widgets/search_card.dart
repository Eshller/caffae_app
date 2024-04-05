import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/widgets/rating.dart';
import 'package:caffae_app/src/features/Student/widgets/rich_text.dart';

class SearchCard extends StatelessWidget {
  final GuruModel userData;
  const SearchCard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 7),
      elevation: 30,
      child: GlobalContainer(
        height: 115,
        borderWidth: 1.1,
        width: MediaQuery.of(context).size.width,
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 85,
                    width: 84,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        onError: (s, t) {
                          const Icon(Icons.error);
                        },
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          userData.imageUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: RichTextWidget(
                                    title1: 'Name: ',
                                    title2: userData.username!.length > 9
                                        ? "${userData.username.toString().substring(0, 9)}..."
                                        : userData.username.toString()),
                              ),
                              const RatingButton(
                                rating: 4,
                                ignoreGestures: false,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          RichTextWidget(
                            title1: 'experience: ',
                            title2:
                                '${userData.yearOfExprience.toString()}+ exp',
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RichTextWidget(
                            title1: "About: ",
                            title2: userData.about.toString(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => GuruProfileScreen(
                              //       guruModel: userData,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 22,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: [
                                      HexColor('#2166FD'),
                                      HexColor('#0FC0FA'),
                                    ],
                                  ),
                                ),
                                child: ReusableText(
                                  text: 'View profile',
                                  textStyle: appStyle(
                                    fw: FontWeight.bold,
                                    fontSize: 10,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
