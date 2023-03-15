import 'package:carousel_slider/carousel_slider.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_helper_methods.dart';

import '../../test_web_view.dart';
import 'controller/map_controller.dart';

// ignore_for_file: must_be_immutable
class MapScreen extends GetWidget<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Image.network(
                "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              bottom: size.height * 0.04,
              left: size.width * 0.04,
              right: size.width * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: getPadding(
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                        top: size.width * 0.04),
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: ColorConstant.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New york",
                              style: AppTextStyle.txtPoppinsSemiBold18,
                            ),
                            Row(
                              children: [
                                Text("Wed, 30 Jun - Thu, 31 Jun"),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Container(
                                  height: size.height * 0.02,
                                  width: size.width * 0.001,
                                  color: ColorConstant.blueGray10000,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text("10"),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.bed_icon_image,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),

                                // AppbarImage(
                                //   height: getSize(16.00),
                                //   width: getSize(16.00),
                                //   svgPath: ImageConstant.bed_icon_image,
                                //   margin: getMargin(right: 5),
                                //
                                //   // margin: getMargin(left: 4, top: 33, bottom: 13),
                                // ),
                                // Icon(
                                //   Icons.bed,
                                //   size: 16,
                                //   color: ColorConstant.orangeA200,
                                // ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text("20"),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.group_icon_image,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),

                                // Icon(
                                //   Icons.group,
                                //   size: 16,
                                //   color: ColorConstant.orangeA200,
                                // )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              width: size.width * 0.08,
                              height: size.height * 0.08,
                              margin: getMargin(bottom: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorConstant.bluegray400)),
                              child: const Center(
                                  child: Icon(
                                Icons.close_outlined,
                                size: 15,
                              ))),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 155,
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
                            color: ColorConstant.orangeA200, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.list,
                                  color: ColorConstant.white,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  "List",
                                  style: TextStyle(color: ColorConstant.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.02,
                          width: 0.5,
                          color: ColorConstant.white,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              HotelHelperMethods().filterBottomSheet();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_list_alt,
                                  color: ColorConstant.white,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(color: ColorConstant.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                      height: size.height * 0.2,
                      width: size.width,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,

                          // clipBehavior: Clip.none,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          aspectRatio: 1,
                          // enlargeCenterPage: false,
                          // padEnds:
                          //     false, // take full width, remove padding from all size
                          // onPageChanged:
                          //     (index, reason) {
                          //   controller.imgIndex.value =
                          //       index;
                          // },
                        ),
                        items: [1, 2, 3, 4]
                            .map((e) => Container(
                                  margin: getMargin(right: 5),
                                  height: 149,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: getMargin(
                                            left: size.width * 0.010,
                                            right: size.width * 0.04,
                                            top: size.height * 0.02,
                                            bottom: size.height * 0.02),
                                        height: size.height * 0.3,
                                        width: size.width * 0.30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLSA6TgXcXFRifWUQsa5_4z9AYM44Rj7Q6kQzYl_Wk&s"),
                                                fit: BoxFit.fill)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: size.width * 0.53,
                                              child: Text(
                                                "Hotel Sifat International  a",
                                                style: AppTextStyle
                                                    .txtPoppinsSemiBold16Black900,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          Row(
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: getSize(16.00),
                                                  width: getSize(16.00),
                                                  margin: getMargin(bottom: 1)),
                                              // Icon(
                                              //   Icons.add_location_sharp,
                                              //   size: 15,
                                              //   color: ColorConstant.orangeA200,
                                              // ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Container(
                                                  width: size.width * 0.2,
                                                  child: Text(
                                                    "Paris,France",
                                                    style: AppTextStyle
                                                        .txtPoppinsMedium12Black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              SizedBox(
                                                width: size.width * 0.04,
                                              ),
                                              Icon(
                                                Icons.circle,
                                                color: ColorConstant.orangeA200,
                                                size: 8,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.02,
                                              ),
                                              Container(
                                                  width: size.width * 0.2,
                                                  child: Text(
                                                    "4km away",
                                                    style: AppTextStyle
                                                        .txtPoppinsMedium12Black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  // width: size.width * 0.06,
                                                  child: Text(
                                                "6.5",
                                                style: AppTextStyle
                                                    .txtPoppinsBold14,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "Good",
                                                style: AppTextStyle
                                                    .txtPoppinsMedium12,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.16,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgStarAmber600,
                                                height: getSize(
                                                  18.09,
                                                ),
                                                width: getSize(
                                                  18.02,
                                                ),
                                                color: ColorConstant.fab005,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgStarAmber600,
                                                height: getSize(
                                                  18.09,
                                                ),
                                                width: getSize(
                                                  18.02,
                                                ),
                                                color: ColorConstant.fab005,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgStarAmber600,
                                                height: getSize(
                                                  18.09,
                                                ),
                                                width: getSize(
                                                  18.02,
                                                ),
                                                color: ColorConstant.fab005,
                                              ),
                                              CustomImageView(
                                                height: 18,
                                                width: 18,
                                                svgPath: ImageConstant
                                                    .imgStarBlueGray100,
                                                color: ColorConstant.gray200,
                                              ),
                                              CustomImageView(
                                                height: 18,
                                                width: 18,
                                                svgPath: ImageConstant
                                                    .imgStarBlueGray100,
                                                color: ColorConstant.gray200,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Container(
                                            width: size.width * 0.51,
                                            height: size.height * 0.002,
                                            color: ColorConstant.gray10001,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Container(
                                            width: size.width * 0.51,
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: size.width * 0.27,
                                                      child: Text(
                                                        "AU\$114",
                                                        style: AppTextStyle
                                                            .txtPoppinsSemiBold24blue,
                                                        // TextStyle(
                                                        //     color:
                                                        //         ColorConstant.blue500,
                                                        //     fontSize: 18),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Per night on",
                                                      style: AppTextStyle
                                                          .txtPoppinsMedium12Gray800,
                                                    )
                                                  ],
                                                ),
                                                Spacer(),
                                                Container(
                                                  // width: 80,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .orangeA20001,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          () => WebViewScreen(
                                                                title: "",
                                                              ));
                                                    },
                                                    child: Center(
                                                        child: Text(
                                                      "View Deal",
                                                      style: TextStyle(
                                                          color: ColorConstant
                                                              .white),
                                                    )),
                                                  ),
                                                )
                                                // CommonButton(
                                                //   text: "View Deals",
                                                //   height: 34,
                                                //   width: 80,
                                                // )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      )

                      // child: ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: 7,
                      //   scrollDirection: Axis.horizontal,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Container(
                      //       margin: getMargin(right: 10),
                      //       height: 149,
                      //       decoration: BoxDecoration(
                      //           color: ColorConstant.white,
                      //           borderRadius: BorderRadius.circular(16)),
                      //       child: Row(
                      //         children: [
                      //           Container(
                      //             margin: getMargin(
                      //                 left: size.width * 0.04,
                      //                 right: size.width * 0.04,
                      //                 top: size.height * 0.03,
                      //                 bottom: size.height * 0.03),
                      //             height: size.height * 0.2,
                      //             width: size.width * 0.35,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(20),
                      //                 image: DecorationImage(
                      //                     image: NetworkImage(
                      //                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLSA6TgXcXFRifWUQsa5_4z9AYM44Rj7Q6kQzYl_Wk&s"),
                      //                     fit: BoxFit.fill)),
                      //           ),
                      //           Padding(
                      //             padding: getPadding(
                      //               right: size.width * 0.05,
                      //             ),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Container(
                      //                     width: size.width * 0.45,
                      //                     child: Text(
                      //                       "Hotel Sifat International  a",
                      //                       style: AppTextStyle
                      //                           .txtPoppinsSemiBold16Black900,
                      //                       overflow: TextOverflow.ellipsis,
                      //                     )),
                      //                 Row(
                      //                   children: [
                      //                     Icon(
                      //                       Icons.add_location_sharp,
                      //                       size: 15,
                      //                       color: ColorConstant.orangeA200,
                      //                     ),
                      //                     SizedBox(
                      //                       width: size.width * 0.01,
                      //                     ),
                      //                     Container(
                      //                         width: size.width * 0.2,
                      //                         child: Text(
                      //                           "Paris,France",
                      //                           style: AppTextStyle
                      //                               .txtPoppinsMedium12Black,
                      //                           overflow: TextOverflow.ellipsis,
                      //                         )),
                      //                     SizedBox(
                      //                       width: size.width * 0.01,
                      //                     ),
                      //                     Icon(
                      //                       Icons.circle,
                      //                       color: ColorConstant.orangeA200,
                      //                       size: 8,
                      //                     ),
                      //                     SizedBox(
                      //                       width: size.width * 0.02,
                      //                     ),
                      //                     Container(
                      //                         width: size.width * 0.2,
                      //                         child: Text(
                      //                           "4km away",
                      //                           style: AppTextStyle
                      //                               .txtPoppinsMedium12Black,
                      //                           overflow: TextOverflow.ellipsis,
                      //                         ))
                      //                   ],
                      //                 ),
                      //                 Row(
                      //                   children: [
                      //                     Container(
                      //                         width: size.width * 0.06,
                      //                         child: Text(
                      //                           "6.5",
                      //                           style:
                      //                               AppTextStyle.txtPoppinsBold14,
                      //                           overflow: TextOverflow.ellipsis,
                      //                         )),
                      //                     SizedBox(
                      //                       width: size.width * 0.01,
                      //                     ),
                      //                     Text(
                      //                       "Good",
                      //                       style:
                      //                           AppTextStyle.txtPoppinsMedium12,
                      //                     ),
                      //                     SizedBox(
                      //                       width: size.width * 0.15,
                      //                     ),
                      //                     Text(
                      //                       " *****",
                      //                       style: AppTextStyle.txtPoppinsBold14,
                      //                     )
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: size.height * 0.01,
                      //                 ),
                      //                 Container(
                      //                   width: size.width * 0.45,
                      //                   height: size.height * 0.002,
                      //                   color: ColorConstant.gray10001,
                      //                 ),
                      //                 SizedBox(
                      //                   height: size.height * 0.01,
                      //                 ),
                      //                 Row(
                      //                   children: [
                      //                     Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Container(
                      //                           width: size.width * 0.2,
                      //                           child: Text(
                      //                             "AU\$114",
                      //                             style: AppTextStyle
                      //                                 .txtPoppinsSemiBold18Blue600,
                      //                             // TextStyle(
                      //                             //     color:
                      //                             //         ColorConstant.blue500,
                      //                             //     fontSize: 18),
                      //                             overflow: TextOverflow.ellipsis,
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           "Per night on",
                      //                           style: AppTextStyle
                      //                               .txtPoppinsMedium12Gray800,
                      //                         )
                      //                       ],
                      //                     ),
                      //                     SizedBox(
                      //                       width: size.width * 0.02,
                      //                     ),
                      //                     Container(
                      //                       width: 80,
                      //                       height: 34,
                      //                       decoration: BoxDecoration(
                      //                           color: ColorConstant.orangeA20001,
                      //                           borderRadius:
                      //                               BorderRadius.circular(15)),
                      //                       child: TextButton(
                      //                         onPressed: () {},
                      //                         child: Center(
                      //                             child: Text(
                      //                           "View Deal",
                      //                           style: TextStyle(
                      //                               color: ColorConstant.white),
                      //                         )),
                      //                       ),
                      //                     )
                      //                     // CommonButton(
                      //                     //   text: "View Deals",
                      //                     //   height: 34,
                      //                     //   width: 80,
                      //                     // )
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
