// ignore_for_file: must_be_immutable

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/favourite.dart';
import 'package:trippinr/presentation/home/home.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';
import 'package:trippinr/presentation/settings/settings.dart';

import 'controller/bottom_nav_bar_controller.dart';

class BottomNavBar extends GetWidget<BottomNavBarController> {
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  var index;

  BottomNavBar({Key? key, this.index}) : super(key: key);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List navBarIcons = [
    ImageConstant.imgHomeGray60001,
    ImageConstant.imgSearch,
    ImageConstant.imgFavoriteGray6000124x24,
    ImageConstant.imgUser,
  ];
  List navBarIconsActive = [
    ImageConstant.homeFilled,
    ImageConstant.searchFilled,
    ImageConstant.heartFilled,
    ImageConstant.accountFilled,
  ];

  List navBarLabel = [
    "lbl_home".tr,
    "lbl_search".tr,
    "lbl_favorites".tr,
    "lbl_account".tr,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(onWillPop: () async {
        return false;
      }, child: Scaffold(
        // MaterialApp(
        // backgroundColor: ColorConstant.gray50,
        body: Obx(() {
          return PersistentTabView(
            context,
            controller: _controller,
            items: _navBarsItems(),
            screens: _buildScreens(),
            confineInSafeArea: true,

            // padding: NavBarPadding.all(0),
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            navBarHeight: 65,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            onItemSelected: (index) {
              print('Cuurent Index ==> ${index}');
              // if (index != controller.currentScreen.value) {
              //   controller.navigationQueue
              //       .removeWhere((element) => element == index);
              //   controller.navigationQueue.addLast(index);
              // print('Test $index');
              //   if (index == 2) {
              //     controller.currentScreen.value = 2;
              //     Future.delayed(Duration(seconds: 3), () async {
              //       await _bottomNavBarHelperMethods.loginPopUp();
              //     });
              //     // Future.delayed(Duration(seconds: 1), () async {
              //     //   // controller.currentScreen.value = 0;
              //     // });
              //   } else {
              //     controller.currentScreen.value = index;
              //   }
              //   print("Test");
              //   // controller.currentScreen.value = index;
              // } else {}
              // // if (controller.indexController.selectedIndex == 1) {
              // //   controller.currentScreen.value ==
              // //       controller.indexController.selectedIndex.value;
              // // }
            },
            navBarStyle: NavBarStyle.simple,
          );
        }),
      )
          // ),
          // body: Center(
          //   child: controller.screenList[controller.currentScreen.value],
          // ),
          ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? [
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgHomeGray60001,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.homeFilled,
                svgPath: ImageConstant.active_home,
                height: getSize(30.00),
                width: getSize(30.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_home".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgSearch,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.searchFilled,
                svgPath: ImageConstant.active_search,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_search".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgFavoriteGray6000124x24,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.heartFilled,
                svgPath: ImageConstant.active_fav,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_favorites".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgUser,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.accountFilled,
                svgPath: ImageConstant.active_account,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_account".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
          ]
        : [
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgHomeGray60001,
                height: 24,
                width: 24,
                color: ColorConstant.yellow900,
              ),
              icon: SizedBox(
                height: 2,
                width: 24,
                child: CustomImageView(
                  // imagePath: ImageConstant.homeFilled,
                  svgPath: ImageConstant.active_home,
                  height: 24,
                  width: 24,
                  color: ColorConstant.yellow900,
                ),
                // Image.asset(
                //   ImageConstant.homeFilled,
                //   height: 2,
                //   width: 24,
                //   color: ColorConstant.yellow900,
                // ),
              ),
              // contentPadding: 0,

              title: "lbl_home".tr,
              contentPadding: 1,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgSearch,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.searchFilled,
                svgPath: ImageConstant.active_search,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_search".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgUser,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              icon: CustomImageView(
                // imagePath: ImageConstant.accountFilled,
                svgPath: ImageConstant.active_account,
                height: getSize(24.00),
                width: getSize(24.00),
                color: ColorConstant.yellow900,
              ),
              title: "lbl_account".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: Colors.black,
            ),
          ];
  }

  List<Widget> _buildScreens() {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? [
            Home(),
            SearchTabBar(),
            Favourite(),
            Settings(),
          ]
        : [
            Home(),
            SearchTabBar(),
            Settings(),
          ];
  }
}
