import 'package:caffae_app/src/Global/Exponents/exponent.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/widgets/my_text_field.dart';
import 'package:caffae_app/src/features/Auth/screens/login_screen.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
// sign -> email , photo
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  RegExp regExp = RegExp(r'^[0]?[6789]\d{9}$');
  RegExp countryRegExp = RegExp(r'^\+?(\d+)');
  bool divider = false;
  bool isLoaded = false;

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

  bool _obscureText = true;
  bool _obscureText1 = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final repository = ref.watch(authRepositoryProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.7,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.elliptical(15, 15),
                            bottomStart: Radius.elliptical(15, 15)),
                        color: kBackGroundColors,
                        // image: DecorationImage(
                        //   fit: BoxFit.contain,t
                        //   filterQuality: FilterQuality.high,
                        //   image: AssetImage(
                        //     'assets/images/caffae.png',
                        //   ),
                        // ),
                      ),
                      child: Image.asset('assets/images/caffae.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // shape: BoxShape.circle,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.elliptical(15, 15),
                            topEnd: Radius.elliptical(15, 15)),

                        // image: DecorationImage(
                        //   fit: BoxFit.contain,t
                        //   filterQuality: FilterQuality.high,
                        //   image: AssetImage(
                        //     'assets/images/caffae.png',
                        //   ),
                        // ),
                      ),
                      height: MediaQuery.of(context).size.height / 1.5,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter your phone number',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormInput(
                            maxLines: 1,
                            obscureText: false,
                            hintText: 'Enter your username',
                            labelText: 'username',
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "This field can't be empty";
                              }
                              return null;
                            },
                            controller: userNameController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  validator: (value) {
                                    int res = validatePhone(value!);
                                    if (res == 1) {
                                      return "Please enter number";
                                    } else if (res == 2) {
                                      return "Please enter 10 digits phone number";
                                    } else if (res == 3) {
                                      return "Please enter a valid 10 digits phone number";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: const TextStyle(fontSize: 19),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else if (value.length == 10) {
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: inputDecorationTextField(context),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormInput(
                            obscureText: _obscureText1,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText1 = !_obscureText1;
                                });
                              },
                              icon: Icon(_obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            // controller:
                            //     Get.find<SignUpController>().passwordController,
                            controller: passwordController,
                            validator: (String? value) {
                              List<String> validation = [];
                              if (value == null || value.isEmpty) {
                                return 'This field can not be empty';
                              } else {
                                if (!value.isValidPasswordHasNumber) {
                                  validation.add('Must contain 1 Number');
                                }
                                if (!value.isValidPasswordHasCapitalLetter) {
                                  validation
                                      .add("Must contain 1 capital letter");
                                }
                                if (!value.isValidPasswordHasLowerCaseLetter) {
                                  validation
                                      .add("Must contain 1 simple letter");
                                }
                                if (!value.isValidPasswordHasSpecialCharacter) {
                                  validation.add(
                                      "Must contain 1 special character[! @ # \$ %]");
                                }
                              }
                              String msg = '';
                              if (validation.isNotEmpty) {
                                for (var i = 0; i < validation.length; i++) {
                                  msg = msg + validation[i];
                                  if ((i + 1) != validation.length) {
                                    msg = "$msg\n";
                                  }
                                }
                              }
                              return msg.isNotEmpty ? msg : null;
                            },
                            hintText: 'Enter your password',
                            labelText: 'password',
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
                            controller: confirmPasswordController,
                            validator: (String? value) {
                              if (passwordController.text.trim() !=
                                  confirmPasswordController.text.trim()) {
                                return 'Enter your same password';
                              }
                              return null;
                            },
                            hintText: 'Enter your confirmation password',
                            labelText: ' Confirm password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormInput(
                            maxLines: 1,
                            obscureText: false,
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "This field can't be empty";
                              } else if (!value.isValidEmail) {
                                return "Please enter valid email";
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          phoneController.text.isEmpty &&
                                  emailController.text.isEmpty &&
                                  passwordController.text.isEmpty
                              ? GlobalContainer(
                                  height: 51,
                                  width: screenWidth * 0.89,
                                  borderWidth: 1.1,
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.grey,
                                  child: ReusableText(
                                    text: 'Send OTP',
                                    textStyle: appStyle(
                                      fw: FontWeight.bold,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 120, 108, 108),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    String phoneNumber =
                                        '+91${phoneController.text.trim()}';
                                    String email = emailController.text.trim();
                                    String password =
                                        passwordController.text.trim();

                                    if (_formKey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      repository.registerNewUser(
                                        username:
                                            userNameController.text.trim(),
                                        phoneNumber: phoneNumber,
                                        password: password,
                                        confirmPassword:
                                            confirmPasswordController.text
                                                .trim(),
                                        email: email,
                                        context: context,
                                      );
                                      if (!mounted) return;
                                    }
                                  },
                                  child: GlobalContainer(
                                    height: 51,
                                    width: screenWidth * 0.89,
                                    borderWidth: 1.1,
                                    borderRadius: BorderRadius.circular(6),
                                    color: kBackGroundColors,
                                    child: ReusableText(
                                      text: 'Send  OTP',
                                      textStyle: appStyle(
                                        fw: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: appStyle(
                                  fw: FontWeight.w300,
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.black),
                              text: "Do you have an account",
                              children: [
                                TextSpan(
                                  text: '  login',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPhoneScreen(),
                                        ),
                                      );
                                    },
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w600,
                                    textBaseline: TextBaseline.ideographic,
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
                    )
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

InputDecoration inputDecorationTextField(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return InputDecoration(
    prefixIcon: Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.only(right: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromARGB(255, 42, 35, 35), width: 1),
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
    filled: true,
    alignLabelWithHint: true,
    labelStyle: const TextStyle(
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
    contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
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
