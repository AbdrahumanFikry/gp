import 'package:flutter_gp/app/modules/auth/views/login_view.dart';
import 'package:flutter_gp/app/modules/auth/views/personal_data_view.dart';
import 'package:flutter_gp/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_gp/app/modules/home/views/home_view.dart';
import 'package:flutter_gp/app/modules/splash/bindings/splash_binding.dart';
import 'package:flutter_gp/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => PersonalDataView(),
      transition: Transition.fade,
    ),
  ];
}
