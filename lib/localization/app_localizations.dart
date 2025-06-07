/// 引入 Flutter 核心组件库（提供 BuildContext 等基础组件能力）
import 'package:flutter/material.dart';
/// 引入 Flutter 基础库（提供 SynchronousFuture 等工具类）
import 'package:flutter/foundation.dart';

/// 本地化资源管理类，负责根据当前语言环境提供对应的字符串资源
class AppLocalizations {
  /// 本地化委托对象，用于注册和加载本地化资源（需在 MaterialApp 中配置）
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// 当前设备的语言环境（如 Locale('en') 表示英语环境）
  final Locale locale;

  /// 构造函数：通过传入的语言环境初始化本地化实例
  AppLocalizations(this.locale);

  /// 从 BuildContext 中获取当前语言环境的本地化实例
  /// 
  /// [context] 组件上下文（用于查找已注册的本地化资源）
  /// 返回值：当前语言环境对应的 AppLocalizations 实例
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  /// 本地化字符串资源表（键为语言代码，值为具体字符串映射）
  /// 示例：'en' 对应英文资源，'zh' 对应中文资源
  static const _localizedValues = {
    'en': {
      /// 英文环境下的页面标题
      'title': 'Flutter Demo Home Page',
    },
    'zh': {
      /// 中文环境下的页面标题
      'title': 'Flutter 示例首页',
    },
  };

  /// 获取当前语言环境下的页面标题
  /// 
  /// 通过当前语言代码（locale.languageCode）从资源表中查找对应标题
  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }
}

/// 本地化委托实现类（负责资源加载和语言支持判断）
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// 构造函数（标记为 const 确保委托对象为编译时常量）
  const _AppLocalizationsDelegate();

  /// 判断当前语言环境是否被支持
  /// 
  /// [locale] 待检查的语言环境（如设备当前设置的语言）
  /// 返回值：true 表示支持（当前支持 'en' 和 'zh'）
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  /// 加载指定语言环境的本地化资源（同步加载）
  /// 
  /// [locale] 需要加载资源的语言环境
  /// 返回值：包含目标语言环境的 AppLocalizations 实例
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  /// 判断是否需要重新加载本地化资源（当前实现无需重新加载）
  /// 
  /// [old] 旧的本地化委托实例
  /// 返回值：false 表示不需要重新加载
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}