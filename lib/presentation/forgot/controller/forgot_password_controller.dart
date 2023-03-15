import 'package:trippinr/core/app_export.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapForgotPassword() {
    if (formKey.currentState!.validate()) {
      print("Hit Api");
      // Get.toNamed(AppRoutes.bottom_nav_bar);
      Get.back();
    } else {
      print("Invalid");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
