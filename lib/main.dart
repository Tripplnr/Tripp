import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/app_export.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..boxShadow = <BoxShadow>[]
    ..dismissOnTap = false;

  // ..customAnimation = CustomAnimation();
}

void main() async {
  // Get.put(DestinationController());
  configLoading();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.standard,
        ),
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'TrippInr',
        // home: BottomNavBar(),
        initialBinding: InitialBindings(),
        // initialRoute: AppRoutes.bottom_nav_bar,
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.pages,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          final scale = mediaQueryData.copyWith(textScaleFactor: 1.0);
          // final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
          child = EasyLoading.init()(context, child);
          child = MediaQuery(
              // data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              data: scale,
              child: child);
          return child;
        }
        // home: LogoinPopup(),
        );
  }
}
