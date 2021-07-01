import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp/app/components/app_button.dart';
import 'package:flutter_gp/app/components/app_text_field.dart';
import 'package:flutter_gp/app/components/global_scaffold.dart';
import 'package:flutter_gp/app/routes/app_pages.dart';
import 'package:flutter_gp/app/services/auth_service.dart';
import 'package:flutter_gp/app/utilities/appUtil.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
import 'package:flutter_gp/app/utilities/pathUtil.dart';
import 'package:flutter_gp/app/utilities/validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
            ),
            Positioned(
              top: Get.mediaQuery.padding.top +
                  Get.mediaQuery.padding.bottom +
                  20.0,
              right: 0.0,
              left: 0.0,
              bottom: Get.height * 0.20,
              child: Obx(
                () => Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      Image.asset(
                        PathUtil.logoIcon,
                        height: 300.sp,
                        width: 300.sp,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'signIn',
                        style: TextStyle(
                          color: ColorUtil.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 70.sp,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      AppTextField(
                        controller.phone,
                        keyBoardType: TextInputType.number,
                        labelText: 'phone',
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        prefixWidget: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        validator: const QuickTextValidator(),
                      ),
                      AppTextField(
                        controller.password,
                        isPassword: true,
                        labelText: 'password',
                        hidePassword: controller.hidePassword.value,
                        changeObscuring: controller.changeObscuring,
                        prefixWidget: const Icon(
                          CupertinoIcons.lock_fill,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 5.0,
                        ),
                        validator: const QuickTextValidator(
                          hasMinLength: 8,
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      AppButton(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        backgroundColor: ColorUtil.whiteColor,
                        textColor: ColorUtil.primaryColor,
                        title: 'enter',
                        onTap: controller.login,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'donNotHaveAcc',
                            style: TextStyle(
                              color: ColorUtil.whiteColor,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              controller.password.clear();
                              controller.confirmedPassword.clear();
                              controller.forgetPassword(false);
                              controller.changePassword(false);
                              Get.toNamed(Routes.ACCOUNT);
                            },
                            child: Text(
                              'signUp',
                              style: TextStyle(
                                color: ColorUtil.blackColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
