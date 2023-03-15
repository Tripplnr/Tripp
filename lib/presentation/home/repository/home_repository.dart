import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/models/popular_hotel_model.dart';

class HomeRepository {
  var apiClient = ApiClient();
  var controller = Get.find<HomeController>();

  Future fetchPopularHotels() async {
    /*Working but gives zero results*/
    controller.isLoading(true);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);

    print("fetchPopularHotels");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.homePopularHotelEndPoint,
        {
          "room_number": "1",
          "latitude": "65.9667",
          "order_by": "popularity",
          "checkout_date": "2023-08-19",
          "units": "metric",
          "adults_number": "2",
          "filter_by_currency": "AED",
          "locale": "en-gb",
          "longitude": "-18.5333",
          "checkin_date": "2023-08-18"
        },
      );
      PopularHotelModel _popularHotelModel =
          PopularHotelModel.fromJson(response);
      print('response $response');
      if (_popularHotelModel != null) {
        // var jsonData = json.decode(response.body);
        print('test');
        print("fetchPopularHotels response.body\n ==> ${response} ");
        controller.popularHotelsList.value = _popularHotelModel.result!;

        print(controller.popularHotelsList.value[0].url);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchPopularHotels exception ==> ${e.toString()}");
      return false;
    } finally {
      controller.isLoading(false);
      EasyLoading.dismiss();
    }
  }
}
