import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/repository/home_repository.dart';

import '../../../auth_controller.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var homeRepository = HomeRepository();
  final authController = Get.find<AuthController>();
  bool isValidPassword(String password) {
    String pattern =
        r'^(?=.*?[a-zA-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~%():;<>?]).{8,}$';
    return RegExp(pattern).hasMatch(password);
  }

  onTapLogin() {
    if (
        // formKey.currentState!.validate()){
        formKey.currentState!.validate()) {
      print("Hit Api");
      authController.isLoggedIn.value = true;
      Get.offAndToNamed(AppRoutes.bottom_nav_bar);
      // homeRepository.fetchPopularHotels().then((value) {
      //   if (value) {
      //     // Get.toNamed(AppRoutes.bottom_nav_bar);
      //
      //     authController.isLoggedIn.value = true;
      //     Get.offAndToNamed(AppRoutes.bottom_nav_bar);
      //   }
      //   print("=>$value");
      // });
    } else {
      print("Invalid");
    }
  }
  // login(BuildContext context) async {
  //   if (emailController.text == null || emailController.text.trim() == "") {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_EMAIL);
  //     return;
  //   }
  //
  //   if (!EmailValidator.validate(emailController.text.trim())) {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_VALID_EMAIL);
  //     return;
  //   }
  //
  //   if (passwordController.text == null ||
  //       passwordController.text.trim() == "") {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_PASSWORD);
  //     return;
  //   }
  //
  //   EasyLoading.show(status: LOADING_AUTHENTICATING);
  //
  //   Future<dio.Response?> loginResponse =
  //   ApiClient().login(emailController.text, passwordController.text);
  //   loginResponse.then((response) async {
  //     if (response != null) {
  //       print("login response ==> $response");
  //
  //       log(response.toString());
  //
  //       Map<String, dynamic> loginResponse = jsonDecode(response.toString());
  //
  //       if (loginResponse["token"] != null) {
  //         await Utils.saveToken(loginResponse["token"]);
  //         await Utils.saveRefreshToken(loginResponse["refreshToken"]);
  //
  //         await Utils.saveCurrentUserDetails(jsonEncode(loginResponse["user"]));
  //
  //         UserModel? user = await Utils.getCurrentUser();
  //         if (user != null) {
  //           print("user.paymentSource!.brand");
  //           // print(user.paymentSource?.brand);
  //           Cache.userFullName = "${user.first_name} ${user.last_name}";
  //           Cache.userEmail = user.email;
  //           Cache.userPhone = user.phone;
  //           if (user.paymentSources != null) {
  //             if (user.paymentSources!.isNotEmpty) {
  //               print(jsonEncode(user.paymentSources));
  //               await Utils.savePaymentSource(jsonEncode(user.paymentSources!));
  //               print(Utils.getPaymentSource());
  //               print("User Payment Sources ===>> ${user.paymentSources!}");
  //             }
  //
  //             // List<PaymentSources>? d = [];
  //             // d.add(PaymentSources(
  //             //   token: "asdfasdf",
  //             //   brand: "master",
  //             //   last4: "2133",
  //             //   expMonth: 4,
  //             //   expYear: 22
  //             //
  //             // ));
  //             // Utils.savePaymentSource(jsonEncode(d));
  //
  //           }
  //         }
  //
  //         EasyLoading.dismiss();
  //
  //         switch (response.statusCode) {
  //           case 200:
  //             Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  //             break;
  //           case 400:
  //             EasyLoading.showError(loginResponse["messageForUser"]);
  //             break;
  //           default:
  //             EasyLoading.showError("Login failed, please try again.");
  //         }
  //       } else {
  //         EasyLoading.dismiss();
  //         var message = loginResponse["status"]["messageForUser"] ??
  //             "Login failed, please try again.";
  //         EasyLoading.showError(message);
  //       }
  //     } else {
  //       EasyLoading.dismiss();
  //       EasyLoading.showError("Login failed, please try again.");
  //     }
  //   });
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
