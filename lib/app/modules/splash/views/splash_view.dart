import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
import 'package:flutter_gp/app/utilities/pathUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return BdayaCustomSplash(
      splashDuration: 2,
      backgroundBuilder: (child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorUtil.primaryColor,
                ColorUtil.primaryColor.withOpacity(0.8),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: child,
        );
      },
      initFunction: () async {
        return controller.initFunction(context);
      },
      logoBuilder: () {
        return Center(
          child: Image.asset(
            PathUtil.logoIcon,
            height: 600.sp,
          ),
        );
      },
      onNavigateTo: (result) async {
        Get.offAllNamed(result.toString());
      },
    );
  }
}
