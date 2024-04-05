import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/themes/app_decoration.dart';
import 'package:caffae_app/src/Global/widgets/custom_image_view.dart';
import 'package:caffae_app/src/Global/widgets/my_text_field.dart';
import 'package:caffae_app/src/features/Auth/screens/signup.dart';
import 'package:caffae_app/src/features/calling/call_services.dart';
import 'package:caffae_app/src/features/calling/call_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:hive/hive.dart';

class LoginPhoneScreen extends ConsumerStatefulWidget {
  static const routeName = '/LoginPhoneScreen-screen';
  const LoginPhoneScreen({super.key});

  @override
  ConsumerState<LoginPhoneScreen> createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends ConsumerState<LoginPhoneScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  RegExp regExp = RegExp(r'^[0]?[6789]\d{9}$');
  RegExp countryRegExp = RegExp(r'^\+?(\d+)');

  int validatePhone(String phone) {
    String pattern = r'^[0]?[6789]\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (phone.isEmpty) {
      return 1;
    } else if (phone.length < 10) {
      return 2;
    } else if (!regExp.hasMatch(phone)) {
      return 3;
    } else {
      return 0;
    }
  }

  final _userIDTextCtrl = TextEditingController(text: 'user_id');
  @override
  void initState() {
    getUniqueUserId().then((userID) async {
      setState(() {
        _userIDTextCtrl.text = userID;
      });
    });
    super.initState();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(authRepositoryProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    // final loading = ref.watch(authChangeNotifierProvider.notifier).isLoading;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: appTheme.blueGray90001,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  CustomImageView(
                    imagePath: 'assets/images/caffae.png',
                    height: 145.v,
                    width: 135.h,
                  ),
                  SizedBox(height: 20.v),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 400.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 47.h,
                              vertical: 35.v,
                            ),
                            decoration: AppDecoration.outlinePrimary14.copyWith(
                              borderRadius: BorderRadiusStyle.customBorderTL25,
                            ),
                            child: Column(
                              children: [
                                TextFormInput(
                                  maxLines: 1,
                                  obscureText: false,
                                  hintText: 'Enter your username',
                                  labelText: 'username',
                                  validator: (String? value) {
                                    // _formKey.currentState!.validate();
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty";
                                    }
                                    return null;
                                  },
                                  controller: usernameController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormInput(
                                  obscureText: _obscureText,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    icon: Icon(_obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  // controller:
                                  //     Get.find<SignUpController>().passwordController,
                                  controller: passwordController,
                                  validator: (String? value) {
                                    // _formKey.currentState!.validate();
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  hintText: 'Enter your password',
                                  labelText: 'Password',
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    print('object');
                                    String password =
                                        passwordController.text.trim();
                                    String username =
                                        usernameController.text.trim();

                                    if (_formKey.currentState!.validate() &&
                                        password.isNotEmpty) {
                                      FocusScope.of(context).unfocus();
                                      repository
                                          .loginUsername(
                                        userName: username,
                                        password: password,
                                        context: context,
                                      )
                                          .then((values) async {
                                        if (values) {
                                          login(
                                            userID: _userIDTextCtrl.text,
                                            userName:
                                                'user_${_userIDTextCtrl.text}',
                                          ).then((value) async {
                                            onUserLogin();

                                            var box = await Hive.openBox(
                                                'isSignedIn');
                                            await box.put('isLogin', values);
                                            BotToast.showText(
                                                text: 'Welcome to you Caffe');
                                            if (context.mounted) {
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const AuthCheckScreen()),
                                                      (route) => false);
                                            }
                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: GlobalContainer(
                                    height: 51,
                                    width: screenWidth * 0.89,
                                    borderWidth: 1.1,
                                    borderRadius: BorderRadius.circular(6),
                                    color: kBackGroundColors,
                                    child: ReusableText(
                                      text: 'Login',
                                      textStyle: appStyle(
                                        fw: FontWeight.bold,
                                        fontSize: screenWidth * 0.049,
                                        color: appTheme.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: appStyle(
                                        fw: FontWeight.w300,
                                        fontSize: screenWidth * 0.03,
                                        color: appTheme.blackColor),
                                    text: "Don't have an account kindly",
                                    children: [
                                      TextSpan(
                                        text: ' Register',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen(),
                                              ),
                                            );
                                          },
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600,
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          fontSize: screenWidth * 0.04,
                                          color: const Color.fromARGB(
                                            255,
                                            6,
                                            230,
                                            47,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecorationTextField() {
    final screenWidth = MediaQuery.of(context).size.width;
    return InputDecoration(
      filled: true,
      prefixIcon: Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(right: 7),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 42, 35, 35), width: 1),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Text(
          '+${91}',
          style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.046,
              fontWeight: FontWeight.bold),
        ),
      ),
      alignLabelWithHint: true,
      hoverColor: Colors.white,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide:
            const BorderSide(color: Color.fromARGB(255, 78, 63, 63), width: 1),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
      ),
      focusColor: const Color.fromARGB(255, 207, 0, 0),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      fillColor: Colors.white,
      hintStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      hintText: "XXXXXXXXXX",
    );
  }
}

final showPassword = StateProvider<bool>((ref) => false);
