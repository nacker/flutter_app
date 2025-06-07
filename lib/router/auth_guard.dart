import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/storage/shared_prefs.dart';

class AuthGuard {
  static Future<bool> checkAuth(BuildContext context) async {
    final token = await SharedPrefs.getToken();
    if (token.isEmpty) {
      // 如果未登录，则跳转到登录页
      context.go('/login');
      return false;
    }
    return true;
  }
}