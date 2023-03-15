import 'package:flutter_html/flutter_html.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/settings/controller/settings_controller.dart';

class TermOfUse extends GetWidget<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: ColorConstant.yellow900,
                height: getVerticalSize(100.00),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      // margin: getMargin(left: 20),
                      // ),
                      AppbarImage(
                          height: getSize(24.00),
                          width: getSize(24.00),
                          svgPath: ImageConstant.imgArrowleft,
                          color: ColorConstant.whiteA700,
                          margin: getMargin(
                            left: 20,
                          ),
                          onTap: () {
                            // Get.back(canPop: true);
                            Navigator.pop(context);
                          }),
                      AppbarSubtitle(text: "Term of use".tr),
                      Container(margin: getMargin(right: 24)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
              Obx(() {
                return Html(data: controller.termOfUse.value.toString());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
