import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/repository/hotel_repository.dart';

import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  // var popularHotelsList = [].obs;
  var popularHotelsList = [].obs;
  var homeHotelIndex = "".obs;
  var hotelRepository = HotelRepository();
  final indexController = Get.put(BottomNavBarController());
  var selectedindex = 1.obs;
  // HomeController(this.homeModelObj);
  // Rx<HomeModel> homeModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapPopularHotel(hotelId) {
    hotelRepository.fetchHotelDetails(hotelId: hotelId).then((value) {
      if (value) {
        print("->${homeHotelIndex.value}");
        Get.toNamed(AppRoutes.hotel_home);
      }
      print(value);
    });
  }
}
