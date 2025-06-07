import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_config.dart';
import 'package:flutter_app/storage/shared_prefs.dart';
import 'package:flutter_app/utils/logger_util.dart'; // 导入 LoggerUtil

// 多环境配置
enum Environment {
  dev,
  test,
  prod,
}

class DioClient {
  late Dio _dio;

  // 单例模式
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  DioClient._internal() {
    // 从 AppConfig 获取当前 Base URL
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl, // 使用全局配置的 Base URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    // 初始化拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 添加通用 Headers
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';

        // 从 SharedPrefs 获取 Token 并添加到请求头
        final token = await SharedPrefs.getToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // 打印请求信息
        LoggerUtil.d('Request: ${options.method} ${options.path}');
        LoggerUtil.d('Headers: ${options.headers}');
        if (options.data != null) {
          LoggerUtil.d('Request Body: ${options.data}');
        }
        if (options.queryParameters.isNotEmpty) {
          LoggerUtil.d('Query Parameters: ${options.queryParameters}');
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 打印响应信息
        LoggerUtil.i('Response: ${response.statusCode} ${response.statusMessage}');
        LoggerUtil.d('Response Body: ${response.data}');

        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // 错误统一处理
        String errorMessage = 'Unknown Error';
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = 'Connection timed out';
        } else if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = 'Server response timeout';
        } else if (e.response?.statusCode == 401) {
          errorMessage = 'Unauthorized';
        } else {
          errorMessage = e.message ?? 'Network error';
        }

        // 打印错误详情
        LoggerUtil.e('Error: $errorMessage');
        LoggerUtil.e('Error Details: ${e.error}');

        ScaffoldMessenger.of(e.response?.extra['context'] as BuildContext)
            .showSnackBar(SnackBar(content: Text(errorMessage)));

        return handler.next(e);
      },
    ));
  }

  // GET 请求
  Future<Response<T>> get<T>(String url, {Map<String, dynamic>? data}) async {
    return await _dio.get(url, queryParameters: data);
  }

  // POST 请求
  Future<Response<T>> post<T>(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  // PUT 请求
  Future<Response<T>> put<T>(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  // DELETE 请求
  Future<Response<T>> delete<T>(String url, {Map<String, dynamic>? data}) async {
    return await _dio.delete(url, queryParameters: data);
  }
}