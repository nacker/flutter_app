import 'package:flutter_app/network/dio_client.dart';

class AuthService {
  final DioClient dioClient = DioClient();

  // 登录接口示例
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await dioClient.post('/login', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to login');
    }
  }

  // 注册接口示例
  Future<Map<String, dynamic>> register(String username, String password) async {
    final response = await dioClient.post('/register', {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 201) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to register');
    }
  }

  // 获取用户信息接口示例
  Future<Map<String, dynamic>> fetchUserInfo() async {
    final response = await dioClient.get('/user/me');

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to fetch user info');
    }
  }
}