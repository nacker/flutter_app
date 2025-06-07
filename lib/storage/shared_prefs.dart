// 导入 shared_preferences 包，用于本地存储
import 'package:shared_preferences/shared_preferences.dart';

// 扩展 SharedPreferences 类，添加泛型方法支持
extension SharedPreferencesExt on SharedPreferences {
  /// 泛型方法 set，用于存储不同类型的数据
  /// 
  /// 参数:
  /// - [String key] 存储数据的键
  /// - [T value] 存储的数据值，可以是 String, int, double, bool 或 List<String>
  /// 
  /// 返回值:
  /// - 返回一个 Future<bool>，表示存储操作是否成功
  /// 
  /// 异常:
  /// - 如果传入的数据类型不支持，抛出 ArgumentError 异常
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

  /// 泛型方法 get，用于获取不同类型的数据
  /// 
  /// 参数:
  /// - [String key] 获取数据的键
  /// 
  /// 返回值:
  /// - 返回一个 T? 类型的值，表示获取的数据，如果不存在则返回 null
  /// 
  /// 异常:
  /// - 如果传入的数据类型不支持，抛出 ArgumentError 异常
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

/// SharedPrefs 是一个单例类，用于管理应用的本地存储
/// 它封装了 SharedPreferences 的初始化和常用操作
class SharedPrefs {
  // 静态变量 _prefs，用于存储 SharedPreferences 实例
  static late SharedPreferences _prefs;

  /// 初始化 SharedPreferences
  /// 
  /// 返回值:
  /// - 返回一个 Future<void>，表示初始化操作完成
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// 获取存储的 Token
  /// 
  /// 返回值:
  /// - 返回一个 Future<String>，表示存储的 Token 值
  /// - 如果 Token 不存在，则返回空字符串 ''
  static Future<String> getToken() async {
    final token = await _prefs.getString('auth_token') ?? '';
    return token;
  }

  /// 存储 Token
  /// 
  /// 参数:
  /// - [String token] 要存储的 Token 值
  /// 
  /// 返回值:
  /// - 返回一个 Future<void>，表示存储操作完成
  static Future<void> setToken(String token) async {
    await _prefs.set('auth_token', token);
  }

  /// 清除存储的 Token
  /// 
  /// 返回值:
  /// - 返回一个 Future<void>，表示清除操作完成
  static Future<void> clearToken() async {
    await _prefs.remove('auth_token');
  }
}