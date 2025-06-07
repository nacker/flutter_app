# Flutter 应用开发模板 🚀

这是一个基于 Flutter 的应用开发模板，包含了许多实用的封装模块，旨在提升开发效率并提供良好的代码组织。

## 📂 项目结构

```plaintext
/lib
├── main.dart                  # 应用入口
├── provider/                  # 状态管理模块
│   └── counter_provider.dart
├── router/                    # 路由管理模块
│   ├── app_router.dart        # GoRouter 配置
│   └── auth_guard.dart        # 路由守卫
├── network/                   # 网络请求模块
│   └── dio_client.dart        # Dio 封装
├── storage/                   # 本地存储模块
│   └── shared_prefs.dart      # SharedPreferences 封装
├── utils/                     # 工具类模块
│   ├── logger_util.dart       # 日志工具
│   ├── screen_util.dart       # 屏幕适配工具
│   ├── date_util.dart         # 日期处理工具
│   └── device_info_util.dart  # 设备信息工具
├── localization/              # 多语言支持模块
│   └── app_localizations.dart
├── theme/                     # 主题管理模块
│   └── app_theme.dart
├── pages/                     # 页面模块
│   ├── splash_screen.dart     # 开屏页
│   ├── login_page.dart        # 登录页
│   ├── home_page.dart         # 首页
│   ├── profile_page.dart      # 我的页
│   └── tab_bar_page.dart      # TabBar 页
└── services/                  # API 接口服务层
    └── auth_service.dart      # 登录注册接口封装
```

---

## 🧩 功能模块说明

### 1. 状态管理：`provider`
- 使用 `ChangeNotifierProvider` 实现状态共享。
- 示例：`CounterProvider` 提供计数器状态更新与监听。

### 2. 路由管理：`go_router`
- 支持声明式路由配置。
- 支持嵌套路由、重定向、路由守卫等功能。
  - 路由守卫：通过 `AuthGuard` 检查用户是否登录，未登录时跳转到登录页。

### 3. 网络请求：`dio_client`
- 基于 `Dio` 封装的网络请求库。
- 支持拦截器、错误处理、Token 自动注入。
- 示例：GET / POST 请求封装。

### 4. 本地存储：`shared_prefs`
- 使用 `SharedPreferences` 存储 Token 和其他数据。
- 支持任意类型数据存取（泛型方法）。

### 5. 工具类模块：`utils`
- **LoggerUtil**：彩色日志输出，便于调试。
- **ScreenUtil**：屏幕适配工具，支持宽高比、字体自适应。
- **DateUtil**：日期格式化、时间差计算等。
- **DeviceInfoUtil**：获取设备信息。
- **CryptoUtil**：加密解密工具（如 AES 加密、Base64 编码）。

### 6. 多语言支持：`flutter_localizations`
- 使用 `AppLocalizations` 实现国际化资源加载。
- 可扩展多语言 `.arb` 文件。

### 7. 主题管理：`ThemeData`
- 支持亮色/暗色主题切换。
- 支持全局主题设置。

### 8. 页面模块：`pages`
- **SplashScreen**：开屏页，3 秒后根据 Token 状态跳转。
- **LoginPage**：模拟登录并保存 Token。
- **HomePage & ProfilePage**：TabBar 页面内容。
- **TabBarPage**：底部导航栏容器。

### 9. API 接口服务：`services`
- **AuthService**：封装登录、注册、获取用户信息等接口。

---

## 🛠️ 快速开始

### 初始化项目

```bash
flutter pub get
```

### 启动应用

```bash
flutter run
```

### 热重载（调试时使用）

```bash
r
```

### 全局刷新

```bash
R
```

---

## 🔧 常见问题排查

| 问题描述 | 解决方案 |
|----------|-----------|
| 页面跳转失败 | 检查路由配置是否正确，确保 `router.go()` 使用的是同一个 `GoRouter` 实例 |
| Token 未持久化 | 确保调用了 `SharedPrefs.setToken(token)` |
| 适配异常 | 检查 `ScreenUtil.init()` 是否在页面初始化时调用 |
| 日志不显示 | 确保 `LoggerUtil.v/d/i/w/e()` 被正确调用 |

---

## 🌟 下一步建议

- 添加单元测试（`test/` 目录）
- 扩展 API 接口服务层（如 `UserService`, `ProductService`）
- 实现 Token 自动刷新机制
- 添加响应式布局支持（`OrientationBuilder`）
- 集成 Firebase 或其他分析 SDK

---

## 🤝 贡献指南

欢迎提交 PR 或 Issue！如果您希望为该项目做出贡献，请遵循以下步骤：

1. Fork 本仓库。
2. 在您的分支上进行修改。
3. 提交 Pull Request 并描述您的改动。

---

## 📜 许可证

本项目采用 MIT 许可证。详情请查看 [LICENSE](LICENSE) 文件。