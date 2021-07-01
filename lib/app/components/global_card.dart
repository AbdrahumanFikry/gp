import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gp/app/utilities/appUtil.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';
class GlobalCard extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;

  const GlobalCard({
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
    this.margin,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppUtil.borderRadius10,
        ),
        color: color ?? ColorUtil.lightGrey,
        margin: margin ?? EdgeInsets.zero,
        elevation: margin != null ? elevation : 0.0,
        shadowColor: Colors.black54,
        child: child,
      ),
    );
  }
}
