import 'package:flutter/material.dart';
import 'package:flutter_gp/app/utilities/colorUtil.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final AppBar? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const GlobalScaffold({
    required this.body,
    this.floatingActionButton,
    this.appBar,
    this.backgroundColor,
    this.drawer,
    this.scaffoldKey,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor ?? ColorUtil.primaryColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
      ),
    );
  }
}
