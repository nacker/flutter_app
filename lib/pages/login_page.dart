import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/storage/shared_prefs.dart';
import 'package:flutter_app/utils/screen_util.dart'; // 导入 ScreenUtil
import 'package:go_router/go_router.dart'; // 新增 go_router 导入

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 设置设计稿尺寸（例如 iPhone 6 的 375x667）
    ScreenUtil.setDesignSize(375, 667);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: ScreenUtil.adaptWidth(200),
          height: ScreenUtil.adaptHeight(50),
          child: ElevatedButton(
            onPressed: () async {
              // 存储 Token 并跳转首页
              await SharedPrefs.setToken('your_simulated_jwt_token');
              // 使用 go_router 跳转首页
              context.go('/');
            },
            child: Text(
              'Login',
              style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
            ),
          ),
        ),
      ),
    );
  }
}
