import 'dart:io';

import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Auth/screens/add_information_guru.dart';
import 'package:caffae_app/src/features/Student/widgets/common_student_id_card.dart';

class StudentProfilePage extends ConsumerStatefulWidget {
  final String userID;
  static const String routeName = 'profile-screen';
  const StudentProfilePage({super.key, required this.userID});

  @override
  ConsumerState<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends ConsumerState<StudentProfilePage> {
  bool isYesChecked = false;
  bool isNoChecked = false;
  bool isLoading = false;
  File? imageFile;
  File? documentId;
  // getCurrentUser() async {
  //   userModel =
  //       await ref.watch(profile).getCurrentUser(userId: '', context: context);
  // }

  // UserModel? userModel;

  final TextEditingController searchController = TextEditingController();
  // @override
  // void initState() {
  //   getCurrentUser();
  //   super.initState();
  // }

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userProvider).user;
    String displayName = currentUser.name.toString();
    if (displayName.length > 9) {
      displayName = "${displayName.substring(0, 10)}...";
    }
    final screenWidth = MediaQuery.of(context).size.width;
    // print(currentUser.username);/
    // final userData = ref.watch(userDataAuthProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 6, left: 6, bottom: 60),
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            const CommonProfileHeader(),
            const SizedBox(
              height: 7,
            ),
            CommonCard(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageFile == null
                      ? CommonCameraWidget(
                          imageUrl: currentUser.photoUrl ?? image,
                          cameraCallback: () async {
                            // _imgFromGallery();
                          },
                        )
                      : Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      imageUrl: imageFile.toString(),
                                    ),
                                  ),
                                );
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
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonNameProfileWidget(
                        displayName: displayName,
                        nameController: nameController,
                        onTapCancel: () {
                          setState(() {
                            nameController.text = '';
                            Navigator.of(context).pop();
                          });
                        },
                        onTapOk: () async {
                          final result = await ref.read(profile).updateUserName(
                                userId: currentUser.id,
                                name: nameController.text.trim(),
                              );
                          if (result) {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          } else {
                            BotToast.showText(text: 'Something went wrong');
                          }
                        },
                      ),
                      const SizedBox(height: 4),
                      ReusableText(
                        text: currentUser.phoneNumber ?? '91',
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: const Color(0xFF283246),
                        ),
                      ),
                      const SizedBox(height: 12),
                      BecomeGuruButton(navigatorOnTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddInformationGuru(
                              userData: currentUser,
                            ),
                          ),
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                constraints: const BoxConstraints(minHeight: 210),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 14, left: 14, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Why you should become a guru at Caffae ?',
                        textStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.04,
                            // color: const Color(0xFF2067FD),
                            color: blackColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReusableText(
                        text:
                            'Problems we are solving for a guru:-1) Monetize your experience and time.convenience at your fingertips as you will get a option to toggle between online and offline to take calls at your convenience at your time by deciding your own per minute rate that helps you to make your own brand.2) Expand your network in 360°.When you are a guru on caffaeIn the field you are a guru in you can network with all the people in the field for free. Making networking easier for everyone and free of cost. 3) You get a convenient platform to give back to society.',
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth * 0.03,
                          color: blackColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                // color: Colors.green,

                                // color: Colors.green,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/gright.png'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                // color: Colors.green,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/gleft.png'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 50,
                            decoration: const BoxDecoration(
                              // color: Colors.green,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/pass.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            currentUser.documentId!.isNotEmpty
                ? CommonCard(
                    height: 60,
                    child: ReusableText(
                      text: 'You have already uploaded your document id',
                      textStyle: appStyle(
                        fw: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                        color: Colors.black,
                      ),
                    ),
                  )
                : CommonCard(
                    height: 150,
                    child: CommonStudentDocumentCard(
                      uploadDocumentId: () {
                        // final picker = ImagePicker();
                        // imgFromGallery() async {
                        //   await picker
                        //       .pickImage(
                        //           source: ImageSource.gallery, imageQuality: 50)
                        //       .then((value) {
                        //     if (value != null) {
                        //       ropImage(File imgFile) async {
                        //         final croppedFile =
                        //             await ImageCropper().cropImage(
                        //                 sourcePath: imgFile.path,
                        //                 aspectRatioPresets: Platform.isAndroid
                        //                     ? [
                        //                         CropAspectRatioPreset.square,
                        //                         CropAspectRatioPreset.ratio3x2,
                        //                         CropAspectRatioPreset.original,
                        //                         CropAspectRatioPreset.ratio4x3,
                        //                         CropAspectRatioPreset.ratio16x9
                        //                       ]
                        //                     : [
                        //                         CropAspectRatioPreset.original,
                        //                         CropAspectRatioPreset.square,
                        //                         CropAspectRatioPreset.ratio3x2,
                        //                         CropAspectRatioPreset.ratio4x3,
                        //                         CropAspectRatioPreset.ratio5x3,
                        //                         CropAspectRatioPreset.ratio5x4,
                        //                         CropAspectRatioPreset.ratio7x5,
                        //                         CropAspectRatioPreset.ratio16x9
                        //                       ],
                        //                 uiSettings: [
                        //               AndroidUiSettings(
                        //                   toolbarTitle: "Image Cropper",
                        //                   toolbarColor: Colors.deepOrange,
                        //                   toolbarWidgetColor: Colors.white,
                        //                   initAspectRatio:
                        //                       CropAspectRatioPreset.original,
                        //                   lockAspectRatio: false),
                        //               IOSUiSettings(
                        //                 title: "Image Cropper",
                        //               )
                        //             ]);
                        //         if (croppedFile != null) {
                        //           imageCache.clear();
                        //           setState(() {
                        //             imageFile = File(croppedFile.path);
                        //           });
                        //           // reload();
                        //         }
                        //       }
                        //     }
                        //   });
                        // }
                      },
                      isYesChecked: isYesChecked,
                      isNoChecked: isNoChecked,
                      noOnCheckedCall: (value) {
                        setState(() {
                          isNoChecked = value!;
                          if (isNoChecked) {
                            isYesChecked = false;
                          }
                        });
                      },
                      yesOnCheckedCall: (value) {
                        setState(() {
                          isYesChecked = value!;
                          if (isYesChecked) {
                            isNoChecked = false;
                          }
                        });
                      },
                    ),
                  ),
            const SizedBox(height: 4),
            const CommonCard(
              height: 135,
              child: CommonProfileWalletCard(),
            ),
            const SizedBox(height: 4),
            const CommonCard(
              height: 265,
              child: CommonDiscountCard(),
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
