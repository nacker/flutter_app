import 'package:shared_preferences/shared_preferences.dart';

// 扩展方法：支持任意类型数据的存取
extension SharedPreferencesExt on SharedPreferences {
  Future<bool> set<T>(String key, T value) async {
    if (value is String) {
      return setString(key, value);
    } else if (value is int) {
      return setInt(key, value);
    } else if (value is double) {
      return setDouble(key, value);
    } else if (value is bool) {
      return setBool(key, value);
    } else if (value is List<String>) {
      return setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported type for SharedPreferences.set');
    }
  }

  T? get<T>(String key) {
    if (T == String) {
      return getString(key) as T?;
    } else if (T == int) {
      return getInt(key) as T?;
    } else if (T == double) {
      return getDouble(key) as T?;
    } else if (T == bool) {
      return getBool(key) as T?;
    } else if (T == List<String>) {
      return getStringList(key) as T?;
    } else {
      throw ArgumentError('Unsupported type for SharedPreferences.get');
    }
  }
}

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 获取 Token
  static Future<String> getToken() async {
    final token = await _prefs.getString('auth_token') ?? '';
    return token;
  }

  // 存储 Token
  static Future<void> setToken(String token) async {
    await _prefs.set('auth_token', token);
  }

  // 清除 Token
  static Future<void> clearToken() async {
    await _prefs.remove('auth_token');
  }
}