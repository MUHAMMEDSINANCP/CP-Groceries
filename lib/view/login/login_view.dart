import 'package:cp_groceries/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/color_extensions.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/round_button.dart';
import '../../view_model/login_view_model.dart';
import '../main_tabview/main_tabview.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/img/bottom_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/color_logo.png",
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.15,
                    ),
                    Text(
                      "Loging",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    Text(
                      "Enter your email and password",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    LineTextField(
                      controller: loginVM.txtEmail.value,
                      title: "Email",
                      placeholder: "Enter your email address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    Obx(
                      () => LineTextField(
                        controller: loginVM.txtPassword.value,
                        title: "Password",
                        placeholder: "Enter your password",
                        obscreText: !loginVM.isShowPassword.value,
                        right: IconButton(
                          onPressed: () {
                            loginVM.showPassword();
                          },
                          icon: Icon(
                            !loginVM.isShowPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: TColor.textTittle,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    RoundButton(
                      title: "Log In",
                      onPressed: () {
                        // when using api call use  the below command section
                        // loginVM.serviceCallLogin();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainTabView(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: media.width * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Dont't have an account?",
                                style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "SignUp",
                                style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
