// 导入Flutter的核心库
import 'package:flutter/material.dart';

/// HomePage 是应用的主页页面。
/// 它是一个 StatelessWidget，表示页面内容不会动态改变。
class HomePage extends StatelessWidget {
  /// 构造函数，用于创建 HomePage 实例。
  const HomePage({Key? key}) : super(key: key);

  /// build 方法用于构建页面的 UI。
  /// 
  /// 参数:
  /// - [BuildContext context] 提供了页面的上下文信息，用于导航、主题等操作。
  /// 
  /// 返回值:
  /// - 返回一个 Widget，表示页面的根布局。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置页面的 AppBar，显示标题 "Home Page"。
      appBar: AppBar(
        title: const Text('Home Page'), // 标题文本
      ),
      // 设置页面的主体内容。
      body: const Center(
        // Center 组件用于将子组件居中显示。
        child: Text(
          'Welcome to the Home Page!', // 显示欢迎文本。
          style: TextStyle(fontSize: 20), // 设置文本样式，字体大小为 20。
        ),
      ),
    );
  }
}