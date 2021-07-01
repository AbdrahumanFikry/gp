import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp/app/components/app_button.dart';
import 'package:flutter_gp/app/components/app_text_field.dart';
import 'package:flutter_gp/app/components/global_scaffold.dart';
import 'package:flutter_gp/app/services/auth_service.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
import 'package:flutter_gp/app/utilities/pathUtil.dart';
import 'package:flutter_gp/app/utilities/validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalDataView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Stack(
        children: [
          Container(
            color: ColorUtil.primaryColor,
            height: Get.height,
            width: Get.width,
          ),
          Positioned(
            top: Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Obx(
              () => Form(
                key: controller.accountFormKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Image.asset(
                      PathUtil.logoIcon,
                      height: 250.sp,
                      width: 250.sp,
                    ),
                    const SizedBox(
                      height: 7.0,
                    ),
                    Text(
                      'createUserAccount',
                      style: TextStyle(
                        color: ColorUtil.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    AppTextField(
                      controller.name,
                      labelText: 'name',
                      readOnly: controller.isBusy.value,
                      validator: const QuickTextValidator(),
                      prefixWidget: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    AppTextField(
                      controller.address,
                      labelText: 'address',
                      readOnly: controller.isBusy.value,
                      prefixWidget: const Icon(
                        CupertinoIcons.map_fill,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    AppTextField(
                      controller.phone,
                      keyBoardType: TextInputType.number,
                      labelText: 'phone',
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
                      validator: const QuickTextValidator(
                        hasMinLength: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    AppButton(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      backgroundColor: ColorUtil.whiteColor,
                      textColor: ColorUtil.primaryColor,
                      title: 'confirm',
                      onTap: controller.signUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
