import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/favourite_item.dart';

import '../../../core/utils/static_models.dart';
import '../controller/home_controller.dart';

class HomeBlogWidget extends GetView<HomeController> {
  StaticBlogModel? data;
  HomeBlogWidget({this.data});
  final authController = Get.find<AuthController>();
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            // PersistentNavBarNavigator.pushNewScreen(
            //   context,
            //   screen: FavouriteItem(),
            //   withNavBar: true, // OPTIONAL VALUE. True by default.
            //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
            // );
          },
          child: Container(
            margin: getMargin(
              right: 15,
            ),
            decoration: AppDecoration.fillWhiteA700.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: FavouriteItem(
                        data: data,
                      ),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: CustomImageView(
                    // imagePath: ImageConstant.imgRectangle23908,
                    imagePath: data!.image,
                    height: getVerticalSize(
                      147.00,
                    ),
                    width: getHorizontalSize(
                      335.00,
                    ),
                    radius: BorderRadius.only(
                      topLeft: Radius.circular(
                        getHorizontalSize(
                          8.00,
                        ),
                      ),
                      topRight: Radius.circular(
                        getHorizontalSize(
                          8.00,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(top: 7, left: 10, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              // "msg_varanasi_worth_exploring".tr,
                              data!.title!,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16,
                            ),
                            Row(
                              children: [
                                // CustomImageView(
                                //   imagePath: ImageConstant.imgEllipse1271,
                                //   height: getSize(
                                //     18.00,
                                //   ),
                                //   width: getSize(
                                //     18.00,
                                //   ),
                                //   radius: BorderRadius.circular(
                                //     getHorizontalSize(
                                //       9.00,
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: getPadding(
                                //     left: 6,
                                //     bottom: 1,
                                //   ),
                                //   child: Text(
                                //     "lbl_sofia_jeans".tr,
                                //     overflow: TextOverflow.ellipsis,
                                //     textAlign: TextAlign.left,
                                //     style: AppTextStyle.txtPoppinsMedium12,
                                //   ),
                                // ),
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
                                    style:
                                        AppTextStyle.txtPoppinsMedium12Gray600,
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
                                    style: AppTextStyle.txtPoppinsMedium12Black,
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
                              ],
                            ),
                          ],
                        ),
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
                          margin: getMargin(
                            bottom: 2,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgFavorite,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: FavouriteItem(data: data),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Container(
                      width: getHorizontalSize(
                        291.00,
                      ),
                      margin: getMargin(
                        left: 12,
                        top: 4,
                        bottom: 2,
                      ),
                      child: Text(
                        data!.description!,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: ColorConstant.gray700,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // RichText(
                      //   maxLines: 2,
                      //   // overflow: TextOverflow.ellipsis,
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         // text: "msg_after_seeing_the2".tr,
                      //
                      //         text: data!.description,
                      //         style: TextStyle(
                      //           overflow: TextOverflow.ellipsis,
                      //           color: ColorConstant.gray700,
                      //           fontSize: getFontSize(
                      //             12,
                      //           ),
                      //           fontFamily: 'Poppins',
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //       // TextSpan(
                      //       //   recognizer: TapGestureRecognizer()
                      //       //     ..onTap = () {
                      //       //       PersistentNavBarNavigator.pushNewScreen(
                      //       //         context,
                      //       //         screen: FavouriteItem(),
                      //       //         withNavBar:
                      //       //             true, // OPTIONAL VALUE. True by default.
                      //       //         pageTransitionAnimation:
                      //       //             PageTransitionAnimation.cupertino,
                      //       //       );
                      //       //     },
                      //       //   text: "lbl_read_more".tr,
                      //       //   style: TextStyle(
                      //       //     color: ColorConstant.yellow900,
                      //       //     fontSize: getFontSize(
                      //       //       12,
                      //       //     ),
                      //       //     fontFamily: 'Poppins',
                      //       //     fontWeight: FontWeight.w500,
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: FavouriteItem(
                        data: data,
                      ),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, bottom: 7),
                    child: Text(
                      "lbl_read_more".tr,
                      style: TextStyle(
                        color: ColorConstant.yellow900,
                        fontSize: getFontSize(
                          12,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
