import 'package:trippinr/core/app_export.dart';

import '../../core/utils/static_models.dart';
import '../blogs/widgets/blogs_item_widget.dart';
import 'controller/blogs_controller.dart';

class Blogs extends GetWidget<BlogsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            // margin: getMargin(top: 100),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 10,
                  // ),
                  CustomSearchView(
                    width: size.width * 0.8,
                    height: 42.0,
                    focusNode: FocusNode(),
                    // controller: controller.frameOneController,
                    hintText: "lbl_search_blogs".tr,
                    prefix: Container(
                      margin: getMargin(
                        left: 10,
                        right: 8,
                        bottom: 5,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearchYellow900,
                      ),
                    ),
                    // prefixConstraints: BoxConstraints(
                    //   maxHeight: getVerticalSize(
                    //       // 42.00,
                    //       ),
                    // ),
                  ),
                  Padding(
                    padding: getPadding(
                      // top: 14,
                      top: 14,
                    ),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                            // height: getVerticalSize(
                            //   14.00,
                            // ),
                            );
                      },
                      itemCount: list_blogs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            BlogsItemWidget(data: list_blogs[index]),
                            SizedBox(
                              height: 0,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
