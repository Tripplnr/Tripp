import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/favourite_item.dart';

import '../../../core/utils/static_models.dart';
import '../controller/blogs_controller.dart';

// ignore: must_be_immutable
class BlogsItemWidget extends GetView<BlogsController> {
  StaticBlogModel? data;

  BlogsItemWidget({this.data});

  final authController = Get.find<AuthController>();
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: FavouriteItem(
              // callFrom:"Blog",
              data: data,
            ),
            withNavBar: true, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Container(
          margin: getMargin(
            // left: 20,
            // right: 20,
            bottom: 0,
          ),
          // width: getHorizontalSize(335),
          width: size.width,

          // height: getVerticalSize(277.6),
          decoration: AppDecoration.fillWhiteA700.copyWith(
              // borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                // imagePath: ImageConstant.imgRectangle23908,
                imagePath: data!.image,
                height: getVerticalSize(
                  // 280.00,
                  147.00,
                ),
                fit: BoxFit.cover,
                // width: getHorizontalSize(
                //   335.00,
                // ),
                width: size.width,

                radius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      0.00,
                      // 8.00,
                    ),
                  ),
                  topRight: Radius.circular(
                    getHorizontalSize(
                      0.00,
                      // 8.00,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 12,
                    top: 13,
                    right: 12,
                  ),
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
                                  left: 6,
                                  top: 1,
                                ),
                                child: Text(
                                  // "lbl_22_jan_2023".tr,
                                  data!.date!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsMedium12Gray600,
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
                                Future.delayed(Duration(seconds: 0), () async {
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
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  291.00,
                ),
                margin: getMargin(
                  left: 12,
                  top: 9,
                  bottom: 25,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_after_seeing_the2".tr,
                        style: TextStyle(
                          color: ColorConstant.gray700,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "lbl_read_more".tr,
                        style: TextStyle(
                          color: ColorConstant.yellow900,
                          fontSize: getFontSize(
                            12,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ));
  }
}
