import 'package:cp_groceries/common/color_extensions.dart';
import 'package:cp_groceries/common_widget/round_button.dart';
import 'package:cp_groceries/view/login/login_view.dart';
import 'package:cp_groceries/view/login/sign_up_view.dart';
import 'package:cp_groceries/view/login/verification_view.dart';
import 'package:cp_groceries/view/main_tabview/main_tabview.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtMobile = TextEditingController();
  FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late CountryCode countryCode;

  @override
  void initState() {
    super.initState();

    countryCode = countryPicker.countryCodes
        .firstWhere((element) => element.name == "India");
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(alignment: Alignment.topCenter, children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/img/bottom_bg.png",
                width: media.width,
                height: media.height,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Image.asset(
          "assets/img/sign_in_top.png",
          width: media.width,
        ),
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: media.width * 0.7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Get your groceries with\nCP Groceries",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: txtMobile,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: IconButton(
                              onPressed: () {
                                if (txtMobile.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      dismissDirection: DismissDirection.up,
                                      behavior: SnackBarBehavior.floating,
                                      duration: const Duration(seconds: 1),
                                      margin: EdgeInsets.only(
                                          bottom: media.width * 1.4,
                                          left: 20,
                                          right: 20),
                                      backgroundColor: Colors.red,
                                      content: const Text(
                                        'Please enter a Mobile number to continue.',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainTabView(),
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.login_rounded,
                                size: 34,
                              ),
                            ),
                          ),
                          prefixIcon: GestureDetector(
                            onTap: () async {
                              final code = await countryPicker.showPicker(
                                  context: context);
                              if (code != null) {
                                countryCode = code;
                              }
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 35,
                                  height: 35,
                                  child: countryCode.flagImage(),
                                ),
                                Text(
                                  countryCode.dialCode,
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(
                              color: TColor.placeholder, fontSize: 17),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 1,
                        color: const Color(0xffE2E2E2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RoundButton(
                    title: 'Sign In with Email',
                    bgColor: Colors.green.shade600,
                    onPressed: () {
                      Get.to(() => const LogInView());
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: RoundButton(
                    title: 'Sign Up with Email',
                    onPressed: () {
                      Get.to(() => const SignUpView());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Or connect with social media",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: RoundIconButton(
                    title: 'Continue with Google',
                    icon: "assets/img/google_logo.png",
                    bgColor: Colors.redAccent,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerificationView()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: RoundIconButton(
                    title: 'Continue with Facebook',
                    icon: "assets/img/fb_logo.png",
                    bgColor: const Color(0xff4A66AC),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: media.width * 0.88, left: media.width * 0.58),
          child: MaterialButton(
            elevation: 5,
            height: 24,
            padding: const EdgeInsets.all(5),
            color: Colors.amberAccent,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainTabView(),
                  ));
            },
            child: const Text(
              "Login as Guest?",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
        ),
      ]),
    );
  }
}
