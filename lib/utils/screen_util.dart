// 导入 Flutter 的 Material 库，用于构建用户界面
import 'package:flutter/material.dart';
// 导入 Flutter 的 widgets 库，用于基础 UI 组件
import 'package:flutter/widgets.dart';
// 导入 ContextUtil 工具类，用于管理全局 BuildContext
import 'package:flutter_app/utils/context_util.dart';
// 导入 LoggerUtil 工具类，用于统一管理日志记录
import 'package:flutter_app/utils/logger_util.dart';

/// ScreenUtil 是一个工具类，用于实现屏幕适配。
/// 它提供了根据设计稿尺寸动态调整 UI 元素大小的方法。
/// 通过设置设计稿的宽度和高度，可以确保在不同屏幕尺寸上的 UI 保持一致的比例。
class ScreenUtil {
  // 设计稿宽度（如 iPhone 6 的 375）
  static double _designWidth = 375;

  // 设计稿高度（如 iPhone 6 的 667）
  static double _designHeight = 667;

  // 是否已初始化监听
  static bool _isInitialized = false;

  /// setDesignSize 方法用于设置设计稿的宽度和高度。
  /// 这些值将用于计算屏幕适配的比例。
  /// 
  /// 参数:
  /// - [double width] 设计稿的宽度
  /// - [double height] 设计稿的高度
  /// 
  /// 返回值: 无
  static void setDesignSize(double width, double height) {
    _designWidth = width;
    _designHeight = height;

    if (!_isInitialized) {
      _isInitialized = true;
      WidgetsBinding.instance.addObserver(_ScreenUtilObserver());
    }
  }

  /// adaptWidth 方法用于根据屏幕宽度缩放 UI 元素的宽度。
  /// 
  /// 参数:
  /// - [double width] 设计稿中的宽度值
  /// 
  /// 返回值:
  /// - 返回一个 double 类型的值，表示缩放后的宽度
  static double adaptWidth(double width) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return width * (mediaQuery.size.width / _designWidth);
  }

  /// adaptHeight 方法用于根据屏幕高度缩放 UI 元素的高度。
  /// 
  /// 参数:
  /// - [double height] 设计稿中的高度值
  /// 
  /// 返回值:
  /// - 返回一个 double 类型的值，表示缩放后的高度
  static double adaptHeight(double height) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return height * (mediaQuery.size.height / _designHeight);
  }

  /// adaptFontSize 方法用于根据屏幕密度缩放字体大小。
  /// 
  /// 参数:
  /// - [double fontSize] 设计稿中的字体大小
  /// 
  /// 返回值:
  /// - 返回一个 double 类型的值，表示缩放后的字体大小
  static double adaptFontSize(double fontSize) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return fontSize * mediaQuery.textScaleFactor;
  }

  /// adaptSize 方法用于根据屏幕宽高比例缩放 UI 元素的尺寸。
  /// 它综合考虑了宽度和高度的比例，适用于需要同时调整宽高的情况。
  /// 
  /// 参数:
  /// - [double size] 设计稿中的尺寸值
  /// 
  /// 返回值:
  /// - 返回一个 double 类型的值，表示缩放后的尺寸
  static double adaptSize(double size) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    final widthRatio = mediaQuery.size.width / _designWidth;
    final heightRatio = mediaQuery.size.height / _designHeight;
    return size * (widthRatio + heightRatio) / 2;
  }
}

/// _ScreenUtilObserver 是一个内部类，继承自 WidgetsBindingObserver。
/// 它用于监听屏幕尺寸的变化，并在变化时输出日志。
/// 这有助于调试和优化不同屏幕尺寸下的 UI 表现。
class _ScreenUtilObserver extends WidgetsBindingObserver {
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // 输出屏幕变化日志
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    LoggerUtil.i('Screen metrics changed: ${mediaQuery.size}');

    // 示例：触发 UI 刷新（需要 Provider、Riverpod 等支持）
    // Provider.of<ThemeModel>(ContextUtil.currentContext, listen: false).refreshUI();
  }
}