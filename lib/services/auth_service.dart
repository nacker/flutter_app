// 导入网络请求客户端，用于处理 API 调用
import 'package:flutter_app/network/dio_client.dart';

/// AuthService 是一个服务类，用于处理用户认证相关的操作。
/// 它提供了登录、注册和获取用户信息的功能。
class AuthService {
  // 创建 DioClient 实例，用于发送 HTTP 请求
  final DioClient dioClient = DioClient();

  /// login 方法用于处理用户登录操作。
  /// 
  /// 参数:
  /// - [String username] 用户名
  /// - [String password] 密码
  /// 
  /// 返回值:
  /// - 返回一个 Future，包含登录成功的响应数据（通常是用户信息和 Token）
  /// 
  /// 异常:
  /// - 如果登录失败，抛出异常
  Future<Map<String, dynamic>> login(String username, String password) async {
    // 发送 POST 请求到 /login 端点，传递用户名和密码
    final response = await dioClient.post('/login', {
      'username': username,
      'password': password,
    });

    // 检查响应状态码是否为 200（成功）
    if (response.statusCode == 200) {
      // 返回响应数据
      return response.data as Map<String, dynamic>;
    } else {
      // 如果登录失败，抛出异常
      throw Exception('Failed to login');
    }
  }

  /// register 方法用于处理用户注册操作。
  /// 
  /// 参数:
  /// - [String username] 用户名
  /// - [String password] 密码
  /// 
  /// 返回值:
  /// - 返回一个 Future，包含注册成功的响应数据
  /// 
  /// 异常:
  /// - 如果注册失败，抛出异常
  Future<Map<String, dynamic>> register(String username, String password) async {
    // 发送 POST 请求到 /register 端点，传递用户名和密码
    final response = await dioClient.post('/register', {
      'username': username,
      'password': password,
    });

    // 检查响应状态码是否为 201（创建成功）
    if (response.statusCode == 201) {
      // 返回响应数据
      return response.data as Map<String, dynamic>;
    } else {
      // 如果注册失败，抛出异常
      throw Exception('Failed to register');
    }
  }

  /// fetchUserInfo 方法用于获取当前登录用户的详细信息。
  /// 
  /// 返回值:
  /// - 返回一个 Future，包含用户信息的响应数据
  /// 
  /// 异常:
  /// - 如果获取用户信息失败，抛出异常
  Future<Map<String, dynamic>> fetchUserInfo() async {
    // 发送 GET 请求到 /user/me 端点，获取用户信息
    final response = await dioClient.get('/user/me');

    // 检查响应状态码是否为 200（成功）
    if (response.statusCode == 200) {
      // 返回响应数据
      return response.data as Map<String, dynamic>;
    } else {
      // 如果获取用户信息失败，抛出异常
      throw Exception('Failed to fetch user info');
    }
  }
}