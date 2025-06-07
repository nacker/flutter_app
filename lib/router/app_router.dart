// 导入Flutter的核心库
import 'package:flutter/material.dart';
// 导入GoRouter库，用于实现路由管理
import 'package:go_router/go_router.dart';
// 导入应用的主页页面
import 'package:flutter_app/pages/home_page.dart';
// 导入应用的个人资料页面
import 'package:flutter_app/pages/profile_page.dart';
// 导入应用的登录页面
import 'package:flutter_app/pages/login_page.dart';
// 导入应用的底部导航栏页面
import 'package:flutter_app/pages/tab_bar_page.dart';
// 导入应用的开屏页
import 'package:flutter_app/pages/splash_screen.dart';
// 导入路由守卫，用于保护需要认证的路由
import 'package:flutter_app/router/auth_guard.dart';

/// 定义应用的路由配置
/// 使用GoRouter实现路由管理，支持声明式路由配置
final GoRouter router = GoRouter(
  routes: [
    /// 开屏页路由配置
    /// 路径为根路径 '/'
    /// 名称为 'SplashScreen'
    /// 构建函数返回SplashScreen实例
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => const SplashScreen(),
    ),
    /// 登录页路由配置
    /// 路径为 '/login'
    /// 名称为 'Login'
    /// 构建函数返回LoginPage实例
    GoRoute(
      path: '/login',
      name: 'Login',
      builder: (context, state) => const LoginPage(),
    ),
    /// 底部导航栏路由配置
    /// 路径为 '/tabbar'
    /// 名称为 'TabBar'
    /// 构建函数返回TabBarPage实例
    /// 包含子路由配置，用于管理需要认证的页面
    GoRoute(
      path: '/tabbar',
      name: 'TabBar',
      builder: (context, state) => const TabBarPage(),
      // 将路由守卫逻辑移到父路由
      // 在访问子路由之前，检查用户是否已认证
      // 如果未认证，重定向到登录页
      redirect: (context, state) async {
        final isAuthenticated = await AuthGuard.checkAuth(context);
        if (!isAuthenticated) {
          return '/login';
        }
        return null;
      },
      routes: [
        /// 个人资料页子路由配置
        /// 路径为 '/tabbar/profile'
        /// 名称为 'Profile'
        /// 构建函数返回ProfilePage实例
        GoRoute(
          path: 'profile',
          name: 'Profile',
          builder: (context, state) => const ProfilePage(),
        ),
        /// 主页子路由配置
        /// 路径为 '/tabbar/home'
        /// 名称为 'Home'
        /// 构建函数返回HomePage实例
        GoRoute(
          path: 'home',
          name: 'Home',
          builder: (context, state) => const HomePage(),
        )
      ],
    ),
  ],
);