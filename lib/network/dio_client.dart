/// 引入 Dio 网络请求库（核心网络请求工具）
import 'package:dio/dio.dart';
/// 引入 Flutter Material 组件库（用于显示 SnackBar 提示）
import 'package:flutter/material.dart';
/// 引入应用全局配置（获取多环境 Base URL）
import 'package:flutter_app/config/app_config.dart';
/// 引入本地存储工具（获取 Token 等用户凭证）
import 'package:flutter_app/storage/shared_prefs.dart';
/// 引入日志工具（打印调试/错误信息）
import 'package:flutter_app/utils/logger_util.dart';

/// 多环境配置枚举（定义应用支持的运行环境类型）
enum Environment {
  dev,   // 开发环境
  test,  // 测试环境
  prod,  // 生产环境
}

/// 基于 Dio 的网络请求客户端（全局单例模式，统一管理网络请求）
class DioClient {
  /// Dio 核心实例（实际执行网络请求的工具）
  late Dio _dio;

  /// 单例模式：私有静态实例（确保全局唯一）
  static final DioClient _instance = DioClient._internal();

  /// 工厂构造函数（返回已创建的单例实例）
  factory DioClient() => _instance;

  /// 私有构造函数（初始化网络配置和拦截器）
  DioClient._internal() {
    // 初始化 Dio 基础配置（从 AppConfig 获取当前环境的 Base URL）
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl, // 动态获取当前环境的接口根路径
      connectTimeout: const Duration(seconds: 30), // 连接超时时间
      receiveTimeout: const Duration(seconds: 30), // 接收响应超时时间
    ));

    // 添加全局拦截器（处理请求/响应/错误的通用逻辑）
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        /// 请求拦截器：处理通用请求头、认证信息和请求日志
        // 1. 设置通用请求头（指定数据格式）
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';

        // 2. 从本地存储获取 Token 并添加到请求头（用于认证）
        final token = await SharedPrefs.getToken();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // 3. 打印请求日志（路径、头信息、参数等）
        LoggerUtil.d('Request: ${options.method} ${options.path}');
        LoggerUtil.d('Headers: ${options.headers}');
        if (options.data != null) {
          LoggerUtil.d('Request Body: ${options.data}');
        }
        if (options.queryParameters.isNotEmpty) {
          LoggerUtil.d('Query Parameters: ${options.queryParameters}');
        }

        return handler.next(options); // 传递请求到下一个拦截器
      },
      onResponse: (response, handler) {
        /// 响应拦截器：打印响应日志（状态码、响应体等）
        LoggerUtil.i('Response: ${response.statusCode} ${response.statusMessage}');
        LoggerUtil.d('Response Body: ${response.data}');

        return handler.next(response); // 传递响应到下一个拦截器
      },
      onError: (DioException e, handler) {
        /// 错误拦截器：统一处理网络错误（类型判断、日志记录、用户提示）
        String errorMessage = 'Unknown Error';
        // 根据错误类型生成可读的错误信息
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = 'Connection timed out';
        } else if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = 'Server response timeout';
        } else if (e.response?.statusCode == 401) {
          errorMessage = 'Unauthorized'; // 未认证（如 Token 过期）
        } else {
          errorMessage = e.message ?? 'Network error'; // 默认错误信息
        }

        // 打印错误日志（包含具体错误详情）
        LoggerUtil.e('Error: $errorMessage');
        LoggerUtil.e('Error Details: ${e.error}');

        // 显示用户友好的错误提示（通过 SnackBar）
        // 注意：需要从响应上下文中获取 BuildContext（需确保请求时传递了 context）
        if (e.response?.extra['context'] is BuildContext) {
          ScaffoldMessenger.of(e.response!.extra['context'] as BuildContext)
              .showSnackBar(SnackBar(content: Text(errorMessage)));
        }

        return handler.next(e); // 传递错误到下一个拦截器
      },
    ));
  }

  /// GET 请求方法（获取资源）
  ///
  /// [url] 请求路径（相对于 Base URL）
  /// [data] 查询参数（会拼接在 URL 后）
  /// 返回值：Dio 响应对象（包含状态码、响应体等信息）
  Future<Response<T>> get<T>(String url, {Map<String, dynamic>? data}) async {
    return await _dio.get(url, queryParameters: data);
  }

  /// POST 请求方法（提交新资源）
  ///
  /// [url] 请求路径（相对于 Base URL）
  /// [data] 请求体（会序列化到请求正文中）
  /// 返回值：Dio 响应对象
  Future<Response<T>> post<T>(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }

  /// PUT 请求方法（更新已有资源）
  ///
  /// [url] 请求路径（相对于 Base URL）
  /// [data] 请求体（包含更新后的数据）
  /// 返回值：Dio 响应对象
  Future<Response<T>> put<T>(String url, dynamic data) async {
    return await _dio.put(url, data: data);
  }

  /// DELETE 请求方法（删除资源）
  ///
  /// [url] 请求路径（相对于 Base URL）
  /// [data] 查询参数（可选，用于传递删除条件）
  /// 返回值：Dio 响应对象
  Future<Response<T>> delete<T>(String url, {Map<String, dynamic>? data}) async {
    return await _dio.delete(url, queryParameters: data);
  }
}