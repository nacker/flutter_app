// 导入Flutter的核心库和第三方库
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/storage/shared_prefs.dart'; // 用于存储用户Token
import 'package:flutter_app/utils/screen_util.dart'; // 导入 ScreenUtil 实现屏幕适配
import 'package:go_router/go_router.dart'; // 新增 go_router 导入，用于页面导航

/// LoginPage 是应用的登录页面。
/// 它是一个 StatelessWidget，表示页面内容不会动态改变。
class LoginPage extends StatelessWidget {
  /// 构造函数，用于创建 LoginPage 实例。
  const LoginPage({super.key});

  /// build 方法用于构建页面的 UI。
  /// 
  /// 参数:
  /// - [BuildContext context] 提供了页面的上下文信息，用于导航、主题等操作。
  /// 
  /// 返回值:
  /// - 返回一个 Widget，表示页面的根布局。
  @override
  Widget build(BuildContext context) {
    // 设置设计稿尺寸（例如 iPhone 6 的 375x667），用于屏幕适配。
    ScreenUtil.setDesignSize(375, 667);

    return Scaffold(
      // 设置页面的 AppBar，显示标题 "Login Page"。
      appBar: AppBar(
        title: Text(
          'Login Page', // 标题文本
          style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)), // 设置字体大小，基于屏幕适配
        ),
      ),
      // 设置页面的主体内容。
      body: Center(
        // Center 组件用于将子组件居中显示。
        child: SizedBox(
          width: ScreenUtil.adaptWidth(200), // 设置按钮宽度，基于屏幕适配
          height: ScreenUtil.adaptHeight(50), // 设置按钮高度，基于屏幕适配
          child: ElevatedButton(
            onPressed: () async {
              // 存储 Token 到本地存储中，模拟用户登录成功。
              await SharedPrefs.setToken('your_simulated_jwt_token');
              // 使用 go_router 跳转到首页 ('/')。
              context.go('/');
            },
            child: Text(
              'Login', // 按钮文本
              style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)), // 设置字体大小，基于屏幕适配
            ),
          ),
        ),
      ),
    );
  }
}
