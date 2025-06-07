class StringUtil {
  static bool isEmpty(String? str) => str == null || str.isEmpty;

  static bool isNotEmpty(String? str) => !isEmpty(str);

  static String defaultIfEmpty(String? str, String defaultValue) => isEmpty(str) ? defaultValue : str!;

  static String capitalize(String str) {
    if (isEmpty(str)) return str;
    return str[0].toUpperCase() + str.substring(1);
  }

  static bool isEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPhoneNumber(String phone) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }

  static String hidePhoneNumber(String phone) {
    if (phone.length != 11) return phone;
    return phone.replaceRange(3, 7, '****');
  }
}