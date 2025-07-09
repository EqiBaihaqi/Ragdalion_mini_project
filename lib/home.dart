import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/controller/navigation_bar_controller.dart';
import 'package:ragdalion_news/page/dashboard/dashboard_page.dart';
import 'package:ragdalion_news/page/news/news_page.dart';
import 'package:ragdalion_news/page/profile/profile_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationBarController());

    final List<Widget> pages = [DashboardPage(), NewsPage(), ProfilePage()];
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: PersistentTabView(
          context,
          screens: pages,
          hideNavigationBarWhenKeyboardAppears: true,

          items: [
            PersistentBottomNavBarItem(
              icon: Icon(Icons.speed_outlined),
              title: 'Dashboard',
              activeColorPrimary: foundationBlueColor,
              activeColorSecondary: foundationBlueColor,
              inactiveColorPrimary: foundationGreyColor,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(Icons.my_library_books_sharp),
              title: 'News',
              activeColorPrimary: foundationBlueColor,
              activeColorSecondary: foundationBlueColor,
              inactiveColorPrimary: foundationGreyColor,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(Icons.person),
              title: 'Profile',
              activeColorPrimary: foundationBlueColor,
              activeColorSecondary: foundationBlueColor,
              inactiveColorPrimary: foundationGreyColor,
            ),
          ],
          onItemSelected: (value) {
            controller.currentIndex.value = value;
          },
        ),
      ),
    );
  }
}
