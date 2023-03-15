import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/register/register_screen.dart';
import 'package:trippinr/test_web_view.dart';

import 'about_us.dart';
import 'controller/settings_controller.dart';
import 'legal_information.dart';

// ignore_for_file: must_be_immutable
class Settings extends StatelessWidget {
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  final authController = Get.find<AuthController>();
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: Container(
                width: size.width,
                decoration: AppDecoration.fillGray100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: size.width,
                        height: getVerticalSize(100),
                        color: ColorConstant.yellow900,
                        child: SafeArea(
                          child: Center(
                            child: Text("lbl_settings".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyle.txtPoppinsSemiBold16WhiteA700),
                          ),
                        )),
                    authController.isLoggedIn.value
                        ? GestureDetector(
                            onTap: () {
                              onTapRowuser(context);
                            },
                            child: Container(
                                margin: getMargin(left: 0, top: 20, right: 0),
                                padding: getPadding(
                                    left: 18, top: 19, right: 18, bottom: 19),
                                decoration: AppDecoration.fillWhiteA700
                                    .copyWith(borderRadius: BorderRadius.zero
                                        // BorderRadiusStyle.roundedBorder20,
                                        ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.yellow90019,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder30),
                                          child: Container(
                                              height: getSize(60.00),
                                              width: getSize(60.00),
                                              padding: getPadding(all: 18),
                                              decoration: AppDecoration
                                                  .fillYellow90019
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .circleBorder30),
                                              child: Stack(children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgUserYellow90024x24,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00),
                                                    alignment: Alignment.center)
                                              ]))),
                                      Padding(
                                          padding: getPadding(
                                              left: 20, top: 18, bottom: 17),
                                          child: Text("John Smith".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppTextStyle
                                                  .txtPoppinsSemiBold18)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightGray60001,
                                          height: getSize(24.00),
                                          width: getSize(24.00),
                                          margin:
                                              getMargin(top: 18, bottom: 18))
                                    ])))
                        : InkWell(
                            onTap: authController.isLoggedIn.value
                                ? null
                                : () {
                                    Future.delayed(Duration(seconds: 0),
                                        () async {
                                      await _bottomNavBarHelperMethods
                                          .loginPopUp(context);
                                    });
                                  },
                            child: Container(
                              height: 71,
                              margin: getMargin(
                                  left: 0, top: 15, right: 0, bottom: 5),
                              padding: getPadding(
                                  left: 18, top: 19, right: 18, bottom: 19),
                              decoration: AppDecoration.fillWhiteA700
                                  .copyWith(borderRadius: BorderRadius.zero
                                      // BorderRadiusStyle.roundedBorder20,
                                      ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // CustomImageView(
                                    //     svgPath: ImageConstant.imgContrast,
                                    //     height: getSize(22.00),
                                    //     width: getSize(22.00),
                                    //     margin: getMargin(top: 1, bottom: 1)),
                                    Padding(
                                        padding: getPadding(left: 6),
                                        child: Text("Login".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: ColorConstant.yellow900,
                                              fontSize: getFontSize(
                                                18,
                                              ),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700,
                                            ))),
                                    Spacer(),
                                    CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowrightGray60001,
                                        height: getSize(24.00),
                                        width: getSize(24.00))
                                  ]),
                            ),
                          ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: AboutUs(),
                                    withNavBar:
                                        true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                                child: Container(
                                  // height: 59,
                                  margin: getMargin(
                                      left: 0, top: 15, right: 0, bottom: 5),
                                  padding: getPadding(
                                      left: 18, top: 19, right: 18, bottom: 19),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(borderRadius: BorderRadius.zero
                                          // BorderRadiusStyle.roundedBorder20,
                                          ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.settingAboutUs,
                                            color: ColorConstant.yellow900,
                                            height: getSize(22.00),
                                            width: getSize(22.00),
                                            margin:
                                                getMargin(top: 1, bottom: 1)),
                                        Padding(
                                            padding: getPadding(left: 6),
                                            child: Text("lbl_about_us".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle
                                                    .txtPoppinsRegular18)),
                                        Spacer(),
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowrightGray60001,
                                            height: getSize(24.00),
                                            width: getSize(24.00))
                                      ]),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  // height: 133,
                                  margin: getMargin(
                                      left: 0, top: 5, right: 0, bottom: 5),
                                  padding: getPadding(
                                      left: 18, top: 0, right: 18, bottom: 0),
                                  decoration: AppDecoration.fillWhiteA700,
                                  // .copyWith(
                                  //     borderRadius: BorderRadiusStyle
                                  //         .roundedBorder20),
                                  child: Column(
                                    children: [
                                      // Container(
                                      //   padding:
                                      //       getPadding(top: 19, bottom: 19),
                                      //   child: Row(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgRemixiconslinYellow900,
                                      //             height: getSize(22.00),
                                      //             width: getSize(22.00),
                                      //             margin: getMargin(
                                      //                 top: 1, bottom: 1)),
                                      //         Padding(
                                      //             padding: getPadding(left: 6),
                                      //             child: Text(
                                      //                 "lbl_preferences".tr,
                                      //                 overflow:
                                      //                     TextOverflow.ellipsis,
                                      //                 textAlign: TextAlign.left,
                                      //                 style: AppTextStyle
                                      //                     .txtPoppinsRegular18)),
                                      //         Spacer(),
                                      //         CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgArrowrightGray60001,
                                      //             height: getSize(24.00),
                                      //             width: getSize(24.00))
                                      //       ]),
                                      // ),
                                      // Container(
                                      //     width: size.width,
                                      //     height: 1,
                                      //     decoration: BoxDecoration(
                                      //         color: ColorConstant.gray200)),
                                      InkWell(
                                        onTap: () {
                                          controller.onselected();
                                          // TextEditingValue(
                                          //     selection:
                                          //         TextSelection.collapsed(
                                          //             offset: 0));
                                          // Get.toNamed(AppRoutes.currency);
                                        },
                                        child: Container(
                                          padding:
                                              getPadding(top: 10, bottom: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .settingCurrency,
                                                    height: getSize(22.00),
                                                    color:
                                                        ColorConstant.yellow900,
                                                    width: getSize(22.00),
                                                    margin: getMargin(
                                                        top: 1, bottom: 1)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text("Currency".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular18)),
                                                Spacer(),
                                                Obx(() {
                                                  return Text(
                                                      controller.data.value
                                                              .isEmpty
                                                          ? " "
                                                          : controller
                                                              .data.value
                                                              .substring(0, 3),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppTextStyle
                                                          .txtPoppinsRegular18);
                                                }),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowrightGray60001,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))
                                              ]),
                                        ),
                                      ),
                                      Container(
                                          width: size.width,
                                          height: 1,
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray200)),
                                      Container(
                                        padding:
                                            getPadding(top: 19, bottom: 19),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .setiingUnits,
                                                  color:
                                                      ColorConstant.yellow900,
                                                  height: getSize(22.00),
                                                  width: getSize(22.00),
                                                  margin: getMargin(
                                                      top: 0, bottom: 0)),
                                              Padding(
                                                  padding: getPadding(left: 6),
                                                  child: Text("Units".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppTextStyle
                                                          .txtPoppinsRegular18)),
                                              Spacer(),
                                              Expanded(
                                                child: Container(
                                                  width: 115,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        ColorConstant.gray10001,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            48),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Obx(() {
                                                        return controller
                                                            .unitTypeList(
                                                                "Kms",
                                                                controller
                                                                        .unitSelected ==
                                                                    "Kms");
                                                      }),
                                                      Obx(() {
                                                        return controller
                                                            .unitTypeList(
                                                                "Miles",
                                                                controller
                                                                        .unitSelected ==
                                                                    "Miles");
                                                      }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  margin: getMargin(
                                      left: 0, top: 5, right: 0, bottom: 10),
                                  // padding: getPadding(
                                  //     left: 18,
                                  //     top: 19,
                                  //     right: 18,
                                  //     bottom: 19),
                                  decoration: AppDecoration.fillWhiteA700,
                                  // .copyWith(
                                  //     borderRadius: BorderRadiusStyle
                                  //         .roundedBorder20),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => WebViewScreen(
                                                title: "Become Affiliate",
                                              ));
                                        },
                                        child: Container(
                                          padding: getPadding(
                                              left: 18,
                                              top: 19,
                                              right: 18,
                                              bottom: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .settingBecome_Affilate,
                                                    color:
                                                        ColorConstant.yellow900,
                                                    height: getSize(22.00),
                                                    width: getSize(22.00),
                                                    margin: getMargin(
                                                        top: 1, bottom: 1)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text(
                                                        "msg_become_affiliate"
                                                            .tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular18)),
                                                Spacer(),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowrightGray60001,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))
                                              ]),
                                        ),
                                      ),
                                      Container(
                                          width: size.width,
                                          height: 1,
                                          margin: getMargin(
                                            left: 18,
                                            right: 18,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray200)),
                                      InkWell(
                                        onTap: () {
                                          _onShare(context);
                                        },
                                        child: Container(
                                          padding: getPadding(
                                              left: 18,
                                              top: 19,
                                              right: 18,
                                              bottom: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .settingShare,
                                                    color:
                                                        ColorConstant.yellow900,
                                                    height: getSize(22.00),
                                                    width: getSize(22.00),
                                                    margin: getMargin(
                                                        top: 1, bottom: 1)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text("Share App".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular18)),
                                                Spacer(),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowrightGray60001,
                                                    color:
                                                        ColorConstant.yellow900,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))
                                              ]),
                                        ),
                                      ),
                                      Container(
                                          width: size.width,
                                          height: 1,
                                          margin: getMargin(
                                            left: 18,
                                            right: 18,
                                          ),
                                          decoration: BoxDecoration(
                                              color: ColorConstant.gray200)),
                                      InkWell(
                                        onTap: () {
                                          PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: LegalInformation(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Container(
                                          padding: getPadding(
                                              left: 18,
                                              top: 19,
                                              right: 18,
                                              bottom: 19),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .settingLegal,
                                                    height: getSize(22.00),
                                                    width: getSize(22.00),
                                                    margin: getMargin(
                                                        top: 1, bottom: 1)),
                                                Padding(
                                                    padding:
                                                        getPadding(left: 6),
                                                    child: Text(
                                                        "Legal Information".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppTextStyle
                                                            .txtPoppinsRegular18)),
                                                Spacer(),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowrightGray60001,
                                                    height: getSize(24.00),
                                                    width: getSize(24.00))
                                              ]),
                                        ),
                                      ),
                                      // Container(
                                      //     width: size.width,
                                      //     height: 1,
                                      //     margin: getMargin(
                                      //       left: 18,
                                      //       right: 18,
                                      //     ),
                                      //     decoration: BoxDecoration(
                                      //         color: ColorConstant.gray200)),
                                      // Container(
                                      //   padding: getPadding(
                                      //       left: 18,
                                      //       top: 19,
                                      //       right: 18,
                                      //       bottom: 19),
                                      //   child: Row(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgContrast,
                                      //             height: getSize(22.00),
                                      //             width: getSize(22.00),
                                      //             margin: getMargin(
                                      //                 top: 1, bottom: 1)),
                                      //         Padding(
                                      //             padding:
                                      //                 getPadding(left: 6),
                                      //             child: Text(
                                      //                 "msg_become_affiliate"
                                      //                     .tr,
                                      //                 overflow: TextOverflow
                                      //                     .ellipsis,
                                      //                 textAlign:
                                      //                     TextAlign.left,
                                      //                 style: AppTextStyle
                                      //                     .txtPoppinsRegular18)),
                                      //         Spacer(),
                                      //         CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgArrowrightGray60001,
                                      //             height: getSize(24.00),
                                      //             width: getSize(24.00))
                                      //       ]),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              authController.isLoggedIn.value
                                  ? InkWell(
                                      onTap: () {
                                        controller.onLogout();
                                        authController.isLoggedIn(false);
                                        // Get.offAndToNamed(
                                        //     AppRoutes.bottom_nav_bar);
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        width: size.width,
                                        height: 56,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: getMargin(right: 10),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgRemixiconsLineSystemLogoutboxline),
                                            ),
                                            Padding(
                                                padding: getPadding(left: 6),
                                                child: Text("Log Out".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppTextStyle
                                                        .txtPoppinsRegular16)),
                                            // CustomButton(
                                            //     height: 50,
                                            //     // width: 299,
                                            //
                                            //     text: "lbl_log_out".tr,
                                            //     margin: getMargin(top: 20),
                                            //     variant: ButtonVariant.OutlineYellow900,
                                            //     padding: ButtonPadding.PaddingT10,
                                            //     fontStyle: ButtonFontStyle.PoppinsRegular16,
                                            //     prefixWidget: Container(
                                            //         margin: getMargin(right: 10),
                                            //         child: CustomImageView(
                                            //             svgPath: ImageConstant
                                            //                 .imgRemixiconsLineSystemLogoutboxline))),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                              // CustomButton(
                              //     height: 50,
                              //     width: 299,
                              //     text: "lbl_log_out".tr,
                              //     margin: getMargin(top: 20),
                              //     variant: ButtonVariant.OutlineYellow900,
                              //     padding: ButtonPadding.PaddingT10,
                              //     fontStyle: ButtonFontStyle.PoppinsRegular16,
                              //     onTap: () {
                              //       controller.onLogout();
                              //     },
                              //     prefixWidget: Container(
                              //         margin: getMargin(right: 10),
                              //         child: CustomImageView(
                              //             svgPath: ImageConstant
                              //                 .imgRemixiconsLineSystemLogoutboxline))),
                            ]),
                      ),
                    )
                  ],
                ))));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share("text",
        subject: "link",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  onTapRowuser(context) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: RegisterScreen(
        callFrom: 'Edit',
      ),
      withNavBar: true, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
    // Get.toNamed(AppRoutes.login);
  }
}
