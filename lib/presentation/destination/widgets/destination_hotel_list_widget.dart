import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_list_container_widget.dart';

import '../../hotel/hotel.dart';

class DestinationHotelListWidget extends GetView<HomeController> {
  const DestinationHotelListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: getPadding(
            left: 20,
            top: 14,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  top: 1,
                ),
                child: Text(
                  "Recently Viewed".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold16Black900,
                ),
              ),
              // Spacer(),
              // Padding(
              //   padding: getPadding(
              //     bottom: 4,
              //   ),
              //   child: Text(
              //     "lbl_see_all".tr,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.left,
              //     style: AppTextStyle.txtPoppinsRegular14,
              //   ),
              // ),
              // CustomImageView(
              //   svgPath: ImageConstant.imgArrowright,
              //   height: getSize(
              //     22.00,
              //   ),
              //   width: getSize(
              //     22.00,
              //   ),
              //   margin: getMargin(
              //     left: 1,
              //     bottom: 3,
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: getVerticalSize(
            159.00,
          ),
          child: ListView.separated(
            padding: getPadding(
              left: 20,
              top: 5,
            ),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: getVerticalSize(
                  8.00,
                ),
              );
            },
            itemCount: 5,
            // itemCount: controller.popularHotelsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // Get.toNamed(AppRoutes.hotel_home);
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: Hotel(callFrom: 'Search'),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );

                    // controller.onTapPopularHotel(controller
                    //     .popularHotelsList.value[index].hotelId
                    //     .toString());
                  },
                  child: HomeHotelListContainerWidget(index: index));
            },
          ),
        ),
        Container(
          padding: getPadding(
            left: 20,
            top: 14,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  top: 1,
                ),
                child: Text(
                  "Recommended".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold16Black900,
                ),
              ),
              // Spacer(),
              // Padding(
              //   padding: getPadding(
              //     bottom: 4,
              //   ),
              //   child: Text(
              //     "lbl_see_all".tr,
              //     overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.left,
              //     style: AppTextStyle.txtPoppinsRegular14,
              //   ),
              // ),
              // CustomImageView(
              //   svgPath: ImageConstant.imgArrowright,
              //   height: getSize(
              //     22.00,
              //   ),
              //   width: getSize(
              //     22.00,
              //   ),
              //   margin: getMargin(
              //     left: 1,
              //     bottom: 3,
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          height: getVerticalSize(
            159.00,
          ),
          margin: getMargin(bottom: 20),
          child: ListView.separated(
            padding: getPadding(
              left: 20,
              top: 5,
            ),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: getVerticalSize(
                  8.00,
                ),
              );
            },
            itemCount: 5,
            // itemCount: controller.popularHotelsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // Get.toNamed(AppRoutes.hotel_home);
                    // Get.toNamed(AppRoutes.hotel_home);
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: Hotel(callFrom: 'Search'),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                    // controller.onTapPopularHotel(controller
                    //     .popularHotelsList.value[index].hotelId
                    //     .toString());
                  },
                  child: HomeHotelListContainerWidget(index: index));
            },
          ),
        ),
      ],
    );
  }
}
