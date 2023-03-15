import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

// ignore_for_file: must_be_immutable
class HotalDetailsPage extends GetView<HotelController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  // physics: AlwaysScrollableScrollPhysics(),
                  // physics: ScrollPhysics(),
                  // physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.5,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("lbl_details".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                              // controller.hotelDescription.value,
                              "msg_don_t_miss_out_on".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsRegular12Gray50001),
                          SizedBox(
                            height: 17,
                          ),
                          Text("lbl_top_amenities".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900),
                          SizedBox(
                            height: 17,
                          ),
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: size.width * 0.5,
                                childAspectRatio: 7,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              // physics: NeverScrollableScrollPhysics(),
                              // physics: ScrollPhysics(),
                              itemCount: controller.amentiesItems.length,
                              // itemCount: 100,
                              // itemCount:
                              //     controller.hotelAmenties.value.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: getPadding(bottom: 10),
                                  child: Container(
                                    height: 50,
                                    width: size.width,
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgMapYellow900,
                                            height: getVerticalSize(11.00),
                                            width: getHorizontalSize(18.00),
                                            margin: getMargin(top: 1)),
                                        Expanded(
                                          child: Padding(
                                              padding: getPadding(left: 8),
                                              child: Text(
                                                  // controller.hotelAmenties
                                                  //                     .value[index][
                                                  //                 'facilitytype_name'] !=
                                                  //             null &&
                                                  //         controller.hotelAmenties
                                                  //                     .value[index]
                                                  //                 [
                                                  //                 'facilitytype_name'] !=
                                                  //             ""
                                                  //     ? controller
                                                  //             .hotelAmenties
                                                  //             .value[index]
                                                  //         ['facilitytype_name']
                                                  //     : "",
                                                  controller
                                                      .amentiesItems[index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppTextStyle
                                                      .txtPoppinsMedium12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ]),
                  ),
                ))));
  }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
