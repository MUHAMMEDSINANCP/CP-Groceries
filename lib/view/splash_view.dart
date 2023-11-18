import 'package:cp_groceries/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    firstOpenApp();
  }

  void firstOpenApp() async {
    await Future.delayed(const Duration(seconds: 3));
    startApp();
  }

  void startApp() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeView()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/img/splash_logo.png",
              width: media.width * 0.5,
            ),
          )
        ],
      ),
    );
  }
}
