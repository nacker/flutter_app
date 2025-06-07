import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/utils/context_util.dart'; // 导入 ContextUtil
import 'package:flutter_app/utils/logger_util.dart'; // 导入 LoggerUtil

class ScreenUtil {
  // 设计稿宽度（如 iPhone 6 的 375）
  static double _designWidth = 375;

  // 设计稿高度（如 iPhone 6 的 667）
  static double _designHeight = 667;

  // 是否已初始化监听
  static bool _isInitialized = false;

  // 初始化设计尺寸 & 屏幕变化监听
  static void setDesignSize(double width, double height) {
    _designWidth = width;
    _designHeight = height;

    if (!_isInitialized) {
      _isInitialized = true;
      WidgetsBinding.instance.addObserver(_ScreenUtilObserver());
    }
  }

  // 根据屏幕宽度缩放
  static double adaptWidth(double width) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return width * (mediaQuery.size.width / _designWidth);
  }

  // 根据屏幕高度缩放
  static double adaptHeight(double height) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return height * (mediaQuery.size.height / _designHeight);
  }

  // 自适应字体大小
  static double adaptFontSize(double fontSize) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    return fontSize * mediaQuery.textScaleFactor;
  }

  // 自适应尺寸（宽高比例适配）
  static double adaptSize(double size) {
    final mediaQuery = MediaQuery.of(ContextUtil.currentContext);
    final widthRatio = mediaQuery.size.width / _designWidth;
    final heightRatio = mediaQuery.size.height / _designHeight;
    return size * (widthRatio + heightRatio) / 2;
  }
}

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