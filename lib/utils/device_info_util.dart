// 导入 Dart 的 io 库，用于获取平台信息
import 'dart:io';

// 导入 device_info_plus 插件，用于获取设备信息
import 'package:device_info_plus/device_info_plus.dart';

/// DeviceInfoUtil 是一个工具类，用于获取设备信息。
/// 它提供了获取设备唯一标识符的方法，支持 Android 和 iOS 平台。
class DeviceInfoUtil {
  /// getDeviceId 是一个异步方法，用于获取设备的唯一标识符。
  /// 
  /// 返回值:
  /// - 返回一个 Future<String?>，表示设备的唯一标识符。
  ///   - 对于 Android 设备，返回设备的 ID。
  ///   - 对于 iOS 设备，返回设备的供应商标识符 (identifierForVendor)。
  ///   - 如果无法获取设备信息或设备类型不受支持，返回 null。
  /// 
  /// 异常:
  /// - 如果在获取设备信息时发生错误，可能会抛出异常。
  static Future<String?> getDeviceId() async {
    // 创建 DeviceInfoPlugin 实例，用于获取设备信息
    final deviceInfo = DeviceInfoPlugin();
    
    // 检查当前运行的平台
    if (Platform.isAndroid) {
      // 获取 Android 设备信息
      final info = await deviceInfo.androidInfo;
      // 返回 Android 设备的 ID
      return info.id;
    } else if (Platform.isIOS) {
      // 获取 iOS 设备信息
      final info = await deviceInfo.iosInfo;
      // 返回 iOS 设备的供应商标识符
      return info.identifierForVendor;
    }
    
    // 如果设备类型不受支持，返回 null
    return null;
  }
}