import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/widgets/destination_hotel_list_widget.dart';
import 'package:trippinr/presentation/destination/widgets/destination_search_container.dart';

import 'controller/destination_controller.dart';

// ignore_for_file: must_be_immutable
class Destination extends GetView<DestinationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DestinationSearchContainer(controller: controller),
              Expanded(
                  child:
                      SingleChildScrollView(child: DestinationHotelListWidget())
                  // SingleChildScrollView(
                  //   // scrollDirection: Axis.vertical,
                  //   physics: AlwaysScrollableScrollPhysics(),
                  //   child: Container(
                  //     margin: getMargin(bottom: 10),
                  //     color: ColorConstant.gray100,
                  //     child: Column(
                  //       children: [
                  //         // ListView.builder(
                  //         //     shrinkWrap: true,
                  //         //     physics: NeverScrollableScrollPhysics(),
                  //         //     itemCount: 5,
                  //         //     itemBuilder: (context, index) {
                  //         //       return DestinationHotelList();
                  //         //     }),
                  //         DestinationHotelList()
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  )
            ],
          ),
        ),
      ),
    );
  }

  onTapSearchOne() {
    // Get.toNamed(AppRoutes.hotelListPageScreen);
  }
}
