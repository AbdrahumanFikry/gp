import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorUtil.primaryColor,
                ),
              )
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
