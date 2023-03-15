import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';

import '../../core/utils/static_models.dart';
import 'controller/favourite_controller.dart';

class FavouriteItem extends GetWidget<FavouriteController> {
  StaticBlogModel? data;

  FavouriteItem({this.data});

  final authController = Get.find<AuthController>();
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  @override
  Widget build(BuildContext context) {
    // controller.popupScreen();

    // : controller.popupScreen(context);

    authController.isLoggedIn.value
        ? null
        : Future.delayed(Duration(seconds: 3), () async {
            await _bottomNavBarHelperMethods.loginPopUp(context);
          });

    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionButtonScreen(),

          backgroundColor: ColorConstant.gray100,
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: getVerticalSize(300.00),
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        // ImageConstant.imgRectangle23908147x335,
                        data!.image!,
                      ))),
              child: SafeArea(
                child: CustomImageView(
                    svgPath: ImageConstant.imgArrowleft,
                    color: ColorConstant.white,
                    height: getSize(24.00),
                    width: getSize(24.00),
                    alignment: Alignment.topLeft,
                    margin: getMargin(left: 20, top: 14),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            Padding(
                padding: getPadding(left: 20, top: 19, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width * 0.75,
                              child: Text(
                                  // "msg_jaisalmer_travel2".tr,
                                  data!.title!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: AppTextStyle.txtPoppinsBold20),
                            ),
                            Padding(
                                padding: getPadding(top: 2),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // CustomImageView(
                                      //     imagePath:
                                      //         ImageConstant.imgEllipse1271,
                                      //     height: getSize(20.00),
                                      //     width: getSize(20.00),
                                      //     radius: BorderRadius.circular(
                                      //         getHorizontalSize(10.00)),
                                      //     margin: getMargin(bottom: 1)),
                                      // Padding(
                                      //     padding:
                                      //         getPadding(left: 6, bottom: 1),
                                      //     child: Text("lbl_sofia_jeans".tr,
                                      //         overflow: TextOverflow.ellipsis,
                                      //         textAlign: TextAlign.left,
                                      //         style: AppTextStyle
                                      //             .txtPoppinsMedium13Black90001)),
                                      // Container(
                                      //     height: getSize(4.00),
                                      //     width: getSize(4.00),
                                      //     margin: getMargin(
                                      //         left: 6, top: 8, bottom: 9),
                                      //     decoration: BoxDecoration(
                                      //         color: ColorConstant.yellow900,
                                      //         borderRadius:
                                      //             BorderRadius.circular(
                                      //                 getHorizontalSize(
                                      //                     2.00)))),
                                      // Padding(
                                      //     padding: getPadding(left: 6, top: 1),
                                      //     child: Text("lbl_22_jan_2023".tr,
                                      //         overflow: TextOverflow.ellipsis,
                                      //         textAlign: TextAlign.left,
                                      //         style: AppTextStyle
                                      //             .txtPoppinsMedium13Gray600))

                                      Padding(
                                        padding: getPadding(
                                          left: 3,
                                          top: 1,
                                        ),
                                        child: Text(
                                          // "lbl_22_jan_2023".tr,
                                          data!.date!,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
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
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
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
                                          data!.reading_time!,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle
                                              .txtPoppinsSemiBold12OrangeA20001,
                                        ),
                                      ),
                                    ]))
                          ]),
                      CustomIconButton(
                          onTap: authController.isLoggedIn.value
                              ? null
                              : () {
                                  Future.delayed(Duration(seconds: 3),
                                      () async {
                                    await _bottomNavBarHelperMethods
                                        .loginPopUp(context);
                                  });
                                },
                          height: 38,
                          width: 38,
                          margin: getMargin(bottom: 15),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgFavorite,
                            color: Colors.grey,
                          ))
                    ])),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                        width: getHorizontalSize(335.00),
                        margin: getMargin(top: 21, bottom: 4),
                        child: Text(
                            // "msg_my_holidays_in_rajasthan2".tr,
                            data!.description!,
                            maxLines: 10,
                            textAlign: TextAlign.left,
                            style: AppTextStyle.txtPoppinsRegular12)),
                  ),
                  // Positioned(
                  //   bottom: size.height * 0.04,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     height: size.height * 0.2,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     padding: getPadding(left: 20, right: 20),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "Please login to read more",
                  //           style: TextStyle(
                  //               fontSize: 18, fontWeight: FontWeight.w500),
                  //         ),
                  //         SizedBox(
                  //           height: 20,
                  //         ),
                  //         CustomButton(
                  //           text: "Login",
                  //           width: size.width,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ]),

          // SizedBox(
          //     width: size.width,
          //     child: Container(
          //         width: size.width,
          //         decoration: AppDecoration.fillWhiteA700,
          //         child: )),
        ));
  }

  Widget floatingActionButtonScreen() {
    return Container(
      height: size.height * .07,
      margin: getMargin(bottom: 20, top: 0),
      width: size.width * .38,
      child: FloatingActionButton(
        splashColor: Colors.transparent,
        backgroundColor: ColorConstant.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgHand,
                  color: ColorConstant.yellow900,
                  height: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "1.1k",
                  style: AppTextStyle.txtPoppinsSemiBlack14,
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Container(
              height: 15,
              width: 2,
              color: ColorConstant.gray400,
            ),
            Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgShare,
                  color: ColorConstant.yellow900,
                  height: 17,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "31",
                  style: AppTextStyle.txtPoppinsSemiBlack14,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// onTapImgArrowleft() {
//   Get.back();
// }
}
