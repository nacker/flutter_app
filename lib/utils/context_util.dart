// 导入 Flutter 的核心库，用于构建用户界面
import 'package:flutter/material.dart';

/// ContextUtil 是一个工具类，用于管理全局的 BuildContext。
/// 它提供了一个静态方法来初始化和获取当前的 BuildContext。
/// 这对于需要在非 Widget 上下文中访问 BuildContext 的场景非常有用，
/// 例如在服务类或工具类中进行导航或主题访问。
class ContextUtil {
  // 静态变量 _context，用于存储当前的 BuildContext
  static late BuildContext _context;

  /// init 方法用于初始化 ContextUtil。
  /// 
  /// 参数:
  /// - [BuildContext context] 当前页面的 BuildContext。
  /// 
  /// 该方法将传入的 context 存储到静态变量 _context 中，以便全局使用。
  /// 通常在应用启动时或页面加载时调用此方法。
  static void init(BuildContext context) {
    _context = context;
  }

  /// currentContext 是一个静态 getter，用于获取当前的 BuildContext。
  /// 
  /// 返回值:
  /// - 返回当前存储的 BuildContext。
  /// 
  /// 通过这个 getter，可以在任何地方访问当前的 BuildContext，
  /// 从而实现全局的导航、主题访问等功能。
  static BuildContext get currentContext => _context;
}