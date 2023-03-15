import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/repository/destination_repository.dart';

class DestinationController extends GetxController {
  late GoogleMapController googleMapController;
  var latitude = "".obs;
  var longitude = "".obs;
  var address = "".obs;
  var searchContainerText = "Where would you like to go?".obs;
  var args = DateRangePickerSelectionChangedArgs;
  var isLoading = true.obs;
  var dateTimeRange = "".obs;
  var selectedDate = ''.obs;
  var startDate = "".obs;
  var endDate = "".obs;
  var dateCount = ''.obs;
  var range = ''.obs;
  var rangeCount = ''.obs;
  var adultCount = 0.obs;
  var childrenCount = 0.obs;
  var roomsCount = 0.obs;
  var isChildVisibile = false.obs;
  var dropDownSelected = "1 Year".obs;
  var dropDownItems = ["1 Year", "2 Year", "3 Year"].obs;
  // final destinationRepository = DestinationRepository();

  initialDateRange() {
    print("initialDateRange");
    startDate.value = DateTime.now().format('d MMM').toString();
    endDate.value =
        DateTime.now().add(const Duration(days: 2)).format('d MMM').toString();
    print("initialDateRange ${startDate.value} - ${endDate.value}");
    range.value = "${startDate.value}-${endDate.value}";
  }

  onslectedDate(String value) {
    dateTimeRange.value = value;
  }

  onselectedDate(String value) {
    selectedDate.value = value;
  }

  void selectedvalue(String value) {
    dropDownSelected.value = value;
  }

  //Adult Count
  increaseAdultCount() {
    adultCount.value >= 0 ? adultCount.value++ : adultCount.value == 0;
  }

  deccreaseAdultCount() {
    adultCount.value > 0 ? adultCount.value-- : adultCount.value == 0;
  }
  //Children Count

  increaseChildrenCount() {
    childrenCount.value >= 0 ? childrenCount.value++ : childrenCount.value == 0;
  }

  deccreaseChildrenCount() {
    childrenCount.value > 0 ? childrenCount.value-- : childrenCount.value == 0;
  }
  //Rooms Count

  increaseRoomsCount() {
    roomsCount.value >= 0 ? roomsCount.value++ : roomsCount.value == 0;
  }

  deccreaseRoomsCount() {
    roomsCount.value > 0 ? roomsCount.value-- : roomsCount.value == 0;
  }

  onTapCalendarButton() {
    print("onTapCalendarButton");
    DestinationRepository().openCalendar();
    print(range.value);
  }

  onTapGuestButton() {
    print("onTapGuestButton");
    DestinationRepository().openGuestBottomSheet();
    print(range.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialDateRange();
    // googleMapController;
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapDestinationSearch({context}) {
    print("onTapDestinationSearch");
    DestinationRepository().searchLocationByName(context: context);
  }
  // fetchHotels() async {
  //   /*Working but gives zero results*/
  //   isLoading(true);
  //   try {
  //     var response = await ApiClient().callPostApi({}, "");
  //     // var url =
  //     //     'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&type=lodging&radius=1500&key=YOUR_API_KEY';
  //     // var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       // var jsonData = json.decode(response.body);
  //       // List<Hotel> hotelsData = [];
  //       // print("JsonData === $jsonData");
  //       print("JsonData === $response");
  //       // for (var result in jsonData['results']) {
  //       //   hotelsData.add(Hotel(
  //       //     name: result['name'],
  //       //     vicinity: result['vicinity'],
  //       //     latitude: result['geometry']['location']['lat'],
  //       //     longitude: result['geometry']['location']['lng'],
  //       //   ));
  //       // }
  //       // hotels.assignAll(hotelsData);
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
