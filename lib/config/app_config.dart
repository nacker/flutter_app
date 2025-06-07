/// 引入网络请求客户端模块，用于后续的网络请求操作。
import 'package:flutter_app/network/dio_client.dart';

/// AppConfig 类用于管理应用的全局配置信息。
/// 该类包含了当前环境的设置、环境初始化方法以及获取当前环境 Base URL 的方法。
class AppConfig {
  /// 当前应用所处的环境，默认为生产环境。
  /// 环境类型由 [Environment] 枚举定义，可在不同环境下使用不同的配置。
  static Environment environment = Environment.prod;

  /// 初始化应用的运行环境，可在 main 函数中调用此方法。
  /// 
  /// 参数 [env] 为要设置的环境，默认为生产环境 [Environment.prod]。
  static void init({Environment env = Environment.prod}) {
    environment = env;
  }

  /// 获取当前环境对应的 Base URL。
  /// 
  /// 根据 [environment] 的值返回不同环境的 Base URL。
  /// - 开发环境 [Environment.dev] 返回 'https://api.dev.example.com'。
  /// - 测试环境 [Environment.test] 返回 'https://api.test.example.com'。
  /// - 生产环境 [Environment.prod] 返回 'https://api.example.com'。
  static String get baseUrl {
    switch (environment) {
      case Environment.dev:
        return 'https://api.dev.example.com';
      case Environment.test:
        return 'https://api.test.example.com';
      case Environment.prod:
        return 'https://api.example.com';
    }
  }
}