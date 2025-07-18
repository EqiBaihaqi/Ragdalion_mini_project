import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragdalion_news/page/splash_screen/splash_screen_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
