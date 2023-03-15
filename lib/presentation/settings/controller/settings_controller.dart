import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/sharedpref_helper/pref_helper.dart';

class SettingsController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  var unitSelected = "Kms".obs;
  var index = 0.obs;
  var isLoading = false.obs;
  var data = "".obs;
  var termOfUse = "".obs;
  var privacyPolicy = "".obs;
  var aboutUs = "".obs;
  updatedVariable() {
    data.value = textEditingController.value.text.toString();
    print(data.value);
  }

  onselected() {
    textEditingController.value =
        TextEditingValue(selection: TextSelection.collapsed(offset: 0));
    Get.toNamed(AppRoutes.currency);
  }

  onLogout() {
    SharedPref.clear();

    print("google auth ${GoogleAuthHelper().alreadySignIn()}");
    GoogleAuthHelper().alreadySignIn().then((value) {
      if (value) {
        GoogleAuthHelper().googleSignOutProcess();
        print("value is 11");
        return;
      }
    });
    print("value is 22");
    Get.toNamed(AppRoutes.bottom_nav_bar);
  }

  var currencyList = [
    "USD - United States Dollar",
    "DKK - Danish Krone",
    "CAD - Canadian Dollar",
    "SAR - Saudi Riyal",
    "SEK - Swedish Krona",
    "SGD - Singapore Dollar",
    "THB - Thai Baht"
  ].obs;

  var tempcurrencyList = [].obs;

  onTap() {
    tempcurrencyList.value;
  }

  onTapLegalInformation() async {
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.termOfUseAPI,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        termOfUse.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  onTapPrivacyPolicy() async {
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.aboutUsAPI,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        privacyPolicy.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  onTapAboutUs() async {
    print("aboutt..........");
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.aboutUsAPI,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        aboutUs.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  unitTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        unitSelected.value = text;

        print("===>>> ${unitSelected.value}");
      },
      child: Container(
        // width: 115,
        // height: 35,
        // decoration: BoxDecoration(color: ColorConstant.gray10001),
        child: Center(
          child: Container(
            height: 29,
            width: 50,
            decoration: BoxDecoration(
              color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
              borderRadius: BorderRadius.circular(48),
            ),
            child: Center(
              child: Text(text,
                  style: TextStyle(
                    color:
                        isSelected ? ColorConstant.white : ColorConstant.black,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  currencySearchItems(String searchItem) {
    List results = [];
    if (searchItem.isEmpty) {
      results = currencyList;
    } else {
      results = currencyList
          .where((user) => user[index.value]
              .toString()
              .toLowerCase()
              .contains(searchItem.toLowerCase()))
          .toList();
    }
    tempcurrencyList.value = results;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tempcurrencyList.value = currencyList;
    data.value = "USD";
    onTapLegalInformation();
    onTapAboutUs();
    onTapPrivacyPolicy();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
