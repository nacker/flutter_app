import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class CryptoUtil {
  static String md5(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static String base64Encode(String plainText) {
    final encodedBytes = utf8.encode(plainText);
    return base64.encode(encodedBytes);
  }

  static String base64Decode(String encodedText) {
    final decodedBytes = base64.decode(encodedText);
    return utf8.decode(decodedBytes);
  }

  static String encryptAES(String plainText, String key) {
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.encrypt(plainText).base64;
  }

  static String decryptAES(String encryptedText, String key) {
    final encrypter = Encrypter(AES(Key.fromUtf8(key)));
    return encrypter.decrypt(Encrypted.fromBase64(encryptedText));
  }
}