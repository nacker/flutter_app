// 导入 Flutter 的 Material 组件库，用于构建用户界面
import 'package:flutter/material.dart';
// 导入 Provider 库，用于状态管理
import 'package:provider/provider.dart';
// 导入 Flutter 的本地化支持库，用于多语言支持
import 'package:flutter_localizations/flutter_localizations.dart';

// 导入应用配置类，用于管理应用的环境配置
import 'config/app_config.dart'; 
// 导入网络请求客户端，用于处理 API 调用
import 'network/dio_client.dart';
// 导入应用的路由配置
import 'router/app_router.dart';
// 导入计数器的状态管理类
import 'provider/counter_provider.dart';
// 导入应用的主题配置
import 'theme/app_theme.dart';
// 导入本地存储工具，用于持久化数据
import 'storage/shared_prefs.dart'; 
// 导入上下文工具，用于全局访问 BuildContext
import 'utils/context_util.dart';


// 应用的入口点，定义了应用的启动逻辑
void main() async {
  // 确保 Flutter 绑定初始化完成，这是 Flutter 应用启动的第一步
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化本地存储，确保在应用启动时准备好存储功能
  await SharedPrefs.init();

  // 初始化应用配置，设置当前环境为开发环境
  AppConfig.init(env: Environment.dev);

  // 启动应用，使用 MultiProvider 包裹根组件，提供全局状态管理
  runApp(
    MultiProvider(
      providers: [
        // 提供计数器的状态管理类，使用 ChangeNotifierProvider 管理状态
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      // 应用的根组件，定义了应用的基本结构和主题
      child: const MyApp(),
    ),
  );
}

// MyApp 是应用的根组件，继承自 StatelessWidget，表示应用的 UI 不会动态改变
class MyApp extends StatelessWidget {
  // 构造函数，使用 const 关键字表示该组件是不可变的
  const MyApp({super.key});

  // build 方法用于构建应用的 UI
  @override
  Widget build(BuildContext context) {
    // 初始化全局上下文，方便在非 Widget 上下文中访问 BuildContext
    ContextUtil.init(context);

    // 返回 MaterialApp.router，使用路由配置管理页面导航
    return MaterialApp.router(
      // 应用的标题，显示在任务管理器或窗口标题栏
      title: 'Flutter Demo',
      // 应用的亮色主题配置
      theme: AppTheme.lightTheme,
      // 应用的暗色主题配置
      darkTheme: AppTheme.darkTheme,
      // 主题模式，根据系统设置自动切换亮色或暗色主题
      themeMode: ThemeMode.system,
      // 本地化委托，支持多语言和本地化资源
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 支持的语言列表，当前支持英语和中文
      supportedLocales: const [
        Locale('en', ''), // 英语
        Locale('zh', ''), // 中文
      ],
      // 应用的路由配置，使用 GoRouter 实现声明式路由
      routerConfig: router, // 使用 AppRouter 的路由配置
    );
  }
}