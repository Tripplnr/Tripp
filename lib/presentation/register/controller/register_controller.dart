import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';

class RegisterController extends GetxController {
  final authController = Get.find<AuthController>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frame427320588Controller = TextEditingController();

  TextEditingController frame427320591Controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapRegister() {
    if (formKey.currentState!.validate()) {
      print("Hit Api");
      // Get.toNamed(AppRoutes.login);
      authController.isLoggedIn.value = true;
      Get.offAndToNamed(AppRoutes.bottom_nav_bar);
    } else {
      print("invalid");
    }
    ;

    // Get.offAndToNamed(AppRoutes.bottom_nav_bar);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    frame427320588Controller.dispose();
    frame427320591Controller.dispose();
  }
}
