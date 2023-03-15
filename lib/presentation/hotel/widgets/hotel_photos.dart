import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HotelPhotos extends GetView<HotelController> {
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
            // physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.custom(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  physics: ScrollPhysics(),

                  semanticChildCount: controller.imgListPhotos.length,
                  // semanticChildCount: controller.hotelPhotos.value.length,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  padding: getPadding(bottom: 20),
                  childrenDelegate: SliverChildBuilderDelegate(
                    // childCount: controller.hotelPhotos.value.length,
                    childCount: controller.imgListPhotos.length,
                    // childCount: controller.imgList.length,
                    (context, index) => Image.network(
                      controller.imgListPhotos[index],
                      // controller.hotelPhotos.value[index]['url_1440'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
