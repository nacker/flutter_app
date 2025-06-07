// 导入 Flutter 的 Material 库，用于构建主题相关的组件
import 'package:flutter/material.dart';

/// AppTheme 类用于定义应用的主题配置。
/// 它提供了两种主题：亮色主题（lightTheme）和暗色主题（darkTheme）。
class AppTheme {
  /// lightTheme 是应用的亮色主题配置。
  /// 它使用 Material Design 的颜色方案，并启用了 Material 3 设计。
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, // 使用深紫色作为种子颜色生成颜色方案
    ), // 使用 Material Design 的颜色方案
    useMaterial3: true, // 启用 Material 3 设计
  );

  /// darkTheme 是应用的暗色主题配置。
  /// 它使用 Material Design 的暗色模式，并启用了 Material 3 设计。
  static final darkTheme = ThemeData(
    brightness: Brightness.dark, // 设置为暗色模式
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, // 使用深紫色作为种子颜色生成暗色模式的颜色方案
      brightness: Brightness.dark, // 指定暗色模式
    ), // 使用 Material Design 的暗色模式
    useMaterial3: true, // 启用 Material 3 设计
  );
}