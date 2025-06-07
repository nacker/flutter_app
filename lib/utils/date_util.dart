import 'package:intl/intl.dart';

class DateUtil {
  // 常用日期格式
  static const String formatDefault = 'yyyy-MM-dd HH:mm:ss';
  static const String formatDate = 'yyyy-MM-dd';
  static const String formatTime = 'HH:mm:ss';
  static const String formatDateTime = 'yyyy-MM-dd HH:mm';

  /// 格式化日期时间
  static String format(DateTime date, {String format = formatDefault}) {
    return DateFormat(format).format(date);
  }

  /// 解析日期字符串
  static DateTime parse(String dateString, {String format = formatDefault}) {
    return DateFormat(format).parse(dateString);
  }

  /// 获取当前时间戳（毫秒）
  static int getCurrentTimestamp() => DateTime.now().millisecondsSinceEpoch;

  /// 计算时间差（人性化显示）
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
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  /// 检查是否为昨天
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day;
  }

  /// 添加时间间隔
  static DateTime addDuration(DateTime date, Duration duration) {
    return date.add(duration);
  }

  /// 比较两个日期是否相同（忽略时间）
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// 获取日期的开始时间（00:00:00）
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// 获取日期的结束时间（23:59:59）
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  /// 获取月份的天数
  static int getDaysInMonth(int year, int month) {
    final date = DateTime(year, month, 0);
    return date.day;
  }

  /// 获取中文星期名称
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
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}