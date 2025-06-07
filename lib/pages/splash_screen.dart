import 'package:flutter/material.dart';
import 'package:flutter_app/storage/shared_prefs.dart';

// 替换对AppRouter的引用为直接使用router实例
import 'package:flutter_app/router/app_router.dart';
import 'package:flutter_app/utils/logger_util.dart'; // 导入 LoggerUtil

/// SplashScreen 是应用的开屏页。
/// 它是一个 StatefulWidget，表示页面内容可能会动态改变。
class SplashScreen extends StatefulWidget {
  /// 构造函数，用于创建 SplashScreen 实例。
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// 初始化时记录日志，标记开屏页开始加载。
    LoggerUtil.d('开始初始化开屏页');

    /// 延迟 3 秒后执行初始化逻辑。
    Future.delayed(const Duration(seconds: 3), () async {
      LoggerUtil.d('3秒延迟已完成，开始检查 Token');

      /// 调用 SharedPrefs.getToken() 获取本地存储的用户 Token。
      LoggerUtil.d('准备调用 SharedPrefs.getToken()');
      final token = await SharedPrefs.getToken();
      LoggerUtil.d('成功获取到 Token，类型: ${token.runtimeType}, 值: $token');

      /// 检查 Token 是否存在且非空。
      if (token is String && token.isNotEmpty) {
        LoggerUtil.d('Token 存在，开始检查是否已登录');
        router.go('/tabbar'); // 跳转到 TabBar 页面。
      } else {
        LoggerUtil.d('Token 不存在，跳转到 登录 界面');
        router.go('/login'); // 跳转到登录页面。
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 替换图片为一个带有背景颜色的 Container
            Container(
              width: 100,
              height: 100,
              color: Colors.blue, // 设置背景颜色
              child: const Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('欢迎使用 Flutter 应用'),
          ],
        ),
      ),
    );
  }
}