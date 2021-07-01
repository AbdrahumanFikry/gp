import 'package:flutter/material.dart';
import 'package:flutter_gp/app/components/app_button.dart';
import 'package:flutter_gp/app/components/global_app_bar.dart';
import 'package:flutter_gp/app/components/global_scaffold.dart';
import 'package:flutter_gp/app/components/image_handler.dart';
import 'package:flutter_gp/app/components/loading.dart';
import 'package:flutter_gp/app/utilities/appUtil.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
import 'dart:io';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: 'data',
        enableBack: true,
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 7.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ImageHandler(
                  title: 'image',
                  borderColor: ColorUtil.whiteColor,
                  image: controller.frontId.value,
                  addFunction: () async => controller.frontId(
                    (await AppUtil.pickFiles()).first,
                  ),
                  removeFunction: () => controller.frontId(File('')),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'data',
                    style: TextStyle(
                      color: ColorUtil.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 70.sp,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            AppButton(
              margin: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
              backgroundColor: ColorUtil.whiteColor,
              textColor: ColorUtil.primaryColor,
              title: 'confirmAndEnter',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
