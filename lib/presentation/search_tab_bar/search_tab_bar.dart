import 'dart:io';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/blogs/blogs.dart';
import 'package:trippinr/presentation/destination/destination.dart';

import 'controller/search_tab_bar_controller.dart';

class SearchTabBar extends StatelessWidget {
  var controller = Get.put(SearchTabBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.transparent,
        backgroundColor: ColorConstant.gray100,

        body: SafeArea(
          top: false,
          child: Obx(() {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: controller.index.value == 0
                      ? getVerticalSize(224.00)
                      : getVerticalSize(Platform.isAndroid ? 110.00 : 125.0),
                  color: ColorConstant.yellow900,
                  // color: Colors.red,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Container(
                                margin: getMargin(
                                  top: 18,
                                  left: 10,
                                ),
                                // child: InkWell(
                                //   onTap: controller.index == 0
                                //       ? null
                                //       : () {
                                //           Navigator.pop(context);
                                //         },
                                //   child: CustomImageView(
                                //     svgPath: ImageConstant.imgArrowleft,
                                //     color: Colors.white,
                                //     height: 24,
                                //     width: 24,
                                //   ),
                                // ),
                              ),
                            ),
                            Container(
                              margin: getMargin(top: 18),
                              width: getHorizontalSize(162.00),
                              height: getVerticalSize(44),
                              decoration:
                                  BoxDecoration(color: ColorConstant.orangeA200)
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder24),

                              // padding: getMargin(all: 5),
                              padding: getPadding(all: 0),
                              child: Container(
                                child: TabBar(
                                  padding: getPadding(all: 0),
                                  labelPadding: getPadding(left: 5, right: 5),

                                  controller: controller.tabController,
                                  onTap: (index) {
                                    print(index);
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
                                  labelColor: ColorConstant.black90002,
                                  unselectedLabelColor: ColorConstant.whiteA700,
                                  indicator: null,
                                  isScrollable: false,
                                  indicatorColor: Colors.transparent,
                                  dividerColor: Colors.transparent,
                                  indicatorWeight: 0.00001,
                                  // indicator: BoxDecoration(
                                  //     color: ColorConstant.whiteA700,
                                  //     borderRadius: BorderRadius.circular(
                                  //         getHorizontalSize(17.00))),
                                  tabs: [
                                    Container(
                                      width: getHorizontalSize(76),
                                      height: getVerticalSize(34),
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 0
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(60)),
                                      child: Center(
                                        child: Text(
                                          "lbl_hotels".tr,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: getHorizontalSize(76),
                                      height: getVerticalSize(34),
                                      decoration: BoxDecoration(
                                          color: controller.index.value == 1
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(60)),
                                      child: Center(
                                        child: Text(
                                          "lbl_blogs".tr,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                    // Tab(text: "lbl_hotels".tr),tr

                                    // Tab(text: "lbl_blogs".tr),
                                    // Container(
                                    //   width: getHorizontalSize(76.00),
                                    //   height: getVerticalSize(34),
                                    //   child: Center(child: Text("lbl_blogs".tr)),
                                    //   // padding: getPadding(all: 10),
                                    //   decoration: BoxDecoration(
                                    //       color: ColorConstant.whiteA700,
                                    //       borderRadius: BorderRadius.circular(
                                    //           getHorizontalSize(17.00))),
                                    // ),
                                    // Tab(text: "lbl_hotels".tr),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: getMargin(
                                top: 18,
                                right: 34,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: getMargin(
                    top: Platform.isAndroid
                        ? 100
                        : controller.index.value == 0
                            ? 120
                            : 105,
                    // left: 20,
                    // right: 20,
                  ),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Destination(),
                      ),
                      Blogs(),
                      // Center(),
                      // Center(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
