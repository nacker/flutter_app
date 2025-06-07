import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:go_router/go_router.dart'; // 导入 ScreenUtil

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 设置设计稿尺寸（如 iPhone 6 的 375x667）
    ScreenUtil.setDesignSize(375, 667);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: ScreenUtil.adaptWidth(200),
          height: ScreenUtil.adaptHeight(50),
          child: ElevatedButton(
            onPressed: () {
              // 示例：跳转到登录页
               context.push('/login');
            },
            child: Text(
              'Go to Login',
              style: TextStyle(fontSize: ScreenUtil.adaptFontSize(16)),
            ),
          ),
        ),
      ),
    );
  }
}