import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_blog_widget.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_list_widget.dart';
import 'package:trippinr/presentation/home/widgets/home_top_widget.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

import 'controller/home_controller.dart';

// ignore_for_file: must_be_immutable
class Home extends GetView<HomeController> {
  var hotelController = Get.find<HotelController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: AppDecoration.fillGray100,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HomeTopWidget(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: size.width,
                                decoration: AppDecoration.fillGray100,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    HomeHotelBlogWidget(),
                                    HomeHotelListWidget(),
                                    SizedBox(
                                      height: 60,
                                    ),
                                  ],
                                ),
                              ),
                              // =====
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
