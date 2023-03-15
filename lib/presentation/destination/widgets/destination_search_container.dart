import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/hotel/hotel_list.dart';

import '../../../core/app_export.dart';

class DestinationSearchContainer extends GetView<DestinationController> {
  const DestinationSearchContainer({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: getMargin(top: size.height * 0.015),
        width: getHorizontalSize(335.0),
        padding: getPadding(left: 16, top: 10, right: 16, bottom: 15),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("lbl_destination".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsRegular14Gray60001),
              Container(
                  margin: getMargin(top: 6),
                  padding: getPadding(all: 10),
                  decoration: AppDecoration.fillGray10001
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                  child: Row(children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgSearchYellow900,
                        height: getSize(22.00),
                        width: getSize(22.00)),
                    Padding(
                        padding: getPadding(left: 8, top: 3, right: 9),
                        child: InkWell(
                          onTap: () {
                            // controller.onTapDestinationSearch(
                            //     context: Get.context);
                          },
                          child: Text(controller.searchContainerText.value,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsRegular12Gray500),
                        ))
                  ])),
              Obx(() => Container(
                  margin: getMargin(top: 14),
                  padding: getPadding(left: 11, right: size.width * 0.08),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              controller.onTapCalendarButton();
                            },
                            child: Padding(
                                padding: getPadding(
                                  bottom: 10,
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgCalendar,
                                            height: getSize(22.00),
                                            width: getSize(22.00)),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Padding(
                                            padding: getPadding(right: 20),
                                            child: Text("lbl_dates".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle
                                                    .txtPoppinsRegular14Gray60001))
                                      ]),
                                      Padding(
                                        padding: getPadding(top: 5),
                                        child: Text(controller.range.toString(),
                                            // controller
                                            //         .dateRangePickerController
                                            //         .selectedRange.!startDate,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppTextStyle
                                                .txtPoppinsMedium14Black900),
                                      ),
                                    ]))),
                        Container(
                          height: getVerticalSize(48.00),
                          width: getHorizontalSize(1.00),
                          margin: getMargin(left: 15),
                          decoration: AppDecoration.outlineGray2001,
                        ),
                        InkWell(
                          onTap: () {
                            controller.onTapGuestButton();
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgGroup,
                                      height: getSize(22.00),
                                      width: getSize(22.00)),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Padding(
                                      padding: getPadding(),
                                      child: Text("lbl_guests".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle
                                              .txtPoppinsRegular14Gray60001))
                                ]),
                                // GestureDetector(
                                //     onTap: () {
                                //       onTapStackcreatefromframe();
                                //     },
                                //     child: Stack(
                                //         alignment:
                                //             Alignment.topLeft,
                                //         children: [
                                //           Align(
                                //               alignment: Alignment
                                //                   .centerRight,
                                //               child: Container(
                                //                   height:
                                //                       getVerticalSize(
                                //                           49.00),
                                //                   width:
                                //                       getHorizontalSize(
                                //                           151.00),
                                //                   decoration: BoxDecoration(
                                //                       border: Border(
                                //                           left: BorderSide(
                                //                               color: ColorConstant.gray200,
                                //                               width: getHorizontalSize(1.00)))))),
                                //           Align(
                                //               alignment:
                                //                   Alignment
                                //                       .topLeft,
                                //               child: )
                                //         ])),
                                Padding(
                                  padding: getPadding(top: 5),
                                  child: Obx(() {
                                    return Text(
                                        "${controller.adultCount.value} Guests, ${controller.roomsCount.value} Rooms",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle
                                            .txtPoppinsMedium14Black900);
                                  }),
                                )
                              ]),
                        )
                      ]))),
              CustomButton(
                  height: 49,
                  width: 303,
                  text: "lbl_search".tr,
                  margin: getMargin(top: 18),
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: HotelList(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );

                    // controller.fetchHotels().then((value) {
                    //   print("Pass");
                    // });
                    // Get.toNamed(AppRoutes.hotel_list);
                  })
            ]));
  }
}
