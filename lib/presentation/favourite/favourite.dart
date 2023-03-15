import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/favourite/controller/favourite_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

import '../../core/utils/static_models.dart';
import 'favourite_item.dart';

class Favourite extends GetWidget<FavouriteController> {
  String? callFrom;
  Favourite({this.callFrom});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: ColorConstant.yellow900,
              height: getVerticalSize(100.00),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   margin: getMargin(left: 20),
                    // ),
                    AppbarImage(
                      height: getSize(24.00),
                      width: getSize(24.00),
                      svgPath: ImageConstant.imgArrowleft,
                      color: ColorConstant.whiteA700,
                      margin: getMargin(
                        left: 20,
                      ),
                      onTap: () {
                        final _controller = Get.find<SearchTabBarController>();
                        _controller.tabController.index = 1;
                        _controller.index.value = 1;

                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: SearchTabBar(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                    AppbarSubtitle(
                        margin: getMargin(right: 0), text: "lbl_favorite".tr),
                    Container(
                      margin: getMargin(right: 44),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Expanded(
              child: Container(
                  // margin: getMargin(top: 100),
                  width: size.width,
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list_blogs.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Get.toNamed(AppRoutes.favourite_details);
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: FavouriteItem(
                                          data: list_blogs[index]),
                                      withNavBar:
                                          true, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  child: Container(
                                    width: size.width,
                                    // width: getHorizontalSize(335.00),
                                    margin: getMargin(
                                        left: 0, bottom: 10, right: 0),
                                    decoration:
                                        AppDecoration.fillWhiteA700.copyWith(
                                            // borderRadius: BorderRadiusStyle
                                            //     .roundedBorder16,
                                            ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            // imagePath: ImageConstant
                                            //     .imgRectangle23908147x335,

                                            imagePath: list_blogs[index].image,
                                            height: getVerticalSize(
                                              // 280.00
                                              147.00,
                                            ),
                                            width: size.width,
                                            radius: BorderRadius.only(
                                                // topLeft: Radius.circular(
                                                //     getHorizontalSize(8.00)),
                                                // topRight: Radius.circular(
                                                //   getHorizontalSize(8.00),
                                                // ),
                                                )),
                                        Padding(
                                            padding: getPadding(
                                                left: 12, top: 13, right: 12),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "msg_jaisalmer_travel"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppTextStyle
                                                                .txtPoppinsSemiBold16),
                                                        Row(children: [
                                                          // CustomImageView(
                                                          //     imagePath:
                                                          //         ImageConstant
                                                          //             .imgEllipse1271,
                                                          //     height: getSize(
                                                          //         18.00),
                                                          //     width: getSize(
                                                          //         18.00),
                                                          //     radius: BorderRadius
                                                          //         .circular(
                                                          //             getHorizontalSize(
                                                          //                 9.00))),
                                                          // Padding(
                                                          //     padding:
                                                          //         getPadding(
                                                          //             left: 6,
                                                          //             bottom:
                                                          //                 1),
                                                          //     child: Text(
                                                          //         "lbl_sofia_jeans"
                                                          //             .tr,
                                                          //         overflow:
                                                          //             TextOverflow
                                                          //                 .ellipsis,
                                                          //         textAlign:
                                                          //             TextAlign
                                                          //                 .left,
                                                          //         style: AppTextStyle
                                                          //             .txtPoppinsMedium12)),

                                                          Padding(
                                                            padding: getPadding(
                                                              left: 2,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              // "lbl_22_jan_2023".tr,
                                                              list_blogs[index]
                                                                  .date!,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppTextStyle
                                                                  .txtPoppinsMedium12Gray600,
                                                            ),
                                                          ),

                                                          Padding(
                                                            padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              "Reading Time",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppTextStyle
                                                                  .txtPoppinsMedium12Black,
                                                            ),
                                                          ),

                                                          Padding(
                                                            padding: getPadding(
                                                              left: 6,
                                                              top: 1,
                                                            ),
                                                            child: Text(
                                                              list_blogs[index]
                                                                  .reading_time!,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppTextStyle
                                                                  .txtPoppinsSemiBold12OrangeA20001,
                                                            ),
                                                          ),
                                                        ])
                                                      ]),
                                                  CustomIconButton(
                                                      height: 38,
                                                      width: 38,
                                                      margin:
                                                          getMargin(bottom: 2),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgFavorite))
                                                ])),
                                        Container(
                                            // width: getHorizontalSize(307.00),
                                            margin: getMargin(
                                                top: 9,
                                                left: 12,
                                                right: 12,
                                                bottom: 10),
                                            child: Text(
                                                // "msg_my_holidays_in_rajasthan".tr,
                                                list_blogs[index].description!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle
                                                    .txtPoppinsRegular12))
                                      ],
                                    ),
                                  ),
                                ),
                                // Spacer()
                              ]);
                        }),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft5() {
    Get.back();
  }
}
