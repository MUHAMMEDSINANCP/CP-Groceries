import 'package:cp_groceries/common_widget/round_button.dart';
import 'package:cp_groceries/view/login/sign_in_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  //this is for to avoid safe area things like time , network etc and to avoid navigator on top like back button, recenttabs etc.

  // void initState() {
  //   super.initState();
  //   // for avoiding time etc things on top of screen .... wokay!
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Image.asset(
          "assets/img/welcom_bg.png",
          width: media.width,
          height: media.height,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: 60,
                height: 60,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: media.width * 0.26),
                      child: const Text(
                        'Welcome to\nCP Groceries',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: media.width * 0.09),
                      child: Text(
                        'Get your groceries in as fast as one hour',
                        style: TextStyle(
                            color: const Color(0xffFCFCFC).withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundButton(
                  title: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 46,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
