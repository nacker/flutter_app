// 导入Flutter的核心库
import 'package:flutter/material.dart';
// 导入应用的主页页面
import 'package:flutter_app/pages/home_page.dart';
// 导入应用的个人资料页面
import 'package:flutter_app/pages/profile_page.dart';

/// TabBarPage 是应用的底部导航栏页面。
/// 它是一个 StatefulWidget，表示页面内容可能会动态改变。
/// 底部导航栏允许用户在不同的页面之间切换，如主页和用户个人资料页。
class TabBarPage extends StatefulWidget {
  /// 构造函数，用于创建 TabBarPage 实例。
  /// 可以通过传递 Key 来标识该 Widget。
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

/// _TabBarPageState 是 TabBarPage 的状态类。
/// 它管理页面的状态和交互逻辑。
/// 包括当前选中的页面索引和处理底部导航栏项点击的逻辑。
class _TabBarPageState extends State<TabBarPage> {
  /// _pages 是一个包含所有页面的列表。
  /// 当前包含 HomePage 和 ProfilePage。
  /// 这些页面会在底部导航栏中作为选项显示。
  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  /// _currentIndex 表示当前选中的页面索引。
  /// 初始值为 0，表示默认显示第一个页面（HomePage）。
  int _currentIndex = 0;

  /// _onItemTapped 是一个处理底部导航栏项点击的回调函数。
  /// 当用户点击底部导航栏中的某个项时，该函数会被调用。
  /// 它更新 _currentIndex 并重新构建页面，以显示用户选择的页面。
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// build 方法用于构建页面的 UI。
    /// 
    /// 参数:
    /// - [BuildContext context] 提供了页面的上下文信息，用于导航、主题等操作。
    /// 
    /// 返回值:
    /// - 返回一个 Widget，表示页面的根布局。
    /// 页面包含一个主体内容区域和一个底部导航栏。
    return Scaffold(
      // 设置页面的主体内容为当前选中的页面。
      // 根据 _currentIndex 的值，显示 _pages 列表中的相应页面。
      body: _pages[_currentIndex],
      // 设置页面的底部导航栏。
      // 底部导航栏允许用户在不同的页面之间切换。
      bottomNavigationBar: BottomNavigationBar(
        // 当前选中的页面索引。
        // 根据 _currentIndex 的值，显示对应的导航栏项。
        currentIndex: _currentIndex,
        // 点击底部导航栏项时调用的回调函数。
        // 调用 _onItemTapped 函数，更新 _currentIndex 并重新构建页面。
        onTap: _onItemTapped,
        // 底部导航栏项的列表。
        // 包括首页和用户个人资料页的图标和标签。
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // 首页图标
            label: '首页', // 首页标签
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // 个人中心图标
            label: '个人中心', // 个人中心标签
          ),
        ],
      ),
    );
  }
}