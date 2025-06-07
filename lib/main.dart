import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_config.dart'; // 导入 AppConfig
import 'network/dio_client.dart';
import 'router/app_router.dart';
import 'provider/counter_provider.dart';
import 'theme/app_theme.dart';
import 'storage/shared_prefs.dart'; // 导入 SharedPrefs
import 'utils/context_util.dart'; // 导入 ContextUtil
import 'package:flutter_app/router/app_router.dart';
import 'pages/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  // 初始化 AppConfig，设置为生产环境
  AppConfig.init(env: Environment.dev);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 初始化全局上下文
    ContextUtil.init(context);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('zh', ''), // Chinese
      ],
      routerConfig: router, // 使用 AppRouter 的路由配置
    );
  }
}