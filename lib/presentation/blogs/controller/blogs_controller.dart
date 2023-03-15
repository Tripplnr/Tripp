import 'package:trippinr/core/app_export.dart';

class BlogsController extends GetxController {
  TextEditingController searchController = TextEditingController();

  var searchText = ''.obs;
  var isLoading = false.obs;
  var searchResults = [].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // frameOneController.dispose();
  }
}
