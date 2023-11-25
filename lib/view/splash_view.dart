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
    await Future.delayed(const Duration(seconds: 2));
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
    // var media = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: TColor.primary,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Powered by CP Store",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/img/store_tab.png",
                color: Colors.white,
                width: 23,
                height: 23,
              ),
            ],
          ),
        ));
  }
}
