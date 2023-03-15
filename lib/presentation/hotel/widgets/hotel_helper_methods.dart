import 'dart:ui';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HotelHelperMethods {
  var _controller = Get.find<HotelController>();

  /*Filter Bottom Sheet*/
  void filterBottomSheet() {
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      ignoreSafeArea: false,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),

        // margin: getMargin(top: height * 0.18),
        // decoration: BoxDecoration(
        //     color: Colors.transparent, borderRadius: BorderRadius.zero
        //     // borderRadius: BorderRadius.vertical(
        //     //   top: Radius.elliptical(16, 16),
        //     // ),
        //     ),
        // width: size.width * 1,
        child: Container(
          // height: size.height * 0.9,
          // margin: getMargin(top: height * 0.1),
          padding: getPadding(left: 20, right: 20, top: 20, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(20, 20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: AppTextStyle.txtPoppinsSemiBold20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        // padding: getPadding(all: 15),
                        decoration: BoxDecoration(
                            color: ColorConstant.gray200,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            'X',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Property type',
                      style: AppTextStyle.txtPoppinsSemiBold16,
                    ),
                    Text(
                      'Reset',
                      style: AppTextStyle.txtPoppinsMedium16Yellow900,
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: List.generate(_controller.items.length, (index) {
                //     return Obx(() => CheckboxListTile(
                //           title: Text(_controller.items[index]),
                //           value: _controller.checkboxes.value[index],
                //           onChanged: (value) {
                //             _controller.updateCheckbox(index, value!);
                //           },
                //         ));
                //   }),
                // ),
                Obx(() {
                  return propertyTypeList(
                      "All", _controller.propertyType.value == "All");
                }),
                Obx(() {
                  return propertyTypeList(
                      "Hotel", _controller.propertyType.value == "Hotel");
                }),
                Obx(() {
                  return propertyTypeList("Apartment",
                      _controller.propertyType.value == "Apartment");
                }),
                // SizedBox(height: 15),
                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Property Rating',
                //       style: AppTextStyle.txtPoppinsSemiBold16,
                //     ),
                //     Text(
                //       'Reset',
                //       style: AppTextStyle.txtPoppinsMedium16Yellow900,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
                // Row(
                //   // direction: Axis.horizontal,
                //   // // runSpacing: 10,
                //   // // spacing: 10,
                //   // alignment: WrapAlignment.start,
                //   // runAlignment: WrapAlignment.start,
                //   // crossAxisAlignment: WrapCrossAlignment.start,
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //           color: ColorConstant.orange50,
                //           borderRadius: BorderRadius.circular(26)),
                //       height: 33,
                //       width: 64,
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomImageView(
                //               height: 18,
                //               width: 18,
                //               color: ColorConstant.fab005,
                //               svgPath: ImageConstant.imgStar,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               '1',
                //               style: TextStyle(
                //                   fontSize: 14, fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     Container(
                //       decoration: BoxDecoration(
                //           color: ColorConstant.orange50,
                //           borderRadius: BorderRadius.circular(26)),
                //       height: 33,
                //       width: 64,
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomImageView(
                //               height: 18,
                //               width: 18,
                //               color: ColorConstant.fab005,
                //               svgPath: ImageConstant.imgStar,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               '2',
                //               style: TextStyle(
                //                   fontSize: 14, fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     Container(
                //       decoration: BoxDecoration(
                //           color: ColorConstant.orange50,
                //           borderRadius: BorderRadius.circular(26)),
                //       height: 33,
                //       width: 64,
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomImageView(
                //               height: 18,
                //               width: 18,
                //               color: ColorConstant.fab005,
                //               svgPath: ImageConstant.imgStar,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               '3',
                //               style: TextStyle(
                //                   fontSize: 14, fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5),
                //
                // Row(
                //   children: <Widget>[
                //     Container(
                //       decoration: BoxDecoration(
                //           color: ColorConstant.orange50,
                //           borderRadius: BorderRadius.circular(26)),
                //       height: 33,
                //       width: 64,
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomImageView(
                //               height: 18,
                //               width: 18,
                //               color: ColorConstant.fab005,
                //               svgPath: ImageConstant.imgStar,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               '4',
                //               style: TextStyle(
                //                   fontSize: 14, fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     Container(
                //       decoration: BoxDecoration(
                //           color: ColorConstant.orange50,
                //           borderRadius: BorderRadius.circular(26)),
                //       height: 33,
                //       width: 64,
                //       child: Center(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             CustomImageView(
                //               height: 18,
                //               width: 18,
                //               color: ColorConstant.fab005,
                //               svgPath: ImageConstant.imgStar,
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               '5',
                //               style: TextStyle(
                //                   fontSize: 14, fontWeight: FontWeight.w600),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //   ],
                // ),
                SizedBox(height: 15),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer Rating',
                      style: AppTextStyle.txtPoppinsSemiBold16,
                    ),
                    Text(
                      'Reset',
                      style: AppTextStyle.txtPoppinsMedium16Yellow900,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CustomImageView(
                          height: 18,
                          width: 18,
                          color: ColorConstant.fab005,
                          svgPath: ImageConstant.imgStar,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomImageView(
                          height: 18,
                          width: 18,
                          svgPath: ImageConstant.imgStarBlueGray100,
                          color: ColorConstant.gray200,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomImageView(
                          height: 18,
                          width: 18,
                          svgPath: ImageConstant.imgStarBlueGray100,
                          color: ColorConstant.gray200,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomImageView(
                          height: 18,
                          width: 18,
                          svgPath: ImageConstant.imgStarBlueGray100,
                          color: ColorConstant.gray200,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CustomImageView(
                          height: 18,
                          width: 18,
                          svgPath: ImageConstant.imgStarBlueGray100,
                          color: ColorConstant.gray200,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Up to',
                          style: AppTextStyle.txtPoppinsRegular14Gray700,
                        ),
                      ],
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       color: ColorConstant.fab005,
                    //       svgPath: ImageConstant.imgStar,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       'Up to',
                    //       style: AppTextStyle.txtPoppinsRegular14Gray700,
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       color: ColorConstant.fab005,
                    //       svgPath: ImageConstant.imgStar,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       'Up to',
                    //       style: AppTextStyle.txtPoppinsRegular14Gray700,
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       color: ColorConstant.fab005,
                    //       svgPath: ImageConstant.imgStar,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStarBlueGray100,
                    //       color: ColorConstant.gray200,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       'Up to',
                    //       style: AppTextStyle.txtPoppinsRegular14Gray700,
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: <Widget>[
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       color: ColorConstant.fab005,
                    //       svgPath: ImageConstant.imgStar,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     CustomImageView(
                    //       height: 18,
                    //       width: 18,
                    //       svgPath: ImageConstant.imgStar,
                    //       color: ColorConstant.fab005,
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     Text(
                    //       'Up to',
                    //       style: AppTextStyle.txtPoppinsRegular14Gray700,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: AppTextStyle.txtPoppinsSemiBold16,
                    ),
                  ],
                ),
                Obx(() => Container(
                      // width: size.width,
                      child: RangeSlider(
                          labels: RangeLabels(
                              _controller.start.value.toString(),
                              _controller.end.value.toString()),
                          activeColor: ColorConstant.yellow900,
                          min: 8.0,
                          max: 100,
                          values: RangeValues(
                              _controller.start.value.roundToDouble(),
                              _controller.end.value.roundToDouble()),
                          onChanged: (value) {
                            _controller.start.value = value.start;
                            _controller.end.value = value.end;
                          }),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(
                    children: [
                      Text(
                        "min",
                        style: AppTextStyle.txtPoppinsMedium15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // Container(
                      //     height: 46,
                      //     width: 90,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         color: ColorConstant.gray10001),
                      //     child: Center(
                      //       child: Text(
                      //         "\$ 1",
                      //         // "\$ ${start.value.round().toStringAsFixed(0)}",
                      //         textAlign: TextAlign.start,
                      //       ),
                      //     )),
                      Obx(() => Container(
                          height: 46,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorConstant.gray10001),
                          child: Center(
                            child: Text(
                              "\$ ${_controller.start.value.round().toStringAsFixed(0)}",
                              // "\$ ${start.value.round().toStringAsFixed(0)}",
                              textAlign: TextAlign.start,
                            ),
                          ))),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "max",
                        style: AppTextStyle.txtPoppinsMedium15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Container(
                            height: 46,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorConstant.gray10001),
                            child: Center(
                              child: Text(
                                // "\$ 100",
                                "\$ ${_controller.end.value.round().toStringAsFixed(0)}",
                                textAlign: TextAlign.left,
                              ),
                            )),
                      )
                      // Obx(() => Container(
                      //     height: 46,
                      //     width: 90,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //         color: ColorConstant.gray10001),
                      //     child: Center(
                      //       child: Text(
                      //         "\$ 100",
                      //         // "\$ ${end.value.round().toStringAsFixed(0)}",
                      //         textAlign: TextAlign.left,
                      //       ),
                      //     )))
                    ],
                  )
                ]),

                SizedBox(height: 15),

                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find me a stay close to....',
                      style: AppTextStyle.txtPoppinsSemiBold16,
                    ),
                    Text(
                      '',
                      style: AppTextStyle.txtPoppinsMedium16Yellow900,
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Container(
                  padding: getPadding(left: 12, right: 12),
                  height: 44,
                  decoration: BoxDecoration(
                      color: ColorConstant.gray200,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('City Center'),
                      Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  height: 49,
                  text: 'Apply',
                  onTap: () {
                    Get.back();
                  },
                  width: size.width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  propertyTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        _controller.propertyType.value = text;

        print("===>>> ${_controller.propertyType.value}");
      },
      child: Container(
        padding: getPadding(bottom: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSelected
                ? Icon(
                    Icons.check_box,
                    size: 16,
                    color: ColorConstant.yellow900,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 16,
                    color: ColorConstant.gray200,
                  ),
            SizedBox(
              width: 10,
            ),
            Text(text, style: AppTextStyle.txtPoppinsMedium14),
          ],
        ),
      ),
    );
  }

  /*PRICE SLIDER*/
  Future priceSlider() {
    return Get.bottomSheet(BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        // height: size.height * 0.4,
        padding: getPadding(left: 20, right: 20, top: 20, bottom: 10),
        decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(16, 16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: AppTextStyle.txtPoppinsSemiBold20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 32,
                    width: 32,
                    // padding: getPadding(all: 15),
                    decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        'X',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => Container(
                  width: size.width * 0.9,
                  child: RangeSlider(
                      labels: RangeLabels(_controller.start.value.toString(),
                          _controller.end.value.toString()),
                      activeColor: ColorConstant.yellow900,
                      min: 8.0,
                      max: 100,
                      values: RangeValues(
                          _controller.start.value.roundToDouble(),
                          _controller.end.value.roundToDouble()),
                      onChanged: (value) {
                        _controller.start.value = value.start;
                        _controller.end.value = value.end;
                      }),
                )),
            Padding(
              padding: getPadding(left: 18, right: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "min",
                            style: AppTextStyle.txtPoppinsSemiBold16Black900,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // Container(
                          //     height: 46,
                          //     width: 90,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15),
                          //         color: ColorConstant.gray10001),
                          //     child: Center(
                          //       child: Text(
                          //         "\$ 1",
                          //         // "\$ ${start.value.round().toStringAsFixed(0)}",
                          //         textAlign: TextAlign.start,
                          //       ),
                          //     )),
                          Obx(() => Container(
                              height: 46,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorConstant.gray10001),
                              child: Center(
                                child: Text(
                                  "\$ ${_controller.start.value.round().toStringAsFixed(0)}",
                                  // "\$ ${start.value.round().toStringAsFixed(0)}",
                                  textAlign: TextAlign.start,
                                ),
                              ))),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "max",
                            style: AppTextStyle.txtPoppinsSemiBold16Black900,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => Container(
                                height: 46,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorConstant.gray10001),
                                child: Center(
                                  child: Text(
                                    // "\$ 100",
                                    "\$ ${_controller.end.value.round().toStringAsFixed(0)}",
                                    textAlign: TextAlign.left,
                                  ),
                                )),
                          )
                          // Obx(() => Container(
                          //     height: 46,
                          //     width: 90,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(15),
                          //         color: ColorConstant.gray10001),
                          //     child: Center(
                          //       child: Text(
                          //         "\$ 100",
                          //         // "\$ ${end.value.round().toStringAsFixed(0)}",
                          //         textAlign: TextAlign.left,
                          //       ),
                          //     )))
                        ],
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: () {
                Get.back();
              },
              width: size.width,
              height: 49,
              text: "Apply",
            ),
          ],
        ),
      ),
    ));
  }

  /*Sort Bottom Sheet*/
  sortTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        _controller.sortSelect.value = text;

        print("===>>> ${_controller.sortSelect.value}");
      },
      child: Container(
        padding: getPadding(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: isSelected
                  ? AppTextStyle.sortByTextStyleOrange
                  : AppTextStyle.sortByTextStyleBlack,
            ),
            isSelected
                ? Icon(
                    Icons.done,
                    size: 16,
                    color: ColorConstant.yellow900,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future sortBottomSheet() {
    return Get.bottomSheet(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          padding: getPadding(top: 21, left: 20, right: 20, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
            ),
            color: ColorConstant.whiteA700,
          ),
          child: Wrap(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: getPadding(bottom: 10),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort By',
                      style: AppTextStyle.txtPoppinsSemiBold20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        // padding: getPadding(all: 15),
                        decoration: BoxDecoration(
                            color: ColorConstant.gray200,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            'X',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return sortTypeList("Recommended",
                    _controller.sortSelect.value == "Recommended");
              }),
              Obx(() {
                return sortTypeList("Price (Low to High)",
                    _controller.sortSelect.value == "Price (Low to High)");
              }),
              Obx(() {
                return sortTypeList("Price (High to Low)",
                    _controller.sortSelect.value == "Price (High to Low)");
              }),
              Obx(() {
                return sortTypeList(
                    "Reviews", _controller.sortSelect.value == "Reviews");
              }),
              Obx(() {
                return sortTypeList(
                    "Star Ratings (High to Low)",
                    _controller.sortSelect.value ==
                        "Star Ratings (High to Low)");
              }),
              Obx(() {
                return sortTypeList("Distance (Near to Far)",
                    _controller.sortSelect.value == "Distance (Near to Far)");
              }),
              CustomButton(
                  height: 49,
                  width: 335,
                  text: "Apply".tr,
                  margin: getMargin(top: 16),
                  fontStyle: ButtonFontStyle.PoppinsMedium15,
                  onTap: () {
                    Get.back();
                    print("object");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
