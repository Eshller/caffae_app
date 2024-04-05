import 'dart:io';

import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';

class GuruProfilePage extends ConsumerStatefulWidget {
  static const String routeName = 'guru_profile_screen';
  const GuruProfilePage({
    super.key,
  });

  @override
  ConsumerState<GuruProfilePage> createState() => _GuruProfilePageState();
}

class _GuruProfilePageState extends ConsumerState<GuruProfilePage> {
  final TextEditingController messageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  File? imageFile;

  bool isYesChecked = false;

  bool isNoChecked = false;

  bool isLoading = false;
// data service that will take a decidons to get the maximum
  @override
  Widget build(
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth * 0.05; // Adjust this multiplier as needed
    final currentUser = ref.watch(userProvider).user;
    String displayName = currentUser.name.toString();
    if (displayName.length > 9) {
      displayName = "${displayName.substring(0, 10)}...";
    }
    return SingleChildScrollView(
      child:
          // print(data.documentId);
          // String displayName = data.username.toString();
          // if (displayName.length > 9) {
          //   displayName = "${displayName.substring(0, 10)}...";
          // }
          Padding(
        padding: const EdgeInsets.only(right: 6, left: 6, bottom: 65),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CommonProfileHeader(),
            const SizedBox(
              height: 7,
            ),
            CustomContainer(
              minHeight: 150,
              minWidth: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            imageFile == null
                                ? CommonCameraWidget(
                                    imageUrl: currentUser.photoUrl ?? image,
                                    cameraCallback: () async {
                                      // _imgFromGallery();
                                    },
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         SecondPage(
                                      //             imageUrl: data.imageUrl
                                      //                 .toString()),
                                      //   ),
                                      // );
                                    },
                                    child: Hero(
                                      tag: currentUser.photoUrl ?? image,
                                      child: CircleAvatar(
                                        maxRadius: 59,
                                        foregroundImage: FileImage(imageFile!),
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 1,
                              right: 2,
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ReusableText(
                                  text: displayName,
                                  textStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: fontSize,
                                      color: const Color(0xFF283246)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: const Icon(Icons.edit),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              7,
                                            ),
                                          ),
                                          title: ReusableText(
                                            text: 'Enter your name',
                                            textStyle: appStyle(
                                              fw: FontWeight.w500,
                                              fontSize: 17,
                                              color: const Color(0xFF283246),
                                            ),
                                          ),
                                          content: TextFormField(
                                            controller: nameController,
                                          ),
                                          actions: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  nameController.text = '';
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: GlobalContainer(
                                                height: 35,
                                                width: 90,
                                                borderWidth: 1.1,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: kBackGroundColors,
                                                child: ReusableText(
                                                  text: 'cancel',
                                                  textStyle: appStyle(
                                                    fw: FontWeight.bold,
                                                    fontSize: fontSize,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {},
                                              child: GlobalContainer(
                                                height: 35,
                                                width: 90,
                                                borderWidth: 1.1,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: kBackGroundColors,
                                                child: ReusableText(
                                                  text: 'Ok',
                                                  textStyle: appStyle(
                                                    fw: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            ReusableText(
                              text: currentUser.phoneNumber ?? '',
                              textStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: const Color(0xFF283246),
                              ),
                            ),
                            const SizedBox(height: 4),
                            GlobalContainer(
                              height: 30,
                              width: 150,
                              borderWidth: 0.0,
                              color: HexColor('#283246'),
                              borderRadius: BorderRadius.circular(10),
                              child: ReusableText(
                                text: 'Edit Profile',
                                textStyle: appStyle(
                                  fw: FontWeight.w500,
                                  fontSize: fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GlobalContainer(
                                height: 30,
                                width: 150,
                                borderWidth: 0.0,
                                color: HexColor('#283246'),
                                borderRadius: BorderRadius.circular(10),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 68,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: HexColor('#283246'),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ReusableText(
                                          text: 'Online',
                                          textStyle: GoogleFonts.inter(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                      GlobalContainer(
                                        height: 30,
                                        width: 68,
                                        borderWidth: 0.0,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                        child: ReusableText(
                                          text: 'Offline',
                                          textStyle: GoogleFonts.inter(
                                              color: Colors.red,
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            CustomContainer(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 140,
              child: const CommonProfileWalletCard(),
            ),
            const SizedBox(height: 4),
            CustomContainer(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: 260,
              child: const CommonDiscountCard(),
            ),
            const SizedBox(height: 4),
            CommonCard(
              height: 75,
              child: CommonProfileFooterCard(ref: ref),
            ),
          ],
        ),
      ),
    );
  }
}
