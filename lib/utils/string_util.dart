// StringUtil 是一个工具类，提供了字符串操作的常用方法。
// 它包含判断字符串是否为空、获取默认值、字符串首字母大写、
// 验证邮箱和手机号、以及隐藏手机号中间四位等功能。

class StringUtil {
  // isEmpty 方法用于判断字符串是否为空。
  // 参数:
  // - [String? str] 要判断的字符串，可以为 null。
  // 返回值:
  // - 如果字符串为 null 或空字符串，则返回 true；否则返回 false。
  static bool isEmpty(String? str) => str == null || str.isEmpty;

  // isNotEmpty 方法用于判断字符串是否不为空。
  // 参数:
  // - [String? str] 要判断的字符串，可以为 null。
  // 返回值:
  // - 如果字符串不为 null 且不为空字符串，则返回 true；否则返回 false。
  static bool isNotEmpty(String? str) => !isEmpty(str);

  // defaultIfEmpty 方法用于在字符串为空时返回默认值。
  // 参数:
  // - [String? str] 要检查的字符串，可以为 null。
  // - [String defaultValue] 当字符串为空时返回的默认值。
  // 返回值:
  // - 如果字符串为空，则返回 defaultValue；否则返回原字符串。
  static String defaultIfEmpty(String? str, String defaultValue) => isEmpty(str) ? defaultValue : str!;

  // capitalize 方法用于将字符串的首字母大写。
  // 参数:
  // - [String str] 要转换的字符串。
  // 返回值:
  // - 返回一个新的字符串，首字母大写，其余部分保持不变。
  // 注意:
  // - 如果输入字符串为空或 null，则直接返回原字符串。
  static String capitalize(String str) {
    if (isEmpty(str)) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  // isEmail 方法用于验证字符串是否为有效的邮箱地址。
  // 参数:
  // - [String email] 要验证的邮箱地址。
  // 返回值:
  // - 如果字符串符合邮箱格式，则返回 true；否则返回 false。
  // 邮箱格式要求:
  // - 必须包含 @ 符号。
  // - @ 前后必须有字符。
  // - @ 后必须包含至少一个点号，且点号后至少有两个字符。
  static bool isEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // isPhoneNumber 方法用于验证字符串是否为有效的中国大陆手机号。
  // 参数:
  // - [String phone] 要验证的手机号。
  // 返回值:
  // - 如果字符串符合手机号格式，则返回 true；否则返回 false。
  // 手机号格式要求:
  // - 必须以 1 开头，第二位为 3 到 9 的数字。
  // - 总长度为 11 位。
  static bool isPhoneNumber(String phone) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }

  // hidePhoneNumber 方法用于隐藏手机号的中间四位数字。
  // 参数:
  // - [String phone] 要处理的手机号。
  // 返回值:
  // - 如果手机号长度为 11 位，则返回隐藏中间四位后的字符串（如 138****1234）；
  // - 如果手机号长度不为 11 位，则直接返回原字符串。
  static String hidePhoneNumber(String phone) {
    if (phone.length != 11) return phone;
    return phone.replaceRange(3, 7, '****');
  }
}