import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/hotel/models/hotel_details/hotel_details_model.dart';
import 'package:trippinr/presentation/hotel/models/hotel_details/hotel_reviews_model.dart';

class HotelRepository {
  var apiClient = ApiClient();
  var controller = Get.find<HotelController>();

  Future fetchHotelDetails({hotelId}) async {
    controller.isLoading(true);
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    print("fetchHotelDetails");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );
      var _hotelDetails = HotelDetails.fromJson(response);
      // print('response $response');
      if (_hotelDetails != null) {
        print(
            "fetchHotelDetails response.body\n ==> ${_hotelDetails.hotelId} ");
        controller.hotelDetails.value = _hotelDetails;

        print(controller.hotelDetails.value.hotelId);
        /*Hotel Full API Calls*/
        await fetchHotelDescription(hotelId: hotelId);
        await fetchHotelPhotos(hotelId: hotelId);
        await fetchHotelReviews(hotelId: hotelId);
        await fetchHotelAmenties(hotelId: hotelId);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelDetails exception ==> ${e.toString()}");
      return false;
    } finally {
      controller.isLoading(false);
      await EasyLoading.dismiss();
    }
  }

  Future fetchHotelDescription({hotelId}) async {
    // controller.isLoading(true);
    // EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    print("fetchHotelDescription");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsDescriptionEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );
      // print('response ===>>> $response');
      if (response != null) {
        print(
            "fetchHotelDescription response\n ==> ${response["descriptiontype_id"]} ");
        controller.hotelDescription.value = response["description"];

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelDescription exception ==> ${e.toString()}");
      return false;
    } finally {
      // controller.isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelReviews({hotelId}) async {
    print("fetchHotelReviews");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsReviewsEndPoint,
        {
          "hotel_id": hotelId,
          "language_filter": "en-gb",
          "locale": "en-gb",
          "sort_type": "SORT_MOST_RELEVANT",
        },
      );
      // print('response ===>>> $response');
      var _hotelReviews = HotelReviewsModel.fromJson(response);

      if (_hotelReviews.count != 0) {
        controller.isExpanded.assignAll(
            List.generate(_hotelReviews.result!.length, (_) => false));
        controller.hotelReviews.value = _hotelReviews;
        print("fetchHotelReviews ${_hotelReviews.result![0].hotelId!}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelReviews exception ==> ${e.toString()}");
      return false;
    } finally {
      // controller.isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelPhotos({hotelId}) async {
    print("fetchHotelPhotos");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsPhotosEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );

      print('response ===>>> $response');

      if (response[0]['url_1440'] != "") {
        controller.hotelPhotos.value = response;

        print("fetchHotelPhotos ${controller.hotelPhotos.value.length}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelPhotos exception ==> ${e.toString()}");
      return false;
    } finally {
      // controller.isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelAmenties({hotelId}) async {
    print("fetchHotelAmenties");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsAmentiesEndPoint,
        {
          "hotel_id": hotelId,
          "locale": "en-gb",
        },
      );

      if (response != null) {
        controller.hotelAmenties.value = response;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelAmenties exception ==> ${e.toString()}");
      return false;
    } finally {
      // controller.isLoading(false);
      // await EasyLoading.dismiss();
    }
  }
}
