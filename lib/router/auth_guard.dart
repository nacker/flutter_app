// 导入Flutter的核心库
import 'package:flutter/material.dart';
// 导入GoRouter库，用于路由管理
import 'package:go_router/go_router.dart';
// 导入本地存储工具，用于获取用户Token
import 'package:flutter_app/storage/shared_prefs.dart';

/// AuthGuard 类用于处理应用的认证逻辑。
/// 它包含一个静态方法 `checkAuth`，用于检查用户是否已认证。
class AuthGuard {
  /// checkAuth 是一个异步方法，用于检查用户是否已认证。
  /// 
  /// 参数:
  /// - [BuildContext context] 提供了页面的上下文信息，用于导航操作。
  /// 
  /// 返回值:
  /// - 返回一个布尔值，表示用户是否已认证。
  ///   - 如果用户已认证（Token存在且非空），返回 true。
  ///   - 如果用户未认证（Token不存在或为空），返回 false，并跳转到登录页。
  static Future<bool> checkAuth(BuildContext context) async {
    // 从本地存储中获取用户Token
    final token = await SharedPrefs.getToken();
    if (token.isEmpty) {
      // 如果Token为空，说明用户未登录，跳转到登录页
      context.go('/login');
      return false;
    }
    // 如果Token存在且非空，说明用户已登录
    return true;
  }
}