import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:pinput/pinput.dart';

class OtpLogin extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String password;

  const OtpLogin({
    super.key,
    required this.phoneNumber,
    required this.password,
  });

  @override
  ConsumerState<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends ConsumerState<OtpLogin> {
  final pinController = TextEditingController();

  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? otpCode;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(authRepositoryProvider);
    final screenWith = MediaQuery.of(context).size.width;

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(48, 147, 247, 0);
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: screenWith * 0.056,
        color: const Color.fromRGBO(254, 255, 255, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kBackGroundColors,
        appBar: AppBar(
          backgroundColor: kBackGroundColors,
          automaticallyImplyLeading: false,
          title: const Text(
            'Verify your OTP',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 169,
                    width: 169,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        'assets/images/caffae.png',
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ReusableText(
                    text: widget.phoneNumber,
                    textStyle: appStyle(
                      fw: FontWeight.bold,
                      fontSize: screenWith * 0.049,
                      color: const Color.fromARGB(255, 4, 244, 68),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ReusableText(
                    text: 'We have sent an SMS with a code',
                    textStyle: appStyle(
                      fw: FontWeight.bold,
                      fontSize: screenWith * 0.049,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    height: 80,
                    child: Pinput(
                      length: 6,
                      mouseCursor: MouseCursor.defer,
                      controller: pinController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        textStyle: const TextStyle(color: Colors.white),
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      // focusNode.unfocus();
                      // if (pinController.text.isEmpty) {
                      //   BotToast.showText(text: 'Please enter otp');
                      //   return;
                      // }
                      // if (formKey.currentState!.validate()) {
                      //   if (!repository.isSignedIn) {
                      // try {
                      // bool confirmed = await repository.confirmLogin(
                      //   context: context,
                      //   otp: pinController.text.trim(),
                      // );

                      // if (confirmed) {
                      //   var box = await Hive.openBox('isSignedIn');
                      //   await box.put('isLogin', true);

                      // if (context.mounted) {
                      //   Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           const UserInformationScreen(
                      //               // authUser: authUser,
                      //               ),
                      //     ),
                      //     (route) => false,
                      //   );
                      // }
                      //     }
                      //   } catch (e) {
                      //     debugPrint("Error: $e");
                      //   }
                      // }
                      // }
                    },
                    child: GlobalContainer(
                      height: 46,
                      borderWidth: 1.1,
                      width: MediaQuery.of(context).size.width / 1.2,
                      borderRadius: BorderRadius.circular(14),
                      color: kBackGroundColors,
                      child: ReusableText(
                        text: 'Verify Otp',
                        textStyle: appStyle(
                          fw: FontWeight.bold,
                          fontSize: screenWith * 0.049,
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
      ),
    );
  }
}
