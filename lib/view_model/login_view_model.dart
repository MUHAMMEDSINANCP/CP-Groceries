import 'package:cp_groceries/common/globs.dart';
import 'package:cp_groceries/common/service_call.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {


     

  final txtEmail = TextEditingController().obs;
  final txtPassword = TextEditingController().obs;
  final isShowPassword = false.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
     super.onInit();
    if (kDebugMode) {
      print("LoginViewModel Init ");
    }
    txtEmail.value.text = "test@gmail.com";
    txtPassword.value.text = "123456";
  }

  //ServiceCall

  void serviceCallLogin() {
    Globs.showHUD();
    ServiceCall.post({
      "email": txtEmail.value.text,
      "password": txtPassword.value.text,
      "device_token": "",
    }, SVKey.svLogin, withSuccess: (resObj) async {
      Globs.hideHUD();

      Get.snackbar(Globs.appName, resObj["message"].toString());
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }

  void showPassword() {
    isShowPassword.value = !isShowPassword.value;
  }
}

