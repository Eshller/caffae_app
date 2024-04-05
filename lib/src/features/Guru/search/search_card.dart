import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/widgets/custom_rating_bar.dart';
import 'package:caffae_app/src/features/Guru/Screens/guru_profile.dart';
import 'package:caffae_app/src/features/Student/widgets/rich_text.dart';

class SearchCardGuru extends StatelessWidget {
  final GuruModel userData;
  const SearchCardGuru({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      margin: const EdgeInsets.all(3),
      elevation: 30,
      child: GlobalContainer(
        height: 115.h,
        borderWidth: 1.1,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
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
                    height: 94.v,
                    width: 86.h,
                    margin: EdgeInsets.only(
                      top: 2.v,
                      bottom: 3.v,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 239, 234, 234),
                      borderRadius: BorderRadius.circular(
                        20.h,
                      ),
                      image: DecorationImage(
                        onError: (s, t) {
                          const Text(
                            'Error to load the image',
                          );
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
                                    title2: userData.username!.length > 11
                                        ? "${userData.username.toString().substring(0, 12)}..."
                                        : userData.username.toString()),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: CustomRatingBar(
                                  ignoreGestures: true,
                                  initialRating: 5,
                                ),
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
                          SizedBox(height: 8.v),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GuruProfileScreen(
                                    guruModel: userData,
                                  ),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 18.v,
                                width: 76.h,
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
                                    fontSize: 10.v,
                                    color: Colors.white,
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
