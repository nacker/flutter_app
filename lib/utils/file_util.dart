import 'dart:io';

class FileUtil {
  static Future<String> getAppDocumentsPath() async {
    final directory = await Directory.systemTemp.parent;
    return directory.path;
  }

  static Future<bool> isFileExists(String path) async {
    return await File(path).exists();
  }

  static Future<void> saveStringToFile(String content, String path) async {
    await File(path).writeAsString(content);
  }

  static Future<String> readStringFromFile(String path) async {
    return await File(path).readAsString();
  }

  static Future<double> getFileSizeInMB(String path) async {
    final file = File(path);
    final size = await file.length();
    return size / (1024 * 1024);
  }
}