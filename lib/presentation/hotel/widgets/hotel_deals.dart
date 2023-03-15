import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

// ignore_for_file: must_be_immutable
class HotelDealsPage extends GetView<HotelController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("msg_our_recommended".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppTextStyle.txtPoppinsSemiBold16Black900),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: getVerticalSize(93),
                          margin: getMargin(top: 9),
                          padding: getPadding(left: 12, right: 12),
                          decoration: AppDecoration.outlineLightblue100
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_makemytrip".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle
                                              .txtPoppinsSemiBold16Black900),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text("msg_classic_room_pay".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle
                                              .txtPoppinsRegular12Gray50001),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Text("msg_free_cancellation".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle
                                              .txtPoppinsMedium12Blue600)
                                    ]),
                                Row(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("lbl_au_114".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppTextStyle
                                                  .txtPoppinsSemiBold26),
                                          Text("lbl_per_night".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppTextStyle
                                                  .txtPoppinsSemiBold12Blue500)
                                        ]),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    CustomImageView(
                                      svgPath:
                                          ImageConstant.imgArrowrightBlue600,
                                      height: getSize(24.00),
                                      width: getSize(24.00),
                                    ),
                                  ],
                                )
                              ]))),
                  Padding(
                      padding: getPadding(top: 15),
                      child: Text("lbl_more_deals".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppTextStyle.txtPoppinsSemiBold16Black900)),
                  Container(
                      height: getVerticalSize(93),
                      margin: getMargin(top: 9),
                      padding: getPadding(left: 12, right: 12),
                      decoration: AppDecoration.outlineGray40066.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder9),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("lbl_travel_com".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .txtPoppinsSemiBold16Black900),
                                  Text("msg_classic_room_pay".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .txtPoppinsRegular12Gray50001),
                                  Text("msg_classic_room_pay".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .txtPoppinsRegular12Gray50001)
                                ]),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("lbl_au_90".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppTextStyle
                                                .txtPoppinsSemiBold24),
                                        Text(
                                          "Per Night",
                                          style: AppTextStyle
                                              .txtPoppinsSemiBold12OrangeA20001,
                                        ),
                                        Text(
                                          "Book Now",
                                          style: AppTextStyle
                                              .txtPoppinsSemiBold12OrangeA20001,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: getSize(24.00),
                                      width: getSize(24.00),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ])),
                  SizedBox(
                    width: 30,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
