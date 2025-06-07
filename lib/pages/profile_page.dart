import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 导入 go_router
import 'package:flutter_app/storage/shared_prefs.dart';
import 'package:flutter_app/utils/screen_util.dart';

/// ProfilePage 是应用的个人资料页面。
/// 它是一个 StatelessWidget，表示页面内容不会动态改变。
class ProfilePage extends StatelessWidget {
  /// 构造函数，用于创建 ProfilePage 实例。
  const ProfilePage({super.key});

  /// build 方法用于构建页面的 UI。
  /// 
  /// 参数:
  /// - [BuildContext context] 提供了页面的上下文信息，用于导航、主题等操作。
  /// 
  /// 返回值:
  /// - 返回一个 Widget，表示页面的根布局。
  @override
  Widget build(BuildContext context) {
    // 设置设计稿尺寸（如 iPhone 6 的 375x667），用于屏幕适配。
    ScreenUtil.setDesignSize(375, 667);

    return Scaffold(
      // 设置页面的 AppBar，显示标题 "Profile Page"。
      appBar: AppBar(
        title: Text(
          'Profile Page', // 标题文本
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
              // 清除本地存储中的登录状态（Token）。
              await SharedPrefs.clearToken();
              // 使用 go_router 跳转到登录页 ('/login')。
              context.go('/login');
            },
            child: Text(
              'Logout', // 按钮文本
              style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)), // 设置字体大小，基于屏幕适配
            ),
          ),
        ),
      ),
    );
  }
}
