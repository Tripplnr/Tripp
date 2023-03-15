import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';

class BottomNavBarHelperMethods {
  Future<bool> showExitPopUp() async {
    return await Get.defaultDialog(
        title: "Exit?",
        middleText: "Do you really want to Exit?",
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              color: ColorConstant.black,
              onPressed: () {
                Get.back(canPop: false);
              },
              child: Text(
                "No",
                style: TextStyle(color: ColorConstant.white),
              ),
            ),
            MaterialButton(
              color: ColorConstant.black,
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text(
                "Yes",
                style: TextStyle(color: ColorConstant.white),
              ),
            )
          ],
        ));
  }

  Future loginPopUp(context) async {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return await Get.dialog(WillPopScope(
      onWillPop: () async {
        // await Get.offAndToNamed(AppRoutes.bottom_nav_bar);
        return false;
      },
      child: Form(
        key: formKey,
        child: Container(
          color: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: AlertDialog(
                insetPadding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                content: SingleChildScrollView(
                  child: Container(
                    // margin: getMargin(top: getVerticalSize(135.00)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: getPadding(top: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("lbl_login".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.txtPoppinsBold28),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.pop(context);
                                    Get.back();
                                    print("Back Button");
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorConstant.gray10001),
                                      child: Icon(
                                        Icons.close,
                                        color: ColorConstant.black,
                                      )),
                                ),
                              ],
                            )),
                        Padding(
                            padding: getPadding(top: 2),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("msg_enter_your_credential".tr,
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsMedium16),
                            )),
                        CustomTextFormField(
                            width: 335,
                            focusNode: FocusNode(),
                            // controller: controller.emailController,
                            hintText: "lbl_email".tr,
                            margin: getMargin(top: 14),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                            prefix: Container(
                                margin: getMargin(
                                    left: 17, top: 17, right: 16, bottom: 17),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgMail)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(58.00)),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "Please enter valid email";
                              }
                              return null;
                            }),

                        SizedBox(
                          height: 10,
                        ),

                        CustomTextFormField(
                            isObscureText: true,
                            suffix: Padding(
                                padding: getPadding(top: 18, right: 15),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.forgot);
                                  },
                                  child: Text("lbl_forgot".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle
                                          .txtPoppinsSemiBold14Black90002),
                                )),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            width: 335,
                            focusNode: FocusNode(),
                            // controller:
                            // controller.passwordController,
                            hintText: "lbl_password".tr,
                            // margin: getMargin(top: 14),
                            // textInputAction: TextInputAction.,
                            textInputType: TextInputType.visiblePassword,
                            prefix: Container(
                                margin: getMargin(
                                  left: 17,
                                  top: 17,
                                  bottom: 17,
                                  right: 16,
                                ),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgLock)),
                            prefixConstraints: BoxConstraints(
                                maxHeight: getVerticalSize(58.00)),
                            validator: (value) {
                              // return null;

                              if (value == null || value.isEmpty

                                  // (!isValidPassword(value,
                                  //     isRequired: true))
                                  ) {
                                return "Please enter password";
                              }
                              return null;
                            }),

                        // Container(
                        //     margin: getMargin(top: 16),
                        //     padding: getPadding(all: 17),
                        //     decoration: AppDecoration.fillGray10001.copyWith(
                        //         borderRadius: BorderRadiusStyle.roundedBorder16),
                        //     child: Row(children: [
                        //       CustomImageView(
                        //           svgPath: ImageConstant.imgLock,
                        //           height: getSize(24.00),
                        //           width: getSize(24.00)),
                        //       Padding(
                        //           padding: getPadding(left: 16, bottom: 2),
                        //           child: Text("lbl_password".tr,
                        //               overflow: TextOverflow.ellipsis,
                        //               textAlign: TextAlign.left,
                        //               style: AppTextStyle
                        //                   .txtPoppinsMedium14Gray600)),
                        //       Spacer(),
                        //       Padding(
                        //           padding: getPadding(top: 2),
                        //           child: InkWell(
                        //             onTap: () {
                        //               Get.toNamed(AppRoutes.forgot);
                        //             },
                        //             child: Text("lbl_forgot".tr,
                        //                 overflow: TextOverflow.ellipsis,
                        //                 textAlign: TextAlign.left,
                        //                 style: AppTextStyle
                        //                     .txtPoppinsSemiBold14Black90002),
                        //           ))
                        //     ])),

                        CustomButton(
                            height: 58,
                            width: 335,
                            text: "lbl_login".tr,
                            margin: getMargin(top: 16),
                            fontStyle: ButtonFontStyle.PoppinsMedium15,
                            onTap: () {
                              // print("lbl_login");
                              final _controller = Get.find<AuthController>();
                              // _controller.isLoggedIn.value = true;
                              // // Navigator.pop(context);
                              // Get.back();

                              if (
                                  // formKey.currentState!.validate()){
                                  formKey.currentState!.validate()) {
                                print("Hit Api");
                                _controller.isLoggedIn.value = true;
                                Get.back();
                                // Get.offAndToNamed(AppRoutes.bottom_nav_bar);

                                // homeRepository.fetchPopularHotels().then((value) {
                                //   if (value) {
                                //     // Get.toNamed(AppRoutes.bottom_nav_bar);
                                //
                                //     authController.isLoggedIn.value = true;
                                //     Get.offAndToNamed(AppRoutes.bottom_nav_bar);
                                //   }
                                //   print("=>$value");
                                // });
                              } else {
                                print("Invalid");
                              }
                            }),
                        Padding(
                            padding: getPadding(top: 9),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   height: 2,
                                  //   width: 100,
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.red,
                                  //       borderRadius: BorderRadius.circular(
                                  //           getHorizontalSize(1.00)),
                                  //       gradient: LinearGradient(
                                  //           begin: Alignment(0, 0.1),
                                  //           end: Alignment(1, 2),
                                  //           colors: [
                                  //             ColorConstant.blueGray10000,
                                  //             ColorConstant.blueGray10001
                                  //           ])),
                                  // ),
                                  Container(
                                      height: getVerticalSize(2.00),
                                      width: getHorizontalSize(94.00),
                                      margin: getMargin(
                                          top: 18, bottom: 18, left: 9),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(1.00)),
                                          gradient: LinearGradient(
                                              begin: Alignment(-1, 10),
                                              end: Alignment(0, -5),
                                              colors: [
                                                // ColorConstant.blueGray10000,
                                                ColorConstant.blueGray10000,
                                                ColorConstant.blueGray10001,
                                              ]))),
                                  Container(
                                      width: getSize(38.00),
                                      height: getSize(38.00),
                                      margin: getMargin(left: 9),
                                      padding: getPadding(),
                                      decoration: AppDecoration.txtFillGray10001
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .txtCircleBorder19),
                                      child: Center(
                                        child: Text("lbl_or".tr,
                                            // overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppTextStyle
                                                .txtPoppinsBold14Gray60001),
                                      )),
                                  Container(
                                      height: getVerticalSize(2.00),
                                      width: getHorizontalSize(94.00),
                                      margin: getMargin(
                                          left: 9, top: 18, bottom: 18),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(1.00)),
                                          gradient: LinearGradient(
                                              begin: Alignment(0, 0.5),
                                              end: Alignment(1, 1),
                                              colors: [
                                                ColorConstant.blueGray10001,
                                                ColorConstant.blueGray10000
                                              ])))
                                ])),
                        CustomButton(
                            height: 54,
                            width: 335,
                            text: "msg_login_with_google".tr,
                            margin: getMargin(top: 13),
                            variant: ButtonVariant.FillGray10001,
                            padding: ButtonPadding.PaddingT15,
                            fontStyle: ButtonFontStyle.PoppinsSemiBold14,
                            prefixWidget: Container(
                                margin: getMargin(right: 11),
                                child: CustomImageView(
                                    svgPath: ImageConstant.imgGoogle)),
                            onTap: () {
                              // final _controller = Get.find<AuthController>();
                              // _controller.isLoggedIn.value = true;
                              // // Navigator.pop(context);
                              // Get.back();

                              onTapLoginwithgoogle();
                            }
                            // onTapLoginwithgoogle
                            ),
                        CustomButton(
                          onTap: () {
                            final _controller = Get.find<AuthController>();
                            _controller.isLoggedIn.value = true;
                            // Navigator.pop(context);
                            Get.back();

                            // onTapLoginwithfacebook();
                            // initiateFacebookLogin();
                          },
                          height: 54,
                          width: 335,
                          text: "msg_login_with_facebook".tr,
                          margin: getMargin(top: 12),
                          variant: ButtonVariant.FillBlueA400,
                          padding: ButtonPadding.PaddingT15,
                          fontStyle: ButtonFontStyle.PoppinsSemiBold14WhiteA700,
                          prefixWidget: Container(
                              margin: getMargin(right: 11),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgFile)),
                          // onTap: onTapLogin
                        ),

                        Platform.isAndroid
                            ? SizedBox()
                            : CustomButton(
                                // onTap: onTapLogin,
                                onTap: () async {
                                  // final _controller = Get.find<AuthController>();
                                  // _controller.isLoggedIn.value = true;
                                  // // Navigator.pop(context);
                                  // Get.back();

                                  final credential = await SignInWithApple
                                      .getAppleIDCredential(
                                    scopes: [
                                      AppleIDAuthorizationScopes.email,
                                      AppleIDAuthorizationScopes.fullName,
                                    ],
                                  ).then((value) {
                                    if (value != null) {
                                      print("value_apple");
                                      print(value);

                                      final _controller =
                                          Get.find<AuthController>();
                                      _controller.isLoggedIn.value = true;
                                      // Navigator.pop(context);
                                      Get.back();
                                    } else {
                                      print("value_apple_null");
                                      print(value);
                                      final _controller =
                                          Get.find<AuthController>();
                                      _controller.isLoggedIn.value = true;
                                      // Navigator.pop(context);
                                      Get.back();
                                    }
                                  });
                                },
                                height: 54,
                                width: 335,
                                text: "msg_login_with_apple".tr,
                                margin: getMargin(top: 12),
                                variant: ButtonVariant.FillBlack90001,
                                padding: ButtonPadding.PaddingT15,
                                fontStyle:
                                    ButtonFontStyle.PoppinsSemiBold14WhiteA700,
                                prefixWidget: Container(
                                    margin: getMargin(right: 11),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgApplelogo))),
                        Padding(
                            padding: getPadding(top: 18),
                            child: Text("msg_don_t_have_an_account".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyle.txtPoppinsMedium14Gray60001)),
                        GestureDetector(
                            onTap: () {
                              final _controller = Get.find<AuthController>();
                              _controller.isLoggedIn.value = false;
                              Get.toNamed(AppRoutes.register);
                              // onTapRegister();
                            },
                            child: Padding(
                                padding: getPadding(top: 3, bottom: 5),
                                child: Text("lbl_create_account".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle
                                        .txtPoppinsSemiBold14Yellow900))),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    ));
  }

  onTapLoginwithgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin

        final _controller = Get.find<AuthController>();
        _controller.isLoggedIn.value = true;
        Get.back();
      } else {
        // Get.snackbar('Error', 'user data is empty');
        final _controller = Get.find<AuthController>();
        _controller.isLoggedIn.value = true;
        Get.back();
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapLoginwithfacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        // await facebookLogin.logInWithReadPermissions(['email']);
        await facebookLogin.logIn();

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        // onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancel:
        print("CancelledByUser");
        // onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.success:
        print("LoggedIn");
        final _controller = Get.find<AuthController>();
        _controller.isLoggedIn.value = true;
        Get.back();
        // onLoginStatusChanged(true);
        break;
    }
  }
}
