import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/Utils/image_picker.dart';
import 'package:caffae_app/src/features/Auth/screens/personalization_screen.dart';
import 'package:file_picker/file_picker.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  final AuthUser? currentUser;
  static const String routeName = '/user-information';
  const UserInformationScreen(
      {super.key, Key? keyc, required this.currentUser});

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  FilePickerResult? image;
  bool isLoading = false;
  AuthUser? authUser;

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
  }

  Future<bool> createUserModel({required UserModel userModel}) async {
    try {
      final request = ModelMutations.create(userModel);
      final response = await Amplify.API.mutate(request: request).response;

      final createdUserModel = response.data;
      if (createdUserModel == null) {
        safePrint('errors: ${response.errors}');
        return false;
      }
      safePrint('Mutation result: ${createdUserModel.id}');
      return true;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      return false;
    }
  }

  String? phoneNumber;
  String? email;
  void fetchUserInformation() async {
    try {
      List<AuthUserAttribute> attributes =
          await Amplify.Auth.fetchUserAttributes();

      for (var attribute in attributes) {
        if (attribute.userAttributeKey == AuthUserAttributeKey.phoneNumber) {
          phoneNumber = attribute.value;
        } else if (attribute.userAttributeKey == AuthUserAttributeKey.email) {
          email = attribute.value;
        }
      }

      safePrint('Phone: $phoneNumber');
      safePrint('Email: $email');
    } catch (e) {
      safePrint(e.toString());
    }
  }

  Future<void> currentUser() async {
    try {
      AuthUser currenUser = await Amplify.Auth.getCurrentUser();
      debugPrint(currenUser.userId);
      setState(() {
        authUser = currenUser;
      });
    } catch (e) {
      debugPrint("Error getting current user: $e");
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserInformation();
    getFirebaseMessagingToken();
    currentUser();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  late String _pushtoken;
  // for accessing firebase messaging (Push Notification)
  FirebaseMessaging fMessaging = FirebaseMessaging.instance;
  Future<void> getFirebaseMessagingToken() async {
    await fMessaging.getToken().then((t) {
      if (t != null) {
        // setState(() {
        _pushtoken = t; // Set the token using the setter
        // });
      }
    });
  }

  void addUserDataToAws() async {
    // final firebaseToken = ref.read(firebaseMessagingTokenProvider);
    // final token = firebaseToken.asData?.value ?? '';
    // safePrint(token);

    if (nameController.text.isEmpty) {
      BotToast.showText(text: 'Please Enter your name');
      return;
    }
    FocusScope.of(context).unfocus();
    BotToast.showLoading();

    if (image != null) {
      ref
          .watch(profile)
          .uploadFile(result: image!, context: context)
          .then((value) {
        if (value == '') {
          BotToast.showText(
              text: 'Unable to upload profile picture. please try again later');
          BotToast.closeAllLoading();
          return;
        }

        UserModel authModel = UserModel(
          name: nameController.text.trim(),
          username: widget.currentUser?.username ?? '',
          phoneNumber: phoneNumber,
          id: widget.currentUser!.userId,
          isVerified: true,
          photoUrl: value,
          isGuru: false,
          pushToken: _pushtoken,
          role: '',
          documentId: '',
          listExplore: [],
          email: email,
        );

        createUserModel(userModel: authModel).then((value) async {
          if (value) {
            BotToast.showText(text: value.toString());
            BotToast.closeAllLoading();
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PersonalizationScreen(
                    authUserId: widget.currentUser!.userId,
                  ),
                ),
              );
            }
          } else {
            BotToast.showText(text: 'Unable to upload your data');
          }
        }).catchError((error) {
          safePrint('an error occurred${error.message}');
        });
      });
    } else {
      UserModel authModel = UserModel(
        name: nameController.text.trim(),
        username: widget.currentUser?.username ?? '',
        phoneNumber: phoneNumber,
        id: widget.currentUser!.userId,
        isVerified: true,
        photoUrl: '',
        isGuru: false,
        pushToken: _pushtoken,
        role: '',
        documentId: '',
        listExplore: [],
        email: email,
      );

      createUserModel(userModel: authModel).then((value) async {
        if (value) {
          BotToast.closeAllLoading();
          BotToast.showText(text: value.toString());
          if (context.mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PersonalizationScreen(
                  authUserId: widget.currentUser!.userId,
                ),
              ),
            );
          }
        } else {
          BotToast.showText(text: 'Unable to upload your information');
        }
      }).catchError((error) {
        safePrint('an error occurred${error.message}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    //final loading = ref.watch(authChangeNotifierProvider.notifier).isLoading;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackGroundColors,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                  height: 96, child: Image.asset('assets/images/logo.png')),
              const Text(
                'Add your information',
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor),
              ),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: kBackGroundColors,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    image == null
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-3VQz6KM-1laTLb_oCNKBdJNt609eeeDSA7d3VZo&s',
                            ),
                            radius: 64,
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: FileImage(
                              File(
                                image!.files.single.path!,
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 39),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ReusableText(
                      text: 'Enter your name',
                      textStyle: appStyle(
                        fw: FontWeight.w500,
                        fontSize: screenWidth * 0.044,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.85,
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: whiteColor),
                    decoration: inputDecoration(),
                    controller: nameController,
                    maxLines: 1,
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: addUserDataToAws,
                  child: GlobalContainer(
                    height: 50,
                    borderWidth: 1.1,
                    width: MediaQuery.of(context).size.width / 1.5,
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    child: ReusableText(
                      text: 'Save your information',
                      textStyle: appStyle(
                        fw: FontWeight.w500,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      fillColor: kBackGroundColors,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: whiteColor, width: 0.8),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 219, 35, 35), width: 1.1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 65, 56, 56), width: 1.1),
        borderRadius: BorderRadius.circular(7.0),
      ),
      focusColor: const Color.fromARGB(255, 221, 197, 197),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 0.1),
        borderRadius: BorderRadius.circular(7.0),
      ),
    );
  }
}
