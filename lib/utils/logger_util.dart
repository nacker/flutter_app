import 'package:logger/logger.dart';

class LoggerUtil {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // 打印方法调用层级
      errorMethodCount: 8,
      lineLength: 120,
      colors: true, // 彩色输出
      printEmojis: true,
      printTime: true, // 显示时间
    ),
  );

  static void v(String message) => _logger.v(message);
  static void d(String message) => _logger.d(message);
  static void i(String message) => _logger.i(message);
  static void w(String message) => _logger.w(message);
  static void e(String message) => _logger.e(message);
  static void wtf(String message) => _logger.wtf(message); // WTF 日志（Should not happen）
}
