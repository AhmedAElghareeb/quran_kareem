import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_kareem/core/utils/app_providers.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/home/home_screen.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/layout/widgets/bottom_navigation_bar_item.dart';
import 'package:quran_kareem/src/presentations/views/layout_views/settings/settings_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final PageController _pageController;
  late final List<Widget> _pages;

  int _currentIndex = 0;

  void _onPageChangedToCurrent(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pages = [
      HomeScreen(
        key: PageStorageKey('HomeScreen'),
      ),
      SettingsScreen(
        key: PageStorageKey('SettingsScreen'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders.providers,
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(_pages.length, (index) => _pages[index]),
        ),
        bottomNavigationBar: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: EdgeInsetsDirectional.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              height: 1.9,
            ),
            fixedColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: [
              buildBottomNavigationBarItem(
                icon: Icons.home,
                color: _currentIndex == 0 ? Colors.black : Colors.grey,
                title: 'Home',
              ),
              buildBottomNavigationBarItem(
                icon: Icons.settings,
                color: _currentIndex == 0 ? Colors.black : Colors.grey,
                title: 'Settings',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) => _onPageChangedToCurrent(index),
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
