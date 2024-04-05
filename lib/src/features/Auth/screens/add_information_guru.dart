// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/Utils/image_picker.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/Global/widgets/my_text_field.dart';
import 'package:caffae_app/src/features/Student/profile/services/profile_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class AddInformationGuru extends ConsumerStatefulWidget {
  static const String routeName = 'add-information-guru';
  final UserModel userData;
  const AddInformationGuru({
    super.key,
    required this.userData,
  });

  @override
  ConsumerState<AddInformationGuru> createState() => _AddInformationGuruState();
}

class _AddInformationGuruState extends ConsumerState<AddInformationGuru> {
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController linkedInController = TextEditingController();
  final TextEditingController audioController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController yearOfExperienceController =
      TextEditingController();
  final TextEditingController unAvailableController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String currentItem = "Music";
  String? username;
  FilePickerResult? image;
  String formDate = '';
  TextEditingController nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  // final String _setDate = '';
  DateTime selectedDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        helpText: 'DD/MM/YYYY',
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      final request = ModelQueries.get(
        UserModel.classType,
        UserModelModelIdentifier(id: userId),
      );
      final response = await Amplify.API.query(request: request).response;

      final userData = response.data!;

      return userData;
    } on Exception catch (error) {
      safePrint('getTrip failed: $error');
      rethrow;
    }
  }

  Future<bool> updateUser() async {
    try {
      final userd = await getUser(widget.userData.id);
      final updatedUse = userd.copyWith(isGuru: true);
      final response = await Amplify.API
          .mutate(request: ModelMutations.update(updatedUse))
          .response;
      final updatedUser = response.data;
      if (updatedUser == null) {
        safePrint('errors: ${response.errors}');
        // BotToast.closeAllLoading();
        return false;
      }
      Future.delayed(Duration.zero, () {
        ref.read(userProvider).setUserFromModel(updatedUse);
      });
      safePrint('Mutation result: ${updatedUser.id}');
      // BotToast.closeAllLoading();
      return true;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      // BotToast.closeAllLoading();
      return false;
    }
  }

  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    aboutController.dispose();
    qualificationController.dispose();
    experienceController.dispose();
    linkedInController.dispose();
    yearOfExperienceController.dispose();
    nameController.dispose();
    audioController.dispose();
    videoController.dispose();
    _dateController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  List<String> items = [
    "Music",
    "Art",
    "Theatre",
    "Cooking",
    'UI/UX',
    'AI/ML',
    'Sports',
    'Astronomy',
    'Animation'
  ];

  List availableTime = [];
  @override
  Widget build(BuildContext context) {
    final guru = ref.watch(profile);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: 'Add Required information',
                            textStyle: appStyle(
                              fw: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.9,
                      color: Colors.black,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 20,
                      child: GlobalContainer(
                        height: 139,
                        borderWidth: 1.1,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      image == null
                                          ? Container(
                                              height: 100,
                                              width: 100,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: CachedNetworkImage(
                                                imageUrl: widget
                                                    .userData.photoUrl
                                                    .toString(),
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: 110,
                                                  width: 110,
                                                  alignment:
                                                      FractionalOffset.center,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    // color: Colors.green,
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.fitWidth),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            )
                                          : const CircleAvatar(
                                              maxRadius: 55,
                                              // foregroundImage: FileImage(
                                              //   File(image!),
                                              // ),
                                            ),
                                      Positioned(
                                        bottom: 0,
                                        right: 4,
                                        child: InkWell(
                                          onTap: selectImage,
                                          child: const Icon(
                                            Icons.photo_camera,
                                            color: Colors.black,
                                            size: 29,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 22),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        // color: Colors.green,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        height: 27,
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: ReusableText(
                                                text: nameController
                                                        .text.isNotEmpty
                                                    ? nameController.text.trim()
                                                    : widget.userData.username
                                                        .toString(),
                                                textStyle: appStyle(
                                                  fw: FontWeight.w400,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xFF283246),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7)),
                                                        title: const Text(
                                                          "Enter your name",
                                                        ),
                                                        content: TextFormField(
                                                          controller:
                                                              nameController,
                                                        ),
                                                        actions: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                nameController
                                                                    .text = '';
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            },
                                                            child:
                                                                GlobalContainer(
                                                              height: 35,
                                                              width: 90,
                                                              borderWidth: 1.1,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color:
                                                                  kBackGroundColors,
                                                              child:
                                                                  ReusableText(
                                                                text: 'cancel',
                                                                textStyle:
                                                                    appStyle(
                                                                  fw: FontWeight
                                                                      .bold,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              });
                                                            },
                                                            child:
                                                                GlobalContainer(
                                                              height: 35,
                                                              width: 90,
                                                              borderWidth: 1.1,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color:
                                                                  kBackGroundColors,
                                                              child: ReusableText(
                                                                  text: 'Ok',
                                                                  textStyle: appStyle(
                                                                      fw: FontWeight
                                                                          .bold,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                    Icons.mode_edit_outlined))
                                          ],
                                        ),
                                      ),
                                      ReusableText(
                                        text: widget.userData.phoneNumber
                                            .toString(),
                                        textStyle: appStyle(
                                          fw: FontWeight.w400,
                                          fontSize: 14,
                                          color: const Color(0xFF283246),
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            const GuruTextWidget(text: 'About'),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: aboutController,
                              maxLength: 50,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFD9D9D9),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'Tell us about yourself ',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                            ),
                            const GuruTextWidget(text: 'Qualification'),
                            const SizedBox(
                              height: 5,
                            ),
                            AddGuruTextFromField(
                              qualificationController: qualificationController,
                              hintText:
                                  'Tell us about your Highest Professional Qualification ',
                            ),
                            const GuruTextWidget(text: 'Experience'),
                            const SizedBox(
                              height: 5,
                            ),
                            AddGuruTextFromField(
                                qualificationController: experienceController,
                                hintText:
                                    'Tell about your expertise and experience'),
                            const SizedBox(height: 4),
                            const GuruTextWidget(
                              text: 'Area of expertise ',
                            ),
                            const SizedBox(height: 5),
                            GlobalContainer(
                              height: 38,
                              borderWidth: 1.1,
                              color: const Color(0xFFD9D9D9),
                              width: 120,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 3, left: 9),
                                child: DropdownButton(
                                  underline: const SizedBox.shrink(),
                                  iconSize: 29,
                                  elevation: 20,
                                  isExpanded: true,
                                  value: currentItem,
                                  items: items
                                      .map<DropdownMenuItem<String>>(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (String? value) => setState(
                                    () {
                                      if (value != null) {
                                        currentItem = value;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const GuruTextWidget(text: 'Year of experience'),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 70,
                              height: 36,
                              child: TextFormInput(
                                hintText: '',
                                labelText: '',
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                controller: yearOfExperienceController,
                                maxLines: 1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                obscureText: false,
                                validator: (v) {
                                  if (audioController.text.length < 2) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GuruTextWidget(
                                    text: 'Choose your availability'),
                                const SizedBox(
                                  height: 9,
                                ),
                                ReusableText(
                                  text: 'Unavailable from',
                                  textStyle: appStyle(
                                    fw: FontWeight.w300,
                                    fontSize: 15.5,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                // InkWell(
                                //   onTap: () {},
                                //   child: TextFormField(
                                //     controller:  ,
                                //     decoration: const InputDecoration(
                                //       suffixIcon:
                                //           Icon(Icons.calendar_month),
                                //     ),
                                //   ),
                                // ),
                                GlobalContainer(
                                  borderWidth: 1.1,
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 1.6,
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(13),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableText(
                                          text: formDate.isEmpty
                                              ? 'DD/MM/YYYY'
                                              : formDate,
                                          textStyle: appStyle(
                                            fw: FontWeight.w400,
                                            fontSize: 15.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons
                                              .calendar_view_month_outlined),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                ReusableText(
                                  text: 'Unavailable to',
                                  textStyle: appStyle(
                                    fw: FontWeight.w300,
                                    fontSize: 15.5,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                GlobalContainer(
                                  height: 45,
                                  borderWidth: 1.1,
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(13),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableText(
                                          text: 'DD/MM/YYYY',
                                          textStyle: appStyle(
                                            fw: FontWeight.w400,
                                            fontSize: 15.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons
                                              .calendar_view_month_outlined),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReusableText(
                                          text: 'From',
                                          textStyle: appStyle(
                                            fw: FontWeight.w300,
                                            fontSize: 15.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        GlobalContainer(
                                          height: 39,
                                          borderWidth: 1.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color(0xFFD9D9D9),
                                          child: const Text(''),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ReusableText(
                                          text: ' To',
                                          textStyle: appStyle(
                                            fw: FontWeight.w300,
                                            fontSize: 15.5,
                                            color: Colors.black,
                                          ),
                                        ),
                                        GlobalContainer(
                                          height: 39,
                                          borderWidth: 1.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: const Color(0xFFD9D9D9),
                                          child: const Text(''),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                ReusableText(
                                  text: 'Choose your fees',
                                  textStyle: appStyle(
                                    fw: FontWeight.w500,
                                    fontSize: 15,
                                    color: const Color(0xFF283246),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                ReusableText(
                                  text: 'Audio Call',
                                  textStyle: appStyle(
                                    fw: FontWeight.w300,
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    GlobalContainer(
                                      height: 45,
                                      borderWidth: 1.1,
                                      borderRadius: BorderRadius.circular(14),
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      color: kBackGroundColors,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          children: [
                                            GlobalContainer(
                                              borderWidth: 0.0,
                                              height: 42,
                                              width: 90,
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Colors.white,
                                              child: TextFormInput(
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                ],
                                                hintText: '',
                                                labelText: '',
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                controller: videoController,
                                                maxLines: 1,
                                                obscureText: false,
                                                validator: (v) {
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            ReusableText(
                                              text: 'Coins/min',
                                              textStyle: appStyle(
                                                  fw: FontWeight.w300,
                                                  fontSize: 11,
                                                  color: const Color.fromARGB(
                                                      255, 249, 246, 246)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                ReusableText(
                                  text: 'Video Call',
                                  textStyle: appStyle(
                                    fw: FontWeight.w300,
                                    fontSize: 13,
                                    color: const Color(0xFF283246),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    GlobalContainer(
                                      height: 45,
                                      borderWidth: 1.1,
                                      borderRadius: BorderRadius.circular(14),
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      color: kBackGroundColors,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          children: [
                                            GlobalContainer(
                                              height: 42,
                                              width: 90,
                                              borderWidth: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Colors.white,
                                              child: TextFormInput(
                                                hintText: '',
                                                labelText: '',
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                controller: audioController,
                                                maxLines: 1,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  LengthLimitingTextInputFormatter(
                                                      2),
                                                ],
                                                obscureText: false,
                                                validator: (v) {
                                                  if (audioController
                                                          .text.length <
                                                      2) {
                                                    return null;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            ReusableText(
                                              text: 'Coins/min',
                                              textStyle: appStyle(
                                                  fw: FontWeight.w300,
                                                  fontSize: 11,
                                                  color: const Color.fromARGB(
                                                      255, 249, 246, 246)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final addGuruInformation =
                                          ref.read(profileServiceProvider);
                                      setState(() {
                                        isLoading = true;
                                      });
                                      if (_formKey.currentState!.validate()) {
                                        FeesCharge myFeesCharge = FeesCharge(
                                          audioCall:
                                              audioController.text.trim(),
                                          videoCall:
                                              videoController.text.trim(),
                                          isChat: "Chat (coming soon)",
                                        );

                                        GuruModel guruModel = GuruModel(
                                          email: widget.userData.email,
                                          id: widget.userData.id,
                                          // : true,
                                          username: nameController.text
                                                  .trim()
                                                  .isNotEmpty
                                              ? nameController.text.trim()
                                              : widget.userData.username,
                                          about: aboutController.text.trim(),
                                          phoneNumber:
                                              widget.userData.phoneNumber,
                                          totalRating: 0.0,
                                          yearOfExprience:
                                              yearOfExperienceController.text
                                                  .trim(),
                                          experience:
                                              experienceController.text.trim(),
                                          imageUrl: image != null
                                              ? image.toString()
                                              : widget.userData.photoUrl
                                                  .toString(),
                                          specialist: currentItem,
                                          joiningTime: DateTime.now()
                                              .microsecondsSinceEpoch
                                              .toString(),
                                          listExplore:
                                              widget.userData.listExplore,
                                          unAvailableFrom: ' ',
                                          unAvailableTo: ' ',
                                          timeFrom: '',
                                          timeTo: '',
                                          pushToken: '',
                                          qualification: qualificationController
                                              .text
                                              .trim(),
                                        );

                                        await addGuruInformation
                                            .addGuruInformation(
                                          guruModel: guruModel,
                                        )
                                            .then((value) async {
                                          if (value) {
                                            await addGuruInformation
                                                .updateFees(
                                                    feesCharge: myFeesCharge,
                                                    currentGuruId:
                                                        widget.userData.id)
                                                .then((value) {
                                              if (value) {
// ref
                                                //     .watch(
                                                //         authChangeNotifierProvider)
                                                //     .updateGuru(context);
                                                updateUser().then((value) {
                                                  if (value) {
                                                    Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    return Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SplashScreen(),
                                                      ),
                                                      (route) => false,
                                                    );
                                                  }
                                                });
                                              }
                                            });
                                          }
                                        });
                                      }
                                    },
                                    child: GlobalContainer(
                                      height: 43,
                                      borderWidth: 1.1,
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      color: kBackGroundColors,
                                      borderRadius: BorderRadius.circular(10),
                                      child: ReusableText(
                                        text: 'Become a Guru',
                                        textStyle: appStyle(
                                          fw: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddGuruTextFromField extends StatelessWidget {
  final String hintText;
  const AddGuruTextFromField({
    super.key,
    required this.qualificationController,
    required this.hintText,
  });

  final TextEditingController qualificationController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: qualificationController,
      maxLength: 80,
      maxLines: 3,
      decoration: InputDecoration(
        labelStyle: appStyle(
            fw: FontWeight.w400, fontSize: 13, color: const Color(0xFF283246)),
        helperStyle: appStyle(
            fw: FontWeight.w400, fontSize: 13, color: const Color(0xFF283246)),
        filled: true,
        fillColor: const Color(0xFFD9D9D9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFFD9D9D9), style: BorderStyle.none, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class GuruTextWidget extends StatelessWidget {
  final String text;

  const GuruTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableText(
      text: text,
      textStyle: appStyle(
        fw: FontWeight.w500,
        fontSize: 15,
        color: const Color(0xFF283246),
      ),
    );
  }
}

class ExtraInformation extends StatelessWidget {
  final TextEditingController audioController;
  final TextEditingController videoController;
  const ExtraInformation({
    super.key,
    required this.audioController,
    required this.videoController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: 'Choose Your availability',
          textStyle: appStyle(
            fw: FontWeight.w500,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ReusableText(
          text: 'Unavailable from',
          textStyle: appStyle(
            fw: FontWeight.w300,
            fontSize: 15.5,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        // GlobalContainer(
        //   borderWidth: 1.1,
        //   height: 45,
        //   width: MediaQuery.of(context).size.width / 1.6,
        //   color: const Color.fromARGB(255, 216, 221, 216),
        //   borderRadius: BorderRadius.circular(13),
        //   child: Padding(
        //     padding: const EdgeInsets.all(5.0),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         ReusableText(
        //           text: 'DD/MM/YYYY',
        //           textStyle: appStyle(
        //             fw: FontWeight.w400,
        //             fontSize: 15.5,
        //             color: Colors.black,
        //           ),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: const Icon(Icons.calendar_view_month_outlined),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: 'From',
                  textStyle: appStyle(
                    fw: FontWeight.w300,
                    fontSize: 15.5,
                    color: Colors.black,
                  ),
                ),
                GlobalContainer(
                  height: 39,
                  borderWidth: 1.1,
                  width: MediaQuery.of(context).size.width / 3,
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 216, 221, 216),
                  child: const Text(''),
                ),
              ],
            ),
            const SizedBox(
              width: 9,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: ' To',
                  textStyle: appStyle(
                    fw: FontWeight.w300,
                    fontSize: 15.5,
                    color: Colors.black,
                  ),
                ),
                GlobalContainer(
                  height: 39,
                  borderWidth: 1.1,
                  width: MediaQuery.of(context).size.width / 3,
                  borderRadius: BorderRadius.circular(14),
                  color: const Color.fromARGB(255, 216, 221, 216),
                  child: const Text(''),
                ),
              ],
            )
          ],
        ),
        ReusableText(
          text: 'Unavailable to',
          textStyle: appStyle(
            fw: FontWeight.w300,
            fontSize: 15.5,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        GlobalContainer(
          height: 45,
          borderWidth: 1.1,
          width: MediaQuery.of(context).size.width / 1.4,
          color: const Color.fromARGB(255, 216, 221, 216),
          borderRadius: BorderRadius.circular(13),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: 'DD/MM/YYYY',
                  textStyle: appStyle(
                    fw: FontWeight.w400,
                    fontSize: 15.5,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_view_month_outlined),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        ReusableText(
          text: 'Choose your fees',
          textStyle: appStyle(
            fw: FontWeight.w500,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        ReusableText(
          text: 'Audio Call',
          textStyle: appStyle(
            fw: FontWeight.w300,
            fontSize: 15.5,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            GlobalContainer(
              height: 41,
              borderWidth: 1.1,
              borderRadius: BorderRadius.circular(14),
              width: MediaQuery.of(context).size.width / 2.1,
              color: kBackGroundColors,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    GlobalContainer(
                      borderWidth: 1.1,
                      height: 40,
                      width: 90,
                      borderRadius: BorderRadius.circular(14),
                      color: whiteColor,
                      child: TextFormInput(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        hintText: '',
                        labelText: '',
                        controller: videoController,
                        maxLines: 1,
                        obscureText: false,
                        validator: (v) {
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ReusableText(
                      text: 'Coins/min',
                      textStyle: appStyle(
                        fw: FontWeight.w300,
                        fontSize: 15.5,
                        color: const Color.fromARGB(255, 249, 246, 246),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        ReusableText(
          text: 'Video Call',
          textStyle: appStyle(
            fw: FontWeight.w300,
            fontSize: 15.5,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            GlobalContainer(
              borderWidth: 1.1,
              height: 41,
              borderRadius: BorderRadius.circular(14),
              width: MediaQuery.of(context).size.width / 2.1,
              color: kBackGroundColors,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    GlobalContainer(
                      borderWidth: 1.1,
                      height: 39,
                      width: 90,
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      child: TextFormInput(
                        hintText: '',
                        labelText: '',
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: audioController,
                        maxLines: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        obscureText: false,
                        validator: (v) {
                          if (audioController.text.length < 2) {
                            return null;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ReusableText(
                      text: 'Coins/min',
                      textStyle: appStyle(
                        fw: FontWeight.w300,
                        fontSize: 15.5,
                        color: const Color.fromARGB(255, 249, 246, 246),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
