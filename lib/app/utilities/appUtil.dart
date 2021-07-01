import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp/app/components/app_button.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'colorUtil.dart';

class AppUtil {
  static double safeScreenHeight(context) =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final RegExp phoneValidatorRegExp = RegExp(r'^\+?[0-9]{10,}$');
  static BorderRadius borderRadius25 = BorderRadius.circular(25.0);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius50 = BorderRadius.circular(50.0);
  static BorderRadius borderRadius7 = BorderRadius.circular(7.5);

  static OutlineInputBorder outLineInputBorder({
    Color? color,
    BorderRadius? borderRadius,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: color ?? Colors.transparent,
          width: 0.5,
        ),
      );

  static OutlineInputBorder errorOutLineInputBorder({
    BorderRadius? borderRadius,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: ColorUtil.errorColor,
          width: 0.5,
        ),
      );

  static UnderlineInputBorder underLineInputBorder({
    Color? color,
    BorderRadius? borderRadius,
  }) =>
      UnderlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ),
      );

  static UnderlineInputBorder errorUnderLineInputBorder({
    BorderRadius? borderRadius,
  }) =>
      UnderlineInputBorder(
        borderRadius: borderRadius ?? borderRadius10,
        borderSide: BorderSide(
          color: ColorUtil.errorColor,
        ),
      );

  static ThemeData appTheme = ThemeData(
    fontFamily: 'Cairo',
    primaryColor: ColorUtil.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Future<List<File>> pickFiles({
    bool allowMultiple = false,
    FileType fileType = FileType.image,
    bool allowCompression = true,
  }) async {
    List<File> files = <File>[];
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple,
        type: fileType,
        allowCompression: allowCompression,
      );
      if (result != null) {
        for (final file in result.files) {
          print(file.name);
          print(file.path);

          files.add(File(file.path!));
        }
      }
    } catch (e) {
      print('FilePicker error : ${e.toString()}');
    }
    return files;
  }

  static Future<DateTime> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    print('Selected date : ' + date.toString());
    return DateTime.utc(date!.year, date.month, date.day, 12);
  }

  static Future<DateTime> pickTime(BuildContext context) async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    print('Selected time : ' + result.toString());
    final date = DateTime.now();
    final time = DateTime(
      date.year,
      date.month,
      date.day,
      result!.hour,
      result.minute,
    );
    return time;
  }

  static Future<bool?> showAlertDialog({
    String? title,
    String? body,
    Function? onConfirm,
    String? confirmText,
    bool enableCancel = false,
    String? cancelText,
  }) async {
    return await Get.dialog<bool>(
      AlertDialog(
        title: Center(
          child: Text(
            title ?? 'Alert',
            style: TextStyle(
              color: ColorUtil.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        content: body != null
            ? Text(
                body,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
                maxLines: 6,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        actions: [
          if (enableCancel) ...[
            AppButton(
              height: 45.0,
              width: 85.0,
              onTap: () => Get.back(result: false),
              title: cancelText ?? 'cancel',
            ),
          ],
          AppButton(
            height: 45.0,
            width: 85.0,
            onTap: () {
              onConfirm!.call();
              Get.back(result: true);
            },
            title: confirmText ?? 'Done',
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: AppUtil.borderRadius10),
      ),
    );
  }
}
