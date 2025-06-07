import 'package:flutter_app/network/dio_client.dart';

class AppConfig {
  // 当前环境
  static Environment environment = Environment.prod;

  // 初始化环境（可在 main 中调用）
  static void init({Environment env = Environment.prod}) {
    environment = env;
  }

  // 获取当前 Base URL
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
