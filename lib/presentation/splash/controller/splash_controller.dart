import 'package:trippinr/core/app_export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    splashInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> splashInit() async {
    await Future.delayed(Duration(seconds: 3));
    // Get.toNamed(AppRoutes.login);
    Get.offAndToNamed(AppRoutes.bottom_nav_bar);
  }
}
