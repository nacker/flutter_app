import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 导入 go_router
import 'package:flutter_app/storage/shared_prefs.dart';
import 'package:flutter_app/utils/screen_util.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 设置设计稿尺寸（如 iPhone 6 的 375x667）
    ScreenUtil.setDesignSize(375, 667);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Page',
          style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: ScreenUtil.adaptWidth(200),
          height: ScreenUtil.adaptHeight(50),
          child: ElevatedButton(
            onPressed: () async {
              // 清除登录状态
              await SharedPrefs.clearToken();
              // 使用 go_router 跳转登录页
              context.go('/login');
            },
            child: Text(
              'Logout',
              style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
            ),
          ),
        ),
      ),
    );
  }
}
