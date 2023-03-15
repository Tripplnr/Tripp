import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/repository/destination_repository.dart';
import 'package:trippinr/presentation/hotel/hotel.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_helper_methods.dart';

import 'controller/hotel_controller.dart';

class HotelList extends GetWidget<HotelController> {
  HotelHelperMethods _helperMethods = HotelHelperMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray100,
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(120.00),
              width: size.width,
              color: ColorConstant.yellow900,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppbarImage(
                          height: getSize(24.00),
                          width: getSize(24.00),
                          svgPath: ImageConstant.imgArrowleft,
                          color: ColorConstant.whiteA700,
                          margin: getMargin(
                            left: 20,
                          ),
                          onTap: () {
                            onTapArrowleft2(context);
                          }),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppbarSubtitle(
                            text: "lbl_new_york".tr,
                            // margin: getMargin(right: 101, bottom: 19)
                          ),
                          Row(
                            children: [
                              AppbarSubtitle2(
                                text: "msg_wed_30_jun_thu".tr,
                                // margin: getMargin(top: 22),
                              ),
                              Container(
                                width: 1,
                                height: 10,
                                margin: getMargin(left: 5, right: 5),
                                color: Colors.white,
                              ),
                              AppbarSubtitle2(
                                text: "lbl_1".tr,
                                margin: getMargin(right: 5),
                              ),
                              AppbarImage(
                                height: getSize(16.00),
                                width: getSize(16.00),
                                svgPath: ImageConstant.imgRemixiconslin,
                                margin: getMargin(right: 5),

                                // margin: getMargin(left: 4, top: 33, bottom: 13),
                              ),
                              AppbarSubtitle2(
                                text: "lbl_2".tr, margin: getMargin(right: 5),

                                // margin: getMargin(left: 10, top: 30, bottom: 11),
                              ),
                              AppbarImage(
                                height: getSize(16.00),
                                width: getSize(16.00),
                                margin: getMargin(right: 5),

                                svgPath: ImageConstant.imgUserWhiteA700,
                                // margin: getMargin(left: 4, top: 33, bottom: 13),
                              ),
                            ],
                          )
                        ]),
                    AppbarImage(
                      height: getSize(20.00),
                      width: getSize(20.00),
                      svgPath: ImageConstant.imgEdit,
                      margin: getMargin(
                        right: 20,
                      ),
                      onTap: () {
                        onTapArrowleft2(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
                width: size.width,
                padding: getPadding(left: 68, top: 17, right: 68, bottom: 17),
                decoration: AppDecoration.fillWhiteA700,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _helperMethods.filterBottomSheet();

                            print("Price");
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgfilterOrange,
                                    height: getSize(20.00),
                                    width: getSize(20.00),
                                    margin: getMargin(top: 1, bottom: 1)),
                                Padding(
                                    padding: getPadding(left: 2, bottom: 1),
                                    child: Text("lbl_filter".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle
                                            .txtPoppinsMedium14Black90002)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: getVerticalSize(22.00),
                          width: getHorizontalSize(1.00),
                          decoration:
                              BoxDecoration(color: ColorConstant.blueGray100)),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _helperMethods.sortBottomSheet();
                            print("Sort");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgAirplane,
                                  height: getSize(20.00),
                                  width: getSize(20.00),
                                  margin: getMargin(top: 1, bottom: 1)),
                              Padding(
                                  padding:
                                      getPadding(left: 2, right: 3, bottom: 1),
                                  child: Text("lbl_sort".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .txtPoppinsMedium14Black90002)),
                            ],
                          ),
                        ),
                      )
                    ])),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.imgList.length,
                        itemBuilder: (context, indexx) {
                          return Padding(
                            padding: getPadding(left: 0, top: 5, right: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 440,
                                  // getVerticalSize(565.00),
                                  // width: getHorizontalSize(335.00),
                                  padding: getPadding(
                                    left: 0,
                                    top: 0,
                                    right: 0,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.white,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Obx(() {
                                      //   return Stack(
                                      //     alignment: Alignment.topCenter,
                                      //     children: [
                                      //       ClipRRect(
                                      //         borderRadius:
                                      //             BorderRadius.circular(0),
                                      //         child: Container(
                                      //             height:
                                      //                 getVerticalSize(250.00),
                                      //             width: size.width,
                                      //             // getHorizontalSize(311.00),
                                      //             decoration: BoxDecoration(
                                      //               // color: ColorConstant.white,
                                      //               color: ColorConstant.black,
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       0),
                                      //             ),
                                      //             child: CarouselSlider(
                                      //               options: CarouselOptions(
                                      //                 viewportFraction: 1,
                                      //                 autoPlay: true,
                                      //                 // clipBehavior: Clip.none,
                                      //
                                      //                 aspectRatio: 1,
                                      //                 // enlargeCenterPage: false,
                                      //                 // padEnds:
                                      //                 //     false, // take full width, remove padding from all size
                                      //                 onPageChanged:
                                      //                     (index, reason) {
                                      //                   controller.imgIndex
                                      //                       .value = index;
                                      //                 },
                                      //               ),
                                      //               items: controller.imgList
                                      //                   .map(
                                      //                     (e) => Image.network(
                                      //                       e,
                                      //                       fit: BoxFit.cover,
                                      //                       width: size.width,
                                      //                       // height: size.height * 0.3,
                                      //                     ),
                                      //                   )
                                      //                   .toList(),
                                      //             )),
                                      //       ),
                                      //       Positioned(
                                      //         bottom: 10,
                                      //         left: 0,
                                      //         right: 0,
                                      //         child: Row(
                                      //             // crossAxisAlignment: CrossAxisAlignment.end,
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.center,
                                      //             children: controller.imgList
                                      //                 .map((i) {
                                      //               int index = controller
                                      //                   .imgList
                                      //                   .indexOf(i);
                                      //               return Container(
                                      //                 height: 10,
                                      //                 child: AnimatedContainer(
                                      //                   duration: Duration(
                                      //                       milliseconds: 150),
                                      //                   margin: EdgeInsets
                                      //                       .symmetric(
                                      //                           horizontal:
                                      //                               4.0),
                                      //                   height: controller
                                      //                               .imgIndex ==
                                      //                           index
                                      //                       ? 10
                                      //                       : 8.0,
                                      //                   width: controller
                                      //                               .imgIndex ==
                                      //                           index
                                      //                       ? 12
                                      //                       : 8.0,
                                      //                   decoration:
                                      //                       BoxDecoration(
                                      //                     boxShadow: [
                                      //                       controller.imgIndex ==
                                      //                               index
                                      //                           ? BoxShadow(
                                      //                               color: Color(
                                      //                                       0XFF2FB7B2)
                                      //                                   .withOpacity(
                                      //                                       0.72),
                                      //                               blurRadius:
                                      //                                   4.0,
                                      //                               spreadRadius:
                                      //                                   1.0,
                                      //                               offset:
                                      //                                   Offset(
                                      //                                 0.0,
                                      //                                 0.0,
                                      //                               ),
                                      //                             )
                                      //                           : BoxShadow(
                                      //                               color: Colors
                                      //                                   .transparent,
                                      //                             )
                                      //                     ],
                                      //                     shape:
                                      //                         BoxShape.circle,
                                      //                     color: controller
                                      //                                 .imgIndex ==
                                      //                             index
                                      //                         ? Colors.orange
                                      //                         : Color(
                                      //                             0XFFEAEAEA),
                                      //                   ),
                                      //                 ),
                                      //               );
                                      //             }).toList()),
                                      //       ),
                                      //     ],
                                      //   );
                                      // }),
                                      InkWell(
                                        onTap: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: Hotel(callFrom: 'Search'),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Container(
                                          height: 260,
                                          // height: 350,
                                          child: Image.network(
                                            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                                            fit: BoxFit.cover,
                                            width: size.width,
                                            // height: size.height * 0.3,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        padding:
                                            getPadding(left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                PersistentNavBarNavigator
                                                    .pushNewScreen(
                                                  context,
                                                  screen:
                                                      Hotel(callFrom: 'Search'),
                                                  withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              child: Text(
                                                'Capital O Hotel Ocean',
                                                style: AppTextStyle
                                                    .txtPoppinsSemiBold18Black26092B,
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: getSize(
                                                    13.5,
                                                  ),
                                                  width: getSize(
                                                    16.3,
                                                  ),
                                                  color:
                                                      ColorConstant.yellow900,
                                                ),
                                                Text(
                                                  'Milan, Italy ',
                                                  style: AppTextStyle
                                                      .txtPoppinsMedium12Black,
                                                ),
                                                Text(
                                                  '• ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.yellow900,
                                                    fontSize: getFontSize(
                                                      24,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  '4km away',
                                                  style: AppTextStyle
                                                      .txtPoppinsMedium12Gray700,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '6.5 ',
                                                  style: AppTextStyle
                                                      .txtPoppinsSemiBold14Gray90001,
                                                ),
                                                Text(
                                                  ' Good',
                                                  style: AppTextStyle
                                                      .txtPoppinsRegular12,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStarAmber600,
                                                      height: getSize(
                                                        18.09,
                                                      ),
                                                      width: getSize(
                                                        19.02,
                                                      ),
                                                      color:
                                                          ColorConstant.fab005,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStarAmber600,
                                                      height: getSize(
                                                        18.09,
                                                      ),
                                                      width: getSize(
                                                        19.02,
                                                      ),
                                                      color:
                                                          ColorConstant.fab005,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStarAmber600,
                                                      height: getSize(
                                                        18.09,
                                                      ),
                                                      width: getSize(
                                                        19.02,
                                                      ),
                                                      color:
                                                          ColorConstant.fab005,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStarAmber600,
                                                      height: getSize(
                                                        18.09,
                                                      ),
                                                      width: getSize(
                                                        19.02,
                                                      ),
                                                      color:
                                                          ColorConstant.fab005,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStarBlueGray100,
                                                      height: getSize(
                                                        18.09,
                                                      ),
                                                      width: getSize(
                                                        19.02,
                                                      ),
                                                      // color: ColorConstant.fab005,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 7,
                                            ),
                                            Container(
                                              height: 1,
                                              color: ColorConstant.gray200,
                                            ),
                                            Container(
                                              height: 7,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'AU\$114',
                                                      style: AppTextStyle
                                                          .txtPoppinsSemiBold24blue,
                                                    ),
                                                    Text(
                                                      'Per night on',
                                                      style: AppTextStyle
                                                          .txtPoppinsMedium12Gray50001,
                                                    ),
                                                  ],
                                                ),
                                                CustomButton(
                                                  onTap: () {
                                                    // PersistentNavBarNavigator
                                                    //     .pushNewScreen(
                                                    //   context,
                                                    //   screen: Hotel(
                                                    //       callFrom: 'Search'),
                                                    //   withNavBar: true,
                                                    //   pageTransitionAnimation:
                                                    //       PageTransitionAnimation
                                                    //           .cupertino,
                                                    // );
                                                    DestinationRepository()
                                                        .openViewDealsBottomSheet(
                                                            context);
                                                    // Get.to(() => WebViewScreen(
                                                    //       title: "",
                                                    //     ));
                                                  },
                                                  // padding: getPadding(
                                                  //     left: 5, right: 5),
                                                  text: 'View Deals',
                                                  height: 45,
                                                  width: 110,
                                                  fontStyle: ButtonFontStyle
                                                      .PoppinsMedium15,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 18,
                    left: 10,
                    right: 10,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 41,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.black9004c,
                                spreadRadius: getHorizontalSize(
                                  0.50,
                                ),
                                blurRadius: getHorizontalSize(
                                  8.00,
                                ),
                                offset: Offset(
                                  0,
                                  7,
                                ),
                              ),
                            ],
                            color: ColorConstant.black,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: ColorConstant.yellow900, width: 2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.map);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: ColorConstant.white,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text(
                                      "Map",
                                      style:
                                          TextStyle(color: ColorConstant.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Container(
                            //   height: size.height * 0.02,
                            //   width: 0.5,
                            //   color: ColorConstant.white,
                            // ),
                            // Expanded(
                            //   child: InkWell(
                            //     onTap: () {
                            //       HotelHelperMethods().filterBottomSheet();
                            //     },
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Icon(
                            //           Icons.filter_list_alt,
                            //           color: ColorConstant.white,
                            //         ),
                            //         SizedBox(
                            //           width: size.width * 0.01,
                            //         ),
                            //         Text(
                            //           "Filter",
                            //           style:
                            //               TextStyle(color: ColorConstant.white),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapArrowleft2(context) {
    // Get.offAndToNamed(AppRoutes.search_tab_bar);
    // Get.back();
    Navigator.pop(context);
  }
}
