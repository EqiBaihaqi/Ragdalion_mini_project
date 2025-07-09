import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragdalion_news/controller/splash_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 264,
          height: 41,
          child: Image.asset('assets/images/RAGDANews.png'),
        ),
      ),
    );
  }
}
