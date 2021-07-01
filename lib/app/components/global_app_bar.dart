import 'package:flutter/material.dart';
import 'package:flutter_gp/app/utilities/appUtil.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
import 'package:get/get.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar({
    String? title,
    Widget? child,
    Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor,
    double elevation = 0.0,
    bool centerTitle = true,
    bool enableBack = false,
  }) : super(
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation,
          title: child ??
              FittedBox(
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: ColorUtil.whiteColor,
                  ),
                ),
              ),
          centerTitle: centerTitle,
          leading: enableBack
              ? IconButton(
                  padding: const EdgeInsets.all(10.0),
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: ColorUtil.whiteColor,
                  ),
                )
              : leading,
          actions: actions ?? <Widget>[],
          automaticallyImplyLeading: enableBack,
        );
}
