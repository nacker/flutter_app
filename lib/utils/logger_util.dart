// 导入 logger 包，用于日志记录
import 'package:logger/logger.dart';

/// LoggerUtil 是一个工具类，用于统一管理应用的日志记录。
/// 它封装了 logger 包的功能，提供了简单易用的日志记录方法。
class LoggerUtil {
  // 创建 Logger 实例，配置日志输出格式
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // 打印方法调用层级，最多显示2层
      errorMethodCount: 8, // 错误日志中打印的方法调用层级，最多显示8层
      lineLength: 120, // 每行日志的最大长度
      colors: true, // 启用彩色输出，便于区分不同级别的日志
      printEmojis: true, // 启用表情符号，使日志更易读
      printTime: true, // 显示日志记录的时间戳
    ),
  );

  /// v 方法用于记录 Verbose 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录最详细的日志信息，通常在开发调试时使用。
  static void v(String message) => _logger.v(message);

  /// d 方法用于记录 Debug 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录调试信息，帮助开发者理解程序运行状态。
  static void d(String message) => _logger.d(message);

  /// i 方法用于记录 Info 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录重要的业务逻辑信息，帮助开发者跟踪程序运行流程。
  static void i(String message) => _logger.i(message);

  /// w 方法用于记录 Warning 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录潜在的问题或异常情况，提示开发者注意可能的风险。
  static void w(String message) => _logger.w(message);

  /// e 方法用于记录 Error 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录程序运行中出现的错误，帮助开发者定位问题。
  static void e(String message) => _logger.e(message);

  /// wtf 方法用于记录 WTF (What a Terrible Failure) 级别的日志。
  /// 
  /// 参数:
  /// - [String message] 要记录的日志消息。
  /// 
  /// 使用场景: 用于记录不应该发生的情况，通常表示严重的错误或异常。
  static void wtf(String message) => _logger.wtf(message); // WTF 日志（Should not happen）
}