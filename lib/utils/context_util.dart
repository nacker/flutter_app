// 导入 Flutter 的核心库，用于构建用户界面
import 'package:flutter/material.dart';

/// ContextUtil 是一个工具类，用于管理全局的 BuildContext。
/// 它提供了一个静态方法来初始化和获取当前的 BuildContext。
class ContextUtil {
  // 静态变量 _context，用于存储当前的 BuildContext
  static late BuildContext _context;

  /// init 方法用于初始化 ContextUtil。
  /// 
  /// 参数:
  /// - [BuildContext context] 当前页面的 BuildContext。
  /// 
  /// 该方法将传入的 context 存储到静态变量 _context 中，以便全局使用。
  static void init(BuildContext context) {
    _context = context;
  }

  /// currentContext 是一个静态 getter，用于获取当前的 BuildContext。
  /// 
  /// 返回值:
  /// - 返回当前存储的 BuildContext。
  static BuildContext get currentContext => _context;
}