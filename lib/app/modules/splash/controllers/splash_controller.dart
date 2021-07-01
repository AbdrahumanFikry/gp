import 'package:flutter/material.dart';
import 'package:flutter_gp/app/routes/app_pages.dart';
import 'package:flutter_gp/app/utilities/appUtil.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final selectedLang = RxString('ar');

  Future<String> initFunction(BuildContext context) async {
    try {
      // final authLogicRes = await AuthService.to.tryAutoLogin();
      // final String authRoute =
      //     authLogicRes == true ? Routes.HOME : Routes.WELCOME_SCREEN;
      return Routes.LOGIN;
    } catch (e) {
      AppUtil.showAlertDialog(
        body: e.toString(),
      );
      rethrow;
    }
  }
}
