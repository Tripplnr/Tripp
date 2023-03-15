import 'package:carousel_slider/carousel_slider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_deals.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_details.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_photos.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_reviews.dart';

class Hotel extends StatelessWidget {
  HotelController controller = Get.put(HotelController(), permanent: false);

  String callFrom;
  Hotel({required this.callFrom});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          padding: getPadding(left: 10, right: 10, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  // await Get.delete<HotelController>();
                  // Get.back();
                  Navigator.pop(context);
                },
                child: CustomImageView(
                  svgPath: ImageConstant.imgArrowleft,
                  color: ColorConstant.black,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Capital O Hotel Ocean',
                    // controller.hotelDetails.value.name.toString(),
                    style: AppTextStyle.txtPoppinsSemiBold18Black26092B,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '10 Mar - 11 Mar',
                        // controller.hotelDetails.value.name.toString(),
                        style: AppTextStyle.txtPoppinsMedium12Yellow900,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 3.0, right: 3, bottom: 5),
                        child: Text('.',
                            // controller.hotelDetails.value.name.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        '2 Guests, 1 Room',
                        // controller.hotelDetails.value.name.toString(),
                        style: AppTextStyle.txtPoppinsMedium12Yellow900,
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  _onShare(context);
                },
                child: CustomImageView(
                  svgPath: ImageConstant.imgShare,
                  color: ColorConstant.black,
                  // color: ColorConstant.whiteA700,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: ColorConstant.gray100,
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: size.height,
            child: SingleChildScrollView(
              child: Container(
                height: size.height,
                child: Column(
                  children: [
                    // SafeArea(
                    //   child: Container(
                    //     padding: getPadding(left: 20, right: 20, top: 5),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         InkWell(
                    //           onTap: () async {
                    //             // await Get.delete<HotelController>();
                    //             Get.back();
                    //           },
                    //           child: CustomImageView(
                    //             svgPath: ImageConstant.imgArrowleft,
                    //             color: ColorConstant.whiteA700,
                    //           ),
                    //         ),
                    //         CustomImageView(
                    //           svgPath: ImageConstant.imgShare,
                    //           color: ColorConstant.whiteA700,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Stack(
                      children: [
                        Container(
                          height: getVerticalSize(350),
                          // height: getVerticalSize(266),
                          width: size.width,
                          child:
                              // CarouselSlider.builder(
                              //   itemCount: controller.hotelPhotos.value.length,
                              //   itemBuilder:
                              //       (BuildContext? context, int? index, int pageIndex) {
                              //     // controller.imgIndex.value = pageIndex;
                              //     final item = controller.hotelPhotos.value[index!];
                              //     return Container(
                              //       child: Image.network(
                              //         item['url_max'],
                              //         fit: BoxFit.cover,
                              //         width: size.width,
                              //       ),
                              //     );
                              //   },
                              //   options: CarouselOptions(
                              //     viewportFraction: 1,
                              //     autoPlay: true,
                              //
                              //     // clipBehavior: Clip.none,
                              //
                              //     aspectRatio: 1,
                              //     // enlargeCenterPage: false,
                              //     // padEnds:
                              //     //     false, // take full width, remove padding from all size
                              //     onPageChanged: (index, reason) {
                              //       controller.imgIndex.value = index;
                              //     },
                              //   ),
                              // ),
                              CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,

                              // clipBehavior: Clip.none,

                              aspectRatio: 1,
                              // enlargeCenterPage: false,
                              // padEnds:
                              //     false, // take full width, remove padding from all size
                              onPageChanged: (index, reason) {
                                controller.imgIndex.value = index;
                              },
                            ),
                            // items: [
                            //   Container(
                            //     width: size.width,
                            //     height: height * 0.3,
                            //     child: ListView.builder(
                            //       shrinkWrap: true,
                            //       physics: AlwaysScrollableScrollPhysics(),
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) {
                            //         Image.network(
                            //           controller.hotelPhotos.value[index]['url_max'],
                            //           fit: BoxFit.cover,
                            //           width: size.width,
                            //         );
                            //       },
                            //     ),
                            //   )
                            // ],
                            items: controller.imgList
                                .map(
                                  (e) => Image.network(
                                    e,
                                    fit: BoxFit.cover,
                                    width: size.width,
                                    // height: size.height * 0.3,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          right: 20,
                          child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: controller.imgList.map((i) {
                                // children: controller.hotelPhotos.value.take(5).map((i) {
                                int index = controller.imgList.indexOf(i);
                                // int index = controller.hotelPhotos.value.indexOf(i);
                                return Container(
                                  height: 10,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    height:
                                        controller.imgIndex == index ? 10 : 8.0,
                                    width:
                                        controller.imgIndex == index ? 12 : 8.0,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        controller.imgIndex == index
                                            ? BoxShadow(
                                                color: Color(0XFF2FB7B2)
                                                    .withOpacity(0.72),
                                                blurRadius: 4.0,
                                                spreadRadius: 1.0,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                              )
                                            : BoxShadow(
                                                color: Colors.transparent,
                                              )
                                      ],
                                      shape: BoxShape.circle,
                                      color: controller.imgIndex == index
                                          ? Colors.orange
                                          : Color(0XFFEAEAEA),
                                    ),
                                  ),
                                );
                              }).toList()),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        // margin: getMargin(top: 250),
                        padding: getPadding(left: 20, right: 20, top: 10),
                        height: size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              // topLeft: Radius.circular(30),
                              // topRight: Radius.circular(30),
                              ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Capital O Hotel Ocean',
                                // controller.hotelDetails.value.name.toString(),
                                style: AppTextStyle
                                    .txtPoppinsSemiBold18Black26092B,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getSize(
                                    13.5,
                                  ),
                                  width: getSize(
                                    16.3,
                                  ),
                                  color: ColorConstant.yellow900,
                                ),
                                SizedBox(
                                  width: size.width * 0.005,
                                ),
                                Text(
                                  // "${controller.hotelDetails.value.city} ${controller.hotelDetails.value.country}",
                                  'Milan, Italy ',
                                  style: AppTextStyle.txtPoppinsMedium12Black,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStarAmber600,
                                      height: getSize(
                                        18.09,
                                      ),
                                      width: getSize(
                                        19.02,
                                      ),
                                      color: ColorConstant.fab005,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStarAmber600,
                                      height: getSize(
                                        18.09,
                                      ),
                                      width: getSize(
                                        19.02,
                                      ),
                                      color: ColorConstant.fab005,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStarAmber600,
                                      height: getSize(
                                        18.09,
                                      ),
                                      width: getSize(
                                        19.02,
                                      ),
                                      color: ColorConstant.fab005,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStarAmber600,
                                      height: getSize(
                                        18.09,
                                      ),
                                      width: getSize(
                                        19.02,
                                      ),
                                      color: ColorConstant.fab005,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgStarBlueGray100,
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
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  // controller.hotelDetails.value.reviewScore.toString(),
                                  '6.5 ',
                                  style: AppTextStyle
                                      .txtPoppinsSemiBold14Gray90001,
                                ),
                                Text(
                                  // " ${controller.hotelDetails.value.reviewScoreWord.toString()}",
                                  //
                                  ' Good',
                                  style: AppTextStyle.txtPoppinsRegular12,
                                ),
                              ],
                            ),
                            callFrom == "Home"
                                ? Container()
                                : Container(
                                    margin: getMargin(top: 14),
                                    padding: getPadding(
                                        left: 20,
                                        right: 30,
                                        top: 20,
                                        bottom: 20),
                                    decoration: BoxDecoration(
                                        color: ColorConstant.orange5001,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgCalendar,
                                                    height: getSize(16.00),
                                                    width: getSize(16.00)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text("lbl_dates".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular14orangeA200))
                                              ]),
                                              Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Text(
                                                      "lbl_28_jan_29_jan".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppTextStyle
                                                          .txtPoppinsMedium14Black900))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: getMargin(left: 40),
                                          height: size.height * 0.055,
                                          color: ColorConstant.orangeA300,
                                          width: 0.7,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgGroup,
                                                    height: getSize(16.00),
                                                    width: getSize(16.00)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text("lbl_guests".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular14orangeA200))
                                              ]),
                                              Padding(
                                                  padding: getPadding(top: 5),
                                                  child: Text(
                                                      "msg_2_guests_1_room".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppTextStyle
                                                          .txtPoppinsMedium14Black900))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Container(
                              width: size.width,
                              height: getVerticalSize(44),
                              margin: getMargin(
                                  left: 5, top: 5, right: 5, bottom: 5),
                              child: TabBar(
                                controller: controller.tabController,
                                onTap: (index) {
                                  print(
                                      'Cuurent Screen ==> ${controller.index.value}');
                                  if (index != controller.index.value) {
                                    controller.index.value = index;
                                  } else {
                                    // ShowToast.show(msg: 'Please add business first!');
                                    print(
                                        'Cuurent Screen ==> ${controller.index.value}');
                                  }
                                },
                                labelStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                tabs: [
                                  Tab(text: "lbl_deals".tr),
                                  Tab(text: "lbl_details".tr),
                                  Tab(text: "lbl_photos".tr),
                                  Tab(text: "lbl_reviews".tr),
                                ],
                                labelColor: ColorConstant.yellow900,
                                unselectedLabelColor: ColorConstant.gray50001,
                                indicatorColor: ColorConstant.yellow900,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: controller.tabController,
                                children: [
                                  HotelDealsPage(),
                                  HotalDetailsPage(),
                                  HotelPhotos(),
                                  HotalReviewPage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share("text",
        subject: "link",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
