import 'package:flutter/gestures.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

// ignore_for_file: must_be_immutable
class HotalReviewPage extends GetView<HotelController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  // "${controller.hotelReviews.value.count} Reviews",
                  "15 Reviews",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold16Black900,
                ),
                ListView.separated(
                  padding: getPadding(bottom: 10, top: 10),
                  // physics: NeverScrollableScrollPhysics(),
                  physics: ScrollPhysics(),

                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getVerticalSize(
                        11.00,
                      ),
                    );
                  },
                  // itemCount: controller.hotelReviews.value.result!.length,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return HotalReviewItemWidget(
                      index: index,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HotalReviewItemWidget extends GetView<HotelController> {
  int? index;

  HotalReviewItemWidget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse1266,
          // url: controller.hotelReviews.value.result![index!].author!.avatar !=
          //         null
          //     ? controller.hotelReviews.value.result![index!].author!.avatar
          //     : "https://www.w3schools.com/howto/img_avatar.png",
          height: getSize(
            50.00,
          ),
          width: getSize(
            50.00,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              25.00,
            ),
          ),
          margin: getMargin(
            bottom: 40,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              // "${controller.hotelReviews.value.result![index!].author!.name}",
              "lbl_malcolm_johnson".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppTextStyle.txtPoppinsSemiBold14Black90002,
            ),
            Container(
              width: getHorizontalSize(
                213.00,
              ),
              margin: getMargin(
                top: 2,
              ),
              child: buildRichTextReadMore(
                  // controller.hotelReviews.value.result![index!].pros!,
                  // index!,
                  "Love their drink specials. Bartenders super nice. Spent a week at UCSF andLove their drink specials. Bartenders super nice. Spent a week at UCSF and${index}",
                  index!),
            ),
          ],
        ),
        CustomButton(
          height: 24,
          width: 48,
          // text: controller.hotelReviews.value.result![index!].averageScore!
          //     .toStringAsFixed(1),
          text: "3.0",
          margin: getMargin(
            bottom: 51,
          ),
          variant: ButtonVariant.FillAmber60019,
          shape: ButtonShape.RoundedBorder7,
          padding: ButtonPadding.PaddingT2,
          fontStyle: ButtonFontStyle.PoppinsSemiBold12,
          prefixWidget: Container(
            margin: getMargin(
              right: 2,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgStarAmber600,
            ),
          ),
        ),
      ],
    );
  }

  buildRichTextReadMore(String text, int index) {
    return Obx(() {
      return Text.rich(
        TextSpan(
          text: controller.isExpanded[index]
              ? text
              : text.length > 50
                  ? text.substring(0, 50)
                  : text,
          children: [
            TextSpan(
              text: text.length > 50 && !controller.isExpanded[index]
                  ? "... "
                  : " ",
              style: TextStyle(
                color: ColorConstant.gray60001,
                fontSize: getFontSize(
                  12,
                ),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            if (text.length > 20)
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Single tapped.
                    controller.updateReadMore(index);
                  },
                text:
                    controller.isExpanded[index] ? "Read less" : "Read more".tr,
                style: TextStyle(
                  color: ColorConstant.yellow900,
                  fontSize: getFontSize(
                    12,
                  ),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
          ],
        ),
        textAlign: TextAlign.left,
      );
    });
  }
}
