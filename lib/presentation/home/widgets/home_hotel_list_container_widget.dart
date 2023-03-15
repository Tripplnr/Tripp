import 'package:trippinr/core/app_export.dart';

import '../controller/home_controller.dart';

class HomeHotelListContainerWidget extends GetView<HomeController> {
  int? index;

  HomeHotelListContainerWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // color: Colors.black,
        // height: 100,
        width: 192,
        margin: getMargin(
          right: 8,
        ),
        padding: getPadding(
          left: 5,
          top: 4,
          right: 5,
          bottom: 4,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder9,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              // url: controller.popularHotelsList.value[index!].maxPhotoUrl,
              imagePath: ImageConstant.imgRectangle23915,
              height: getVerticalSize(
                95.00,
              ),
              fit: BoxFit.cover,
              width: getHorizontalSize(
                182.00,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  10.00,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 5, left: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        "lbl_marriott".tr,
                        // controller.popularHotelsList.value[index!].hotelName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium14,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(
                        14.00,
                      ),
                      width: getSize(
                        14.00,
                      ),
                      margin: getMargin(
                        left: 3,
                        top: 4,
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        top: 2,
                      ),
                      child: Text(
                        // controller.popularHotelsList.value[index!].reviewScore
                        //     .toString(),
                        "lbl_3_5".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 5,
                top: 4,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLocation,
                    height: getSize(
                      16.00,
                    ),
                    width: getSize(
                      16.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Text(
                        // "jsdh",
                        // "${controller.popularHotelsList.value[index!].city} ${controller.popularHotelsList.value[index!].countryTrans}",
                        "lbl_milan_italy".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
