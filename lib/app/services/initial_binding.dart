import 'package:get/get.dart';
import 'auth_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(
      AuthService(),
    );
  }
}
