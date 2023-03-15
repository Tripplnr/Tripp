import 'package:trippinr/core/app_export.dart';

import '../../bottom_nav_bar/bottom_nav_bar_helper_methods.dart';

class FavouriteController extends GetxController {
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  popupScreen(context) {
    Future.delayed(Duration(seconds: 3), () async {
      await _bottomNavBarHelperMethods.loginPopUp(context);
    });
  }
}
