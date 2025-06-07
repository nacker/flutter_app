// 导入 intl 包，用于日期和时间的格式化和解析
import 'package:intl/intl.dart';

/// DateUtil 是一个工具类，提供了日期和时间相关的常用方法。
/// 它使用 intl 包来处理日期格式化和解析。
class DateUtil {
  // 常用日期格式
  /// 默认日期时间格式，格式为 "yyyy-MM-dd HH:mm:ss"
  static const String formatDefault = 'yyyy-MM-dd HH:mm:ss';
  
  /// 日期格式，格式为 "yyyy-MM-dd"
  static const String formatDate = 'yyyy-MM-dd';
  
  /// 时间格式，格式为 "HH:mm:ss"
  static const String formatTime = 'HH:mm:ss';
  
  /// 日期时间格式，格式为 "yyyy-MM-dd HH:mm"
  static const String formatDateTime = 'yyyy-MM-dd HH:mm';

  /// 格式化日期时间
  /// 
  /// 参数:
  /// - [DateTime date] 要格式化的日期时间对象
  /// - [String format] 可选参数，指定日期时间格式，默认为 formatDefault
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示格式化后的日期时间
  static String format(DateTime date, {String format = formatDefault}) {
    return DateFormat(format).format(date);
  }

  /// 解析日期字符串
  /// 
  /// 参数:
  /// - [String dateString] 要解析的日期字符串
  /// - [String format] 可选参数，指定日期字符串的格式，默认为 formatDefault
  /// 
  /// 返回值:
  /// - 返回一个 DateTime 对象，表示解析后的日期时间
  static DateTime parse(String dateString, {String format = formatDefault}) {
    return DateFormat(format).parse(dateString);
  }

  /// 获取当前时间戳（毫秒）
  /// 
  /// 返回值:
  /// - 返回一个整数，表示当前时间的时间戳（毫秒）
  static int getCurrentTimestamp() => DateTime.now().millisecondsSinceEpoch;

  /// 计算时间差（人性化显示）
  /// 
  /// 参数:
  /// - [DateTime date] 要计算时间差的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示时间差的友好描述（如 "5分钟前"）
  static String getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}秒前';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}小时前';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}天前';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()}月前';
    } else {
      return '${(difference.inDays / 365).floor()}年前';
    }
  }

  /// 检查是否为今天
  /// 
  /// 参数:
  /// - [DateTime date] 要检查的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个布尔值，表示给定的日期是否是今天
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  /// 检查是否为昨天
  /// 
  /// 参数:
  /// - [DateTime date] 要检查的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个布尔值，表示给定的日期是否是昨天
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day;
  }

  /// 添加时间间隔
  /// 
  /// 参数:
  /// - [DateTime date] 要添加时间间隔的日期时间对象
  /// - [Duration duration] 要添加的时间间隔
  /// 
  /// 返回值:
  /// - 返回一个新的 DateTime 对象，表示添加时间间隔后的日期时间
  static DateTime addDuration(DateTime date, Duration duration) {
    return date.add(duration);
  }

  /// 比较两个日期是否相同（忽略时间）
  /// 
  /// 参数:
  /// - [DateTime date1] 第一个日期时间对象
  /// - [DateTime date2] 第二个日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个布尔值，表示两个日期是否相同（忽略时间部分）
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// 获取日期的开始时间（00:00:00）
  /// 
  /// 参数:
  /// - [DateTime date] 要获取开始时间的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个新的 DateTime 对象，表示给定日期的开始时间
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// 获取日期的结束时间（23:59:59）
  /// 
  /// 参数:
  /// - [DateTime date] 要获取结束时间的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个新的 DateTime 对象，表示给定日期的结束时间
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// 获取月份的天数
  /// 
  /// 参数:
  /// - [int year] 年份
  /// - [int month] 月份
  /// 
  /// 返回值:
  /// - 返回一个整数，表示指定月份的天数
  static int getDaysInMonth(int year, int month) {
    final date = DateTime(year, month, 0);
    return date.day;
  }

  /// 获取中文星期名称
  /// 
  /// 参数:
  /// - [DateTime date] 要获取星期名称的日期时间对象
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示给定日期的中文星期名称
  static String getChineseWeekday(DateTime date) {
    switch (date.weekday) {
      case 1:
        return '星期一';
      case 2:
        return '星期二';
      case 3:
        return '星期三';
      case 4:
        return '星期四';
      case 5:
        return '星期五';
      case 6:
        return '星期六';
      case 7:
        return '星期日';
      default:
        return '';
    }
  }

  /// 判断是否为闰年
  /// 
  /// 参数:
  /// - [int year] 要判断的年份
  /// 
  /// 返回值:
  /// - 返回一个布尔值，表示给定的年份是否为闰年
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}