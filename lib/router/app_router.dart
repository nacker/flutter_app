import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/tab_bar_page.dart'; // 导入 TabBarPage
import 'package:flutter_app/router/auth_guard.dart'; // 导入 AuthGuard

// 定义 AppRouter 类来封装路由配置
class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'TabBar',
        builder: (context, state) => const TabBarPage(), // 使用 TabBarPage 作为根路由
        routes: [
          GoRoute(
            path: 'profile',
            name: 'Profile',
            builder: (context, state) => const ProfilePage(),
            // 添加路由守卫，防止未登录用户访问
            redirect: (context, state) async {
              final isAuthenticated = await AuthGuard.checkAuth(context);
              if (!isAuthenticated) {
                return '/login';
              }
              return null;
            },
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'Login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}