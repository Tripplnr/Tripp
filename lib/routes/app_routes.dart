import 'package:get/get.dart';
import 'package:trippinr/presentation/blogs/binding/blogs_binding.dart';
import 'package:trippinr/presentation/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:trippinr/presentation/destination/binding/destination_binding.dart';
import 'package:trippinr/presentation/destination/destination.dart';
import 'package:trippinr/presentation/forgot/forgot_password_screen.dart';
import 'package:trippinr/presentation/hotel/binding/hotel_binding.dart';
import 'package:trippinr/presentation/hotel/hotel.dart';
import 'package:trippinr/presentation/hotel/hotel_list.dart';
import 'package:trippinr/presentation/map/map_screen.dart';
import 'package:trippinr/presentation/register/binding/register_binding.dart';
import 'package:trippinr/presentation/register/register_screen.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';
import 'package:trippinr/presentation/settings/binding/settings_binding.dart';
import 'package:trippinr/presentation/settings/currency.dart';
import 'package:trippinr/presentation/splash/binding/splash_binding.dart';
import 'package:trippinr/presentation/splash/splash.dart';

import '../presentation/forgot/binding/forgot_password_binding.dart';
import '../presentation/home/binding/home_binding.dart';
import '../presentation/login/binding/login_binding.dart';
import '../presentation/login/login.dart';
import '../presentation/map/binding/map_binding.dart';
import '../presentation/search_tab_bar/binding/search_tab_bar_binding.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String bottom_nav_bar = '/bottom-nav-bar';
  static const String bottom_nav_bar_view_deals = '/bottom-nav-bar-view-deals';
  static const String home = '/home';
  static const String destination = '/destination';
  static const String hotel_home = '/hotel-home';
  static const String hotel_search = '/hotel-search';
  static const String hotel_list = '/hotel-list';
  static const String currency = '/currency';
  static const String favourite_details = '/favourite-details';
  static const String forgot = '/forgot-password';
  static const String map = '/map';
  static const String search_tab_bar = '/search-tab-bar';

  static List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => Splash(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: login,
      page: () => Login(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: register,
      page: () => RegisterScreen(),
      bindings: [
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: bottom_nav_bar,
      page: () => BottomNavBar(),
      bindings: [
        BottomNavBarBinding(),
        BlogsBinding(),
        DestinationBinding(),
      ],
    ),
    GetPage(
      name: bottom_nav_bar_view_deals,
      page: () => BottomNavBar(
        index: 1,
      ),
      bindings: [
        BottomNavBarBinding(),
        BlogsBinding(),
        DestinationBinding(),
      ],
    ),
    GetPage(
      name: home,
      page: () => HotelList(),
      bindings: [
        HotelBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: destination,
      page: () => Destination(),
      bindings: [
        DestinationBinding(),
      ],
    ),
    GetPage(
      name: hotel_home,
      page: () => Hotel(callFrom: 'Home'),
      bindings: [
        HotelBinding(),
      ],
    ),
    GetPage(
      name: hotel_search,
      page: () => Hotel(callFrom: 'Search'),
      bindings: [
        HotelBinding(),
      ],
    ),
    GetPage(
      name: map,
      page: () => MapScreen(),
      bindings: [
        MapBinding(),
      ],
    ),
    GetPage(
      name: forgot,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: hotel_list,
      page: () => HotelList(),
      bindings: [
        HotelBinding(),
      ],
    ),
    // GetPage(
    //   name: favourite_details,
    //   page: () => FavouriteItem(),
    //   bindings: [
    //     FavouriteBinding(),
    //   ],
    // ),
    GetPage(
      name: currency,
      page: () => Currency(),
      bindings: [
        SettingsBinding(),
      ],
    ),
    GetPage(
      name: search_tab_bar,
      page: () => SearchTabBar(),
      bindings: [
        SearchTabBarBinding(),
      ],
    ),
  ];
}
