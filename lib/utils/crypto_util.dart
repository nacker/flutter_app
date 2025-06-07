// 导入 crypto 库，用于加密和哈希操作
import 'package:crypto/crypto.dart';
// 导入 dart:convert，用于字符串编码和解码
import 'dart:convert';
// 导入 encrypt 库，用于高级加密操作
import 'package:encrypt/encrypt.dart';

/// CryptoUtil 是一个工具类，提供各种加密和编码方法。
/// 它包含 MD5 哈希、Base64 编码和解码、AES 加密和解密等功能。
class CryptoUtil {
  /// md5 方法用于生成输入字符串的 SHA-256 哈希值。
  /// 
  /// 参数:
  /// - [String input] 要进行哈希的输入字符串。
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示输入字符串的 SHA-256 哈希值。
  /// 
  /// 示例:
  /// ```dart
  /// String hash = CryptoUtil.md5('hello world');
  /// print(hash); // 输出 SHA-256 哈希值
  /// ```
  static String md5(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// base64Encode 方法用于将普通文本编码为 Base64 格式。
  /// 
  /// 参数:
  /// - [String plainText] 要编码的普通文本。
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示 Base64 编码后的文本。
  /// 
  /// 示例:
  /// ```dart
  /// String encoded = CryptoUtil.base64Encode('hello world');
  /// print(encoded); // 输出 Base64 编码后的字符串
  /// ```
  static String base64Encode(String plainText) {
    final encodedBytes = utf8.encode(plainText);
    return base64.encode(encodedBytes);
  }

  /// base64Decode 方法用于将 Base64 编码的文本解码为普通文本。
  /// 
  /// 参数:
  /// - [String encodedText] 要解码的 Base64 编码文本。
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示解码后的普通文本。
  /// 
  /// 示例:
  /// ```dart
  /// String decoded = CryptoUtil.base64Decode('aGVsbG8gd29ybGQ=');
  /// print(decoded); // 输出解码后的字符串 "hello world"
  /// ```
  static String base64Decode(String encodedText) {
    final decodedBytes = base64.decode(encodedText);
    return utf8.decode(decodedBytes);
  }

  /// encryptAES 方法用于使用 AES 算法加密普通文本。
  /// 
  /// 参数:
  /// - [String plainText] 要加密的普通文本。
  /// - [String key] 加密使用的密钥。
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示加密后的 Base64 编码文本。
  /// 
  /// 示例:
  /// ```dart
  /// String encrypted = CryptoUtil.encryptAES('hello world', 'my_secret_key');
  /// print(encrypted); // 输出加密后的 Base64 编码字符串
  /// ```
  static String encryptAES(String plainText, String key) {
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.encrypt(plainText).base64;
  }

  /// decryptAES 方法用于使用 AES 算法解密加密文本。
  /// 
  /// 参数:
  /// - [String encryptedText] 要解密的加密文本（Base64 编码）。
  /// - [String key] 解密使用的密钥。
  /// 
  /// 返回值:
  /// - 返回一个字符串，表示解密后的普通文本。
  /// 
  /// 示例:
  /// ```dart
  /// String decrypted = CryptoUtil.decryptAES('encrypted_text_here', 'my_secret_key');
  /// print(decrypted); // 输出解密后的字符串 "hello world"
  /// ```
  static String decryptAES(String encryptedText, String key) {
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.decrypt(Encrypted.fromBase64(encryptedText));
  }
}