import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/profile_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/tab_bar_page.dart'; // 导入 TabBarPage
import 'package:flutter_app/pages/splash_screen.dart'; // 导入 SplashScreen
import 'package:flutter_app/router/auth_guard.dart'; // 导入 AuthGuard

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'SplashScreen',
      builder: (context, state) => const SplashScreen(), // 设置开屏页为根路由
    ),
    GoRoute(
      path: '/login',
      name: 'Login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/tabbar',
      name: 'TabBar',
      builder: (context, state) => const TabBarPage(),
      // 将路由守卫逻辑移到父路由
      redirect: (context, state) async {
        final isAuthenticated = await AuthGuard.checkAuth(context);
        if (!isAuthenticated) {
          return '/login';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'profile',
          name: 'Profile',
          builder: (context, state) => const ProfilePage(),
        ),
        GoRoute(
          path: 'home',
          name: 'Home',
          builder: (context, state) => const HomePage(),
        )
      ],
    ),
  ],
);