import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<void> setToken(String token) async {
    if (_prefs == null) await init();
    await _prefs?.setString("token", token);
  }

  static String? getToken() {
    if (_prefs == null) init();
    return _prefs?.getString("token");
  }

  static Future<void> setName(String name) async {
    if (_prefs == null) await init();
    await _prefs?.setString("name", name);
  }

  static String? getName() {
    if (_prefs == null) init();
    return _prefs?.getString("name");
  }

  static Future<void> setEmail(String email) async {
    if (_prefs == null) await init();
    await _prefs?.setString("email", email);
  }

  static String? getEmail() {
    if (_prefs == null) init();
    return _prefs?.getString("email");
  }

  static Future<void> setPhone(String phone) async {
    if (_prefs == null) await init();
    await _prefs?.setString("phone", phone);
  }

  static String? getPhone() {
    if (_prefs == null) init();
    return _prefs?.getString("phone");
  }

  static Future<void> setRole(String role) async {
    if (_prefs == null) await init();
    await _prefs?.setString("role", role);
  }

  static String? getRole() {
    if (_prefs == null) init();
    return _prefs?.getString("role");
  }

  static Future<void> onlyLogOut() async {
    if (_prefs == null) await init();
    await _prefs!.setString("token", "");
  }

  static String? readPrefStr(String key) {
    if (_prefs == null) init();
    return _prefs!.getString(key);
  }

  static Future<bool> saveStr(String key, String value) async {
    if (_prefs == null) await init();
    return await _prefs!.setString(key, value);
  }

  static bool isLoggedIn() {
    if (_prefs == null) init();
    return _prefs!.getString("token")?.isNotEmpty ?? false;
  }

  static Future<void> logOut() async {
    if (_prefs == null) await init();
    await _prefs!.clear();
  }
}
