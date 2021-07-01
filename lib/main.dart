import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/initial_binding.dart';
import 'app/utilities/appUtil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: () => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: GetMaterialApp(
          title: 'GP',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.native,
          getPages: AppPages.routes,
          initialRoute: Routes.SPLASH,
          initialBinding: InitialBinding(),
        ),
      ),
    );
  }
}
