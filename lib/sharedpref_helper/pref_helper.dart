import 'package:shared_preferences/shared_preferences.dart';

class SharedPref
{
  static SharedPreferences? _preferences;
  static SharedPref? instance;
  static var TOKEN = "TOKEN";
  final Future<SharedPreferences> pref =  SharedPreferences.getInstance();

  static Future<String?> getAuthToken()async
  {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString(TOKEN);

  }

  static Future<bool> setAuthToken(String value)async
  {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.setString(TOKEN, value);
  }

  static Future<Future<bool>> clear()async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

}