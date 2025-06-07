// 导入 Dart 的 io 库，用于文件和目录操作
import 'dart:io';

/// FileUtil 是一个工具类，提供了与文件操作相关的实用方法。
/// 它封装了常见的文件操作，如获取应用文档路径、检查文件是否存在、读写文件内容等。
class FileUtil {
  /// getAppDocumentsPath 是一个异步方法，用于获取应用的文档目录路径。
  /// 
  /// 返回值:
  /// - 返回一个 Future<String>，表示应用文档目录的路径。
  /// 
  /// 异常:
  /// - 如果无法获取目录路径，可能会抛出异常。
  static Future<String> getAppDocumentsPath() async {
    final directory = await Directory.systemTemp.parent;
    return directory.path;
  }

  /// isFileExists 是一个异步方法，用于检查指定路径的文件是否存在。
  /// 
  /// 参数:
  /// - [String path] 要检查的文件路径。
  /// 
  /// 返回值:
  /// - 返回一个 Future<bool>，表示文件是否存在。
  ///   - 如果文件存在，返回 true。
  ///   - 如果文件不存在，返回 false。
  static Future<bool> isFileExists(String path) async {
    return await File(path).exists();
  }

  /// saveStringToFile 是一个异步方法，用于将字符串内容保存到指定路径的文件中。
  /// 
  /// 参数:
  /// - [String content] 要保存的字符串内容。
  /// - [String path] 文件的保存路径。
  /// 
  /// 返回值:
  /// - 返回一个 Future<void>，表示保存操作完成。
  /// 
  /// 异常:
  /// - 如果保存过程中发生错误，可能会抛出异常。
  static Future<void> saveStringToFile(String content, String path) async {
    await File(path).writeAsString(content);
  }

  /// readStringFromFile 是一个异步方法，用于从指定路径的文件中读取字符串内容。
  /// 
  /// 参数:
  /// - [String path] 文件的路径。
  /// 
  /// 返回值:
  /// - 返回一个 Future<String>，表示文件中的字符串内容。
  /// 
  /// 异常:
  /// - 如果文件不存在或读取过程中发生错误，可能会抛出异常。
  static Future<String> readStringFromFile(String path) async {
    return await File(path).readAsString();
  }

  /// getFileSizeInMB 是一个异步方法，用于获取指定路径文件的大小（以 MB 为单位）。
  /// 
  /// 参数:
  /// - [String path] 文件的路径。
  /// 
  /// 返回值:
  /// - 返回一个 Future<double>，表示文件的大小（以 MB 为单位）。
  /// 
  /// 异常:
  /// - 如果文件不存在或获取大小过程中发生错误，可能会抛出异常。
  static Future<double> getFileSizeInMB(String path) async {
    final file = File(path);
    final size = await file.length();
    return size / (1024 * 1024);
  }
}