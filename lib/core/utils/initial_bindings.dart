import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';
import 'package:trippinr/presentation/settings/controller/settings_controller.dart';

import '../../presentation/splash/controller/splash_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(AuthController());
    Get.put(UserSessionController());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    // ====
    Get.put(DestinationController());
    // Get.put(HotelController(), permanent: false);
    Get.lazyPut(() => HotelController());
    Get.lazyPut(() => SearchTabBarController());

    Get.put(HomeController());
    // Get.put(SearchTabBarController());
    Get.put(SettingsController());
    Get.put(SplashController());
  }
}
