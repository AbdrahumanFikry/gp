import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gp/app/routes/app_pages.dart';
import 'package:flutter_gp/app/utilities/mixins/api_mixin.dart';
import 'package:flutter_gp/app/utilities/mixins/busy_mixin.dart';
import 'package:get/get.dart';

class AuthService extends GetxService with BusyMixin, ApiMixin {
  static AuthService get to => Get.find<AuthService>();
  GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  TextEditingController address = TextEditingController();

  final genderValue = 'male'.obs;
  final pinCodeError = RxString('');
  final forgetPassword = false.obs;
  final changePassword = false.obs;
  final hidePassword = true.obs;
  final agreeToTermsAndConditions = true.obs;
  final frontId = Rx<File>(File(''));
  final rearId = Rx<File>(File(''));
  final isCounting = true.obs;

  void changeObscuring() {
    hidePassword(!hidePassword.value);
  }

  Future<void> login() async {
    final formData = loginFormKey.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        startBusyWithId('login');
        //TODO Send api
        password.clear();
        changePassword(false);
        forgetPassword(false);
        endBusySuccess();
        Get.toNamed(Routes.HOME);
      } catch (error) {
        endBusyError(error.toString(), showDialog: true);
      }
    }
  }

  Future<void> signUp() async {
    try {
      startBusyWithId('signUp');
      //TODO Send api
      endBusySuccess();
      Get.toNamed(Routes.HOME);
    } catch (error) {
      endBusyError(error.toString(), showDialog: true);
    }
  }
}
